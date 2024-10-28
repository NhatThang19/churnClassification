package com.example.churnClassification.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.churnClassification.domain.Customer;

import jakarta.validation.Valid;
import weka.classifiers.Classifier;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

@Controller
public class PredictionController {

    @GetMapping("/")
    public String getValues(Model model) throws URISyntaxException {
        Customer customer = new Customer();
        customer.setSeniorCitizen(-1);
        model.addAttribute("customer", customer);
        return "input";
    }

    @PostMapping("/predict")
    public String predict(Model model, @ModelAttribute("customer") @Valid Customer customer,
            BindingResult newUserBindingResult) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "input";
        }

        InputStream modelStream = null;
        InputStream arffStream = null; // Khai báo biến cho arffStream
        try {
            // Load mô hình
            modelStream = getClass().getClassLoader().getResourceAsStream("churnModel.model");
            if (modelStream == null) {
                throw new FileNotFoundException("Không tìm thấy file mô hình: churnModel.model");
            }
            Classifier classifier = (Classifier) weka.core.SerializationHelper.read(modelStream);

            // Tạo Instances từ file ARFF
            arffStream = getClass().getClassLoader().getResourceAsStream("trainning-1.arff");
            if (arffStream == null) {
                throw new FileNotFoundException("Không tìm thấy file ARFF: trainning-1.arff");
            }
            Instances dataset = new ConverterUtils.DataSource(arffStream).getDataSet();
            dataset.setClassIndex(dataset.numAttributes() - 1); // Đặt chỉ mục lớp

            // Phân loại
            PredictionResult result = classifyCustomer(customer, classifier, dataset);

            model.addAttribute("result", result);
            model.addAttribute("customer", customer);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng stream
            if (modelStream != null) {
                try {
                    modelStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (arffStream != null) {
                try {
                    arffStream.close(); // Đóng arffStream
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "resultPage";
    }

    public PredictionResult classifyCustomer(Customer customer, Classifier classifier, Instances dataset)
            throws Exception {
        // Tạo một Instance mới với số lượng thuộc tính giống như trong dataset
        Instance instance = new DenseInstance(dataset.numAttributes());
        instance.setDataset(dataset); // Đặt dataset cho instance

        // Gán giá trị cho các thuộc tính với kiểm tra
        setValueWithCheck(instance, dataset, "gender", customer.getGender());
        setValueWithCheck(instance, dataset, "SeniorCitizen", customer.getSeniorCitizen()); // Cập nhật dòng này
        setValueWithCheck(instance, dataset, "Partner", customer.getPartner());
        setValueWithCheck(instance, dataset, "Dependents", customer.getDependents());
        setValueWithCheck(instance, dataset, "tenure", customer.getTenure()); // Cập nhật giá trị đúng
        setValueWithCheck(instance, dataset, "PhoneService", customer.getPhoneService());
        setValueWithCheck(instance, dataset, "MultipleLines", customer.getMultipleLines());
        setValueWithCheck(instance, dataset, "InternetService", customer.getInternetService());
        setValueWithCheck(instance, dataset, "OnlineSecurity", customer.getOnlineSecurity());
        setValueWithCheck(instance, dataset, "OnlineBackup", customer.getOnlineBackup());
        setValueWithCheck(instance, dataset, "DeviceProtection", customer.getDeviceProtection());
        setValueWithCheck(instance, dataset, "TechSupport", customer.getTechSupport());
        setValueWithCheck(instance, dataset, "StreamingTV", customer.getStreamingTV());
        setValueWithCheck(instance, dataset, "Contract", customer.getContract());
        setValueWithCheck(instance, dataset, "StreamingMovies", customer.getStreamingMovies());
        setValueWithCheck(instance, dataset, "PaperlessBilling", customer.getPaperlessBilling());
        setValueWithCheck(instance, dataset, "PaymentMethod", customer.getPaymentMethod());
        instance.setValue(dataset.attribute("MonthlyCharges"), customer.getMonthlyCharges());
        instance.setValue(dataset.attribute("TotalCharges"), customer.getTotalCharges());

        // Phân loại
        double classIndex = classifier.classifyInstance(instance);

        // Lấy tên của lớp dự đoán
        String predictedClass = dataset.classAttribute().value((int) classIndex);

        double[] distribution = classifier.distributionForInstance(instance);
        double yesPercentage = distribution[dataset.classAttribute().indexOfValue("Yes")] * 100;
        double noPercentage = distribution[dataset.classAttribute().indexOfValue("No")] * 100;

        // Thêm tỷ lệ phần trăm vào kết quả trả về
        String result = String.format("Dự đoán loại: %s (Yes: %.2f%%, No: %.2f%%)",
                dataset.classAttribute().value((int) classifier.classifyInstance(instance)),
                yesPercentage, noPercentage);

        return new PredictionResult(predictedClass, yesPercentage, noPercentage);
    }

    private void setValueWithCheck(Instance instance, Instances dataset, String attributeName, Object value)
            throws Exception {
        // Lấy thuộc tính từ dataset
        Attribute attribute = dataset.attribute(attributeName);
        if (attribute == null) {
            throw new IllegalArgumentException("Attribute '" + attributeName + "' does not exist in the dataset.");
        }

        // Kiểm tra xem thuộc tính là kiểu nominal hay numeric
        if (attribute.isNominal()) {
            instance.setValue(attribute, (String) value);
        } else if (attribute.isNumeric()) {
            if (value instanceof Integer) {
                instance.setValue(attribute, ((Integer) value).doubleValue()); // Chuyển đổi int sang double
            } else if (value instanceof Double) {
                instance.setValue(attribute, (Double) value); // Đối với giá trị double
            } else {
                throw new IllegalArgumentException("Unsupported numeric value type for '" + attributeName + "'.");
            }
        } else {
            throw new IllegalArgumentException("Unsupported attribute type for '" + attributeName + "'.");
        }
    }

    public class PredictionResult {
        private String predictedClass;
        private double yesPercentage;
        private double noPercentage;

        public PredictionResult(String predictedClass, double yesPercentage, double noPercentage) {
            this.predictedClass = predictedClass;
            this.yesPercentage = yesPercentage;
            this.noPercentage = noPercentage;
        }

        public String getPredictedClass() {
            return predictedClass;
        }

        public double getYesPercentage() {
            return yesPercentage;
        }

        public double getNoPercentage() {
            return noPercentage;
        }
    }

}
