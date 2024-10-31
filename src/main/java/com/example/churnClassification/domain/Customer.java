package com.example.churnClassification.domain;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

public class Customer {

    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String gender;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String seniorCitizen;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String partner;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String dependents;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private int tenureMonths;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String phoneService;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String multipleLines;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String internetService;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String onlineSecurity;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String onlineBackup;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String deviceProtection;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String techSupport;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String streamingTV;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String streamingMovies;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String contract;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String paperlessBilling;
    @NotBlank(message = "Giá trị này không được để trống!!!")
    private String paymentMethod;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private double monthlyCharges;
    @Min(value = 1, message = "Giá trị phải lớn hơn 0!")
    private double totalCharges;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSeniorCitizen() {
        return seniorCitizen;
    }

    public void setSeniorCitizen(String seniorCitizen) {
        this.seniorCitizen = seniorCitizen;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getDependents() {
        return dependents;
    }

    public void setDependents(String dependents) {
        this.dependents = dependents;
    }

    public int getTenureMonths() {
        return tenureMonths;
    }

    public void setTenureMonths(int tenureMonths) {
        this.tenureMonths = tenureMonths;
    }

    public String getPhoneService() {
        return phoneService;
    }

    public void setPhoneService(String phoneService) {
        this.phoneService = phoneService;
    }

    public String getMultipleLines() {
        return multipleLines;
    }

    public void setMultipleLines(String multipleLines) {
        this.multipleLines = multipleLines;
    }

    public String getInternetService() {
        return internetService;
    }

    public void setInternetService(String internetService) {
        this.internetService = internetService;
    }

    public String getOnlineSecurity() {
        return onlineSecurity;
    }

    public void setOnlineSecurity(String onlineSecurity) {
        this.onlineSecurity = onlineSecurity;
    }

    public String getOnlineBackup() {
        return onlineBackup;
    }

    public void setOnlineBackup(String onlineBackup) {
        this.onlineBackup = onlineBackup;
    }

    public String getDeviceProtection() {
        return deviceProtection;
    }

    public void setDeviceProtection(String deviceProtection) {
        this.deviceProtection = deviceProtection;
    }

    public String getTechSupport() {
        return techSupport;
    }

    public void setTechSupport(String techSupport) {
        this.techSupport = techSupport;
    }

    public String getStreamingTV() {
        return streamingTV;
    }

    public void setStreamingTV(String streamingTV) {
        this.streamingTV = streamingTV;
    }

    public String getStreamingMovies() {
        return streamingMovies;
    }

    public void setStreamingMovies(String streamingMovies) {
        this.streamingMovies = streamingMovies;
    }

    public String getContract() {
        return contract;
    }

    public void setContract(String contract) {
        this.contract = contract;
    }

    public String getPaperlessBilling() {
        return paperlessBilling;
    }

    public void setPaperlessBilling(String paperlessBilling) {
        this.paperlessBilling = paperlessBilling;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getMonthlyCharges() {
        return monthlyCharges;
    }

    public void setMonthlyCharges(double monthlyCharges) {
        this.monthlyCharges = monthlyCharges;
    }

    public double getTotalCharges() {
        return totalCharges;
    }

    public void setTotalCharges(double totalCharges) {
        this.totalCharges = totalCharges;
    }

}
