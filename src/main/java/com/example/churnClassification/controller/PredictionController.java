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

        // Khai báo biến file đầu vào
        InputStream modelStream = null;
        InputStream arffStream = null;
        try {
            // Load mô hình
            modelStream = getClass().getClassLoader().getResourceAsStream("smote.model");
            if (modelStream == null) {
                throw new FileNotFoundException("Không tìm thấy file mô hình!!!");
            }
            Classifier classifier = (Classifier) weka.core.SerializationHelper.read(modelStream);

            // Tạo Instances từ file ARFF
            arffStream = getClass().getClassLoader().getResourceAsStream("Churn-preprocess.arff");
            if (arffStream == null) {
                throw new FileNotFoundException("Không tìm thấy file ARFF!!!");
            }
            Instances dataset = new ConverterUtils.DataSource(arffStream).getDataSet();
            // Đặt chỉ mục lớp
            dataset.setClassIndex(dataset.numAttributes() - 1);

            // Phân loại
            PredictionResult result = classifyCustomer(customer, classifier, dataset);

            model.addAttribute("result", result);
            model.addAttribute("customer", customer);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (modelStream != null) {
                try {
                    modelStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (arffStream != null) {
                try {
                    arffStream.close();
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
        // Đặt dataset cho instance
        instance.setDataset(dataset);

        // Gán giá trị thuộc tính
        instance.setValue(dataset.attribute("gender"), customer.getGender());
        instance.setValue(dataset.attribute("seniorCitizen"), customer.getSeniorCitizen());
        instance.setValue(dataset.attribute("partner"), customer.getPartner());
        instance.setValue(dataset.attribute("dependents"), customer.getDependents());
        instance.setValue(dataset.attribute("tenureMonths"), customer.getTenureMonths());
        instance.setValue(dataset.attribute("phoneService"), customer.getPhoneService());
        instance.setValue(dataset.attribute("multipleLines"), customer.getMultipleLines());
        instance.setValue(dataset.attribute("internetService"), customer.getInternetService());
        instance.setValue(dataset.attribute("onlineSecurity"), customer.getOnlineSecurity());
        instance.setValue(dataset.attribute("onlineBackup"), customer.getOnlineBackup());
        instance.setValue(dataset.attribute("deviceProtection"), customer.getDeviceProtection());
        instance.setValue(dataset.attribute("techSupport"), customer.getTechSupport());
        instance.setValue(dataset.attribute("streamingTV"), customer.getStreamingTV());
        instance.setValue(dataset.attribute("contract"), customer.getContract());
        instance.setValue(dataset.attribute("streamingMovies"), customer.getStreamingMovies());
        instance.setValue(dataset.attribute("paperlessBilling"), customer.getPaperlessBilling());
        instance.setValue(dataset.attribute("paymentMethod"), customer.getPaymentMethod());
        instance.setValue(dataset.attribute("monthlyCharges"), customer.getMonthlyCharges());
        instance.setValue(dataset.attribute("totalCharges"), customer.getTotalCharges());

        // Phân loại
        double classIndex = classifier.classifyInstance(instance);

        // Lấy tên của lớp dự đoán
        String predictedClass = dataset.classAttribute().value((int) classIndex);

        // Lấy tỷ lệ % yes và no
        double[] distribution = classifier.distributionForInstance(instance);
        double yesPercentage = distribution[dataset.classAttribute().indexOfValue("Yes")] * 100;
        double noPercentage = distribution[dataset.classAttribute().indexOfValue("No")] * 100;

        return new PredictionResult(predictedClass, yesPercentage, noPercentage);
    }

    // Đối tượng để lấy kết quả dự đoán
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
