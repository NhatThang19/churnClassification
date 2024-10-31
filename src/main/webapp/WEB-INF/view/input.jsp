<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Input values</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap"
                    rel="stylesheet">
                <style>
                    body {
                        font-family: "Roboto Mono", monospace;
                        background-image: linear-gradient(-20deg, #d558c8 0%, #24d292 100%);
                    }
                </style>
            </head>

            <body class="p-5">
                <h1 class="text-center mb-5">Dự đoán khả năng rời bỏ của khách hàng</h1>
                <div class="mx-5">
                    <h3>Liệu người dùng sẽ rời bỏ hay ở lại?</h3>
                    <p>Nhập thông tin vào form và nhấm submit để dự đoán.</p>
                    <hr class="border border-2 border-success-subtle opacity-75 my-4">
                </div>
                <form:form class="mx-5" modelAttribute="customer" method="post" action="predict">
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorGender">
                                <form:errors path="gender" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Gender" class="form-label">gender</label>
                            <form:select class="form-select ${not empty errorGender? 'is-invalid':''}" id="Gender"
                                path="gender">
                                <option value="" disabled selected>Mở lên để chọn</option>
                                <form:option value="Male">Male</form:option>
                                <form:option value="Female">Female</form:option>
                            </form:select>
                            ${errorGender}
                        </div>
                        <div class="col-6">
                            <c:set var="errorSeniorCitizen">
                                <form:errors path="seniorCitizen" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="SeniorCitizen" class="form-label">seniorCitizen</label>
                            <form:select class="form-select ${not empty errorSeniorCitizen? 'is-invalid':''}"
                                id="SeniorCitizen" path="seniorCitizen">
                                <option value="" disabled selected>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorSeniorCitizen}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorPartner">
                                <form:errors path="partner" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Partner" class="form-label">partner</label>
                            <form:select class="form-select ${not empty errorPartner? 'is-invalid':''}" id="Partner"
                                path="partner">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorPartner}
                        </div>
                        <div class="col-6">
                            <c:set var="errorDependents">
                                <form:errors path="dependents" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Dependents" class="form-label">dependents</label>
                            <form:select class="form-select  ${not empty errorDependents? 'is-invalid':''}"
                                id="Dependents" path="dependents">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorDependents}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errortenure">
                                <form:errors path="tenureMonths" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="tenure" class="form-label">tenureMonths</label>
                            <form:input type="number" class="form-control ${not empty errortenure? 'is-invalid':''}"
                                id="tenure" path="tenureMonths" />
                            ${errortenure}
                        </div>
                        <div class="col-6">
                            <c:set var="errorPhoneService">
                                <form:errors path="phoneService" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PhoneService" class="form-label">phoneService</label>
                            <form:select class="form-select ${not empty errorPhoneService? 'is-invalid':''}"
                                id="PhoneService" path="phoneService">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorPhoneService}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorMultipleLines">
                                <form:errors path="multipleLines" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="MultipleLines" class="form-label">multipleLines</label>
                            <form:select class="form-select ${not empty errorMultipleLines? 'is-invalid':''}"
                                id="MultipleLines" path="multipleLines">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No phone service">No phone service</form:option>
                            </form:select>
                            ${errorMultipleLines}
                        </div>
                        <div class="col-6">
                            <c:set var="errorInternetService">
                                <form:errors path="internetService" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="InternetService" class="form-label">
                                internetService</label>
                            <form:select class="form-select ${not empty errorInternetService? 'is-invalid':''}"
                                id="InternetService" path="internetService">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Fiber optic">Fiber optic</form:option>
                                <form:option value="DSL">DSL</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorInternetService}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorOnlineSecurity">
                                <form:errors path="onlineSecurity" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="OnlineSecurity" class="form-label">onlineSecurity</label>
                            <form:select class="form-select ${not empty errorOnlineSecurity? 'is-invalid':''}"
                                id="OnlineSecurity" path="onlineSecurity">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorOnlineSecurity}
                        </div>
                        <div class="col-6">
                            <c:set var="errorOnlineBackup">
                                <form:errors path="onlineBackup" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="onlineBackup" class="form-label">onlineBackup</label>
                            <form:select class="form-select ${not empty errorOnlineBackup? 'is-invalid':''}"
                                id="OnlineBackup" path="onlineBackup">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorOnlineBackup}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorDeviceProtection">
                                <form:errors path="deviceProtection" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="DeviceProtection" class="form-label">deviceProtection</label>
                            <form:select class="form-select ${not empty errorDeviceProtection? 'is-invalid':''}"
                                id="DeviceProtection" path="deviceProtection">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorDeviceProtection}
                        </div>
                        <div class="col-6">
                            <c:set var="errorPaymentMethod">
                                <form:errors path="paymentMethod" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PaymentMethod" class="form-label">paymentMethod</label>
                            <form:select class="form-select ${not empty errorPaymentMethod? 'is-invalid':''}"
                                id="PaymentMethod" path="paymentMethod">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Electronic check">Electronic check</form:option>
                                <form:option value="Mailed check">Mailed check</form:option>
                                <form:option value="Bank transfer (automatic)">Bank transfer (automatic)</form:option>
                                <form:option value="Credit card (automatic)">Credit card (automatic)</form:option>
                            </form:select>
                            ${errorPaymentMethod}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorTechSupport">
                                <form:errors path="techSupport" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="TechSupport" class="form-label">techSupport</label>
                            <form:select class="form-select ${not empty errorTechSupport? 'is-invalid':''}"
                                id="TechSupport" path="techSupport">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorTechSupport}
                        </div>
                        <div class="col-6">
                            <c:set var="errorStreamingTV">
                                <form:errors path="streamingTV" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="StreamingTV" class="form-label">streamingTV</label>
                            <form:select class="form-select ${not empty errorStreamingTV? 'is-invalid':''}"
                                id="StreamingTV" path="streamingTV">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorStreamingTV}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorStreamingMovies">
                                <form:errors path="streamingMovies" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="StreamingMovies" class="form-label">streamingMovies</label>
                            <form:select class="form-select ${not empty errorStreamingMovies? 'is-invalid':''}"
                                id="StreamingMovies" path="streamingMovies">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                                <form:option value="No internet service">No internet service</form:option>
                            </form:select>
                            ${errorStreamingMovies}
                        </div>
                        <div class="col-6">
                            <c:set var="errorContract">
                                <form:errors path="contract" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Contract" class="form-label">contract</label>
                            <form:select class="form-select ${not empty errorContract? 'is-invalid':''}" id="Contract"
                                path="contract">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Month-to-month">Month-to-month</form:option>
                                <form:option value="One year">One year</form:option>
                                <form:option value="Two year">Two year</form:option>
                            </form:select>
                            ${errorContract}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorPaperlessBilling">
                                <form:errors path="paperlessBilling" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PaperlessBilling" class="form-label">paperlessBilling</label>
                            <form:select class="form-select ${not empty errorPaperlessBilling? 'is-invalid':''}"
                                id="PaperlessBilling" path="paperlessBilling">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Yes</form:option>
                                <form:option value="No">No</form:option>
                            </form:select>
                            ${errorPaperlessBilling}
                        </div>
                        <div class="col-6">
                            <c:set var="errorMonthlyCharges">
                                <form:errors path="monthlyCharges" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="MonthlyCharges" class="form-label">monthlyCharges</label>
                            <form:input type="number"
                                class="form-control ${not empty errorMonthlyCharges? 'is-invalid':''}"
                                id="MonthlyCharges" path="monthlyCharges" />
                            ${errorMonthlyCharges}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-12">
                            <c:set var="errorTotalCharges">
                                <form:errors path="totalCharges" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="TotalCharges" class="form-label">totalCharges</label>
                            <form:input type="number"
                                class="form-control ${not empty errorTotalCharges? 'is-invalid':''}" id="TotalCharges"
                                path="totalCharges" />
                            ${errorTotalCharges}
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success" onclick="onBtnSubmitClick()">Phân loại</button>
                </form:form>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
            </body>

            </html>