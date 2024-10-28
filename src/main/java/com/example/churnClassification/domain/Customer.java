package com.example.churnClassification.domain;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;

public class Customer {

    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String gender;
    @PositiveOrZero(message = "Giá trị này không được để trống!!!")
    private int SeniorCitizen;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String Partner;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String Dependents;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private int tenure;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String PhoneService;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String MultipleLines;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String InternetService;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String OnlineSecurity;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String OnlineBackup;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String DeviceProtection;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String TechSupport;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String StreamingTV;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String Contract;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String StreamingMovies;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String PaperlessBilling;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String PaymentMethod;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private double MonthlyCharges;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private double TotalCharges;

    public int getSeniorCitizen() {
        return SeniorCitizen;
    }

    public void setSeniorCitizen(int seniorCitizen) {
        SeniorCitizen = seniorCitizen;
    }

    public String getPartner() {
        return Partner;
    }

    public void setPartner(String partner) {
        Partner = partner;
    }

    public String getDependents() {
        return Dependents;
    }

    public void setDependents(String dependents) {
        Dependents = dependents;
    }

    public int getTenure() {
        return tenure;
    }

    public void setTenure(int tenure) {
        this.tenure = tenure;
    }

    public String getPhoneService() {
        return PhoneService;
    }

    public void setPhoneService(String phoneService) {
        PhoneService = phoneService;
    }

    public String getMultipleLines() {
        return MultipleLines;
    }

    public void setMultipleLines(String multipleLines) {
        MultipleLines = multipleLines;
    }

    public String getInternetService() {
        return InternetService;
    }

    public void setInternetService(String internetService) {
        InternetService = internetService;
    }

    public String getOnlineSecurity() {
        return OnlineSecurity;
    }

    public void setOnlineSecurity(String onlineSecurity) {
        OnlineSecurity = onlineSecurity;
    }

    public String getOnlineBackup() {
        return OnlineBackup;
    }

    public void setOnlineBackup(String onlineBackup) {
        OnlineBackup = onlineBackup;
    }

    public String getDeviceProtection() {
        return DeviceProtection;
    }

    public void setDeviceProtection(String deviceProtection) {
        DeviceProtection = deviceProtection;
    }

    public String getTechSupport() {
        return TechSupport;
    }

    public void setTechSupport(String techSupport) {
        TechSupport = techSupport;
    }

    public String getStreamingTV() {
        return StreamingTV;
    }

    public void setStreamingTV(String streamingTV) {
        StreamingTV = streamingTV;
    }

    public String getStreamingMovies() {
        return StreamingMovies;
    }

    public void setStreamingMovies(String streamingMovies) {
        StreamingMovies = streamingMovies;
    }

    public String getPaperlessBilling() {
        return PaperlessBilling;
    }

    public void setPaperlessBilling(String paperlessBilling) {
        PaperlessBilling = paperlessBilling;
    }

    public double getMonthlyCharges() {
        return MonthlyCharges;
    }

    public void setMonthlyCharges(double monthlyCharges) {
        MonthlyCharges = monthlyCharges;
    }

    public double getTotalCharges() {
        return TotalCharges;
    }

    public void setTotalCharges(double totalCharges) {
        TotalCharges = totalCharges;
    }

    public String getContract() {
        return Contract;
    }

    public void setContract(String contract) {
        Contract = contract;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        PaymentMethod = paymentMethod;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
