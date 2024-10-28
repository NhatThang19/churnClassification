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
                            <label for="Gender" class="form-label">Giới tính của khách hàng là?</label>
                            <form:select class="form-select ${not empty errorGender? 'is-invalid':''}" id="Gender"
                                path="gender">
                                <option value="" disabled selected>Mở lên để chọn</option>
                                <form:option value="Male">Nam</form:option>
                                <form:option value="Female">Nữ</form:option>
                            </form:select>
                            ${errorGender}
                        </div>
                        <div class="col-6">
                            <c:set var="errorSeniorCitizen">
                                <form:errors path="SeniorCitizen" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="SeniorCitizen" class="form-label">khách hàng là người lớn tuổi?</label>
                            <form:select class="form-select ${not empty errorSeniorCitizen? 'is-invalid':''}"
                                id="SeniorCitizen" path="SeniorCitizen">
                                <option value="" disabled selected>Mở lên để chọn</option>
                                <form:option value="1">Đúng</form:option>
                                <form:option value="0">Sai</form:option>
                            </form:select>
                            ${errorSeniorCitizen}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorPartner">
                                <form:errors path="Partner" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Partner" class="form-label">khách hàng đã kết hôn?</label>
                            <form:select class="form-select ${not empty errorPartner? 'is-invalid':''}" id="Partner"
                                path="Partner">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                            </form:select>
                            ${errorPartner}
                        </div>
                        <div class="col-6">
                            <c:set var="errorDependents">
                                <form:errors path="Dependents" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Dependents" class="form-label">khách hàng có sống phụ thuộc vào ai
                                không?</label>
                            <form:select class="form-select  ${not empty errorDependents? 'is-invalid':''}"
                                id="Dependents" path="Dependents">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                            </form:select>
                            ${errorDependents}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errortenure">
                                <form:errors path="tenure" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="tenure" class="form-label">Số tháng khách hàng đã gắn bó với công ty</label>
                            <form:input type="number" class="form-control ${not empty errortenure? 'is-invalid':''}"
                                id="tenure" path="tenure" />
                            ${errortenure}
                        </div>
                        <div class="col-6">
                            <c:set var="errorPhoneService">
                                <form:errors path="PhoneService" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PhoneService" class="form-label">khách hàng có sử dụng dịch vụ điện thoại hay
                                không?</label>
                            <form:select class="form-select ${not empty errorPhoneService? 'is-invalid':''}"
                                id="PhoneService" path="PhoneService">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                            </form:select>
                            ${errorPhoneService}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorMultipleLines">
                                <form:errors path="MultipleLines" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="MultipleLines" class="form-label">khách hàng có sử dụng nhiều đường dây hay
                                không?</label>
                            <form:select class="form-select ${not empty errorMultipleLines? 'is-invalid':''}"
                                id="MultipleLines" path="MultipleLines">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No phone service">Không sử dụng dịch vụ điện thoại</form:option>
                            </form:select>
                            ${errorMultipleLines}
                        </div>
                        <div class="col-6">
                            <c:set var="errorInternetService">
                                <form:errors path="InternetService" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="InternetService" class="form-label">
                                Thiết bị cung cấp dịch vụ internet của của khách hàng là?</label>
                            <form:select class="form-select ${not empty errorInternetService? 'is-invalid':''}"
                                id="InternetService" path="InternetService">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Fiber optic">Fiber optic</form:option>
                                <form:option value="DSL">DSL</form:option>
                                <form:option value="No">Khác</form:option>
                            </form:select>
                            ${errorInternetService}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorOnlineSecurity">
                                <form:errors path="OnlineSecurity" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="OnlineSecurity" class="form-label">khách hàng có sử dụng dịch bảo mật online
                                ?</label>
                            <form:select class="form-select ${not empty errorOnlineSecurity? 'is-invalid':''}"
                                id="OnlineSecurity" path="OnlineSecurity">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorOnlineSecurity}
                        </div>
                        <div class="col-6">
                            <c:set var="errorOnlineBackup">
                                <form:errors path="OnlineBackup" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="OnlineBackup" class="form-label">khách hàng có sử dụng dịch online
                                backup?</label>
                            <form:select class="form-select ${not empty errorOnlineBackup? 'is-invalid':''}"
                                id="OnlineBackup" path="OnlineBackup">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorOnlineBackup}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorDeviceProtection">
                                <form:errors path="DeviceProtection" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="DeviceProtection" class="form-label">khách hàng có sử dụng dịch vụ bảo mật thiết
                                bị?</label>
                            <form:select class="form-select ${not empty errorDeviceProtection? 'is-invalid':''}"
                                id="DeviceProtection" path="DeviceProtection">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorDeviceProtection}
                        </div>
                        <div class="col-6">
                            <c:set var="errorPaymentMethod">
                                <form:errors path="PaymentMethod" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PaymentMethod" class="form-label">Phương thức thanh toán của khách hàng
                                là?</label>
                            <form:select class="form-select ${not empty errorPaymentMethod? 'is-invalid':''}"
                                id="PaymentMethod" path="PaymentMethod">
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
                                <form:errors path="TechSupport" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="TechSupport" class="form-label">khách hàng có sử dụng dịch vụ hỗ trợ kĩ
                                thuật?</label>
                            <form:select class="form-select ${not empty errorTechSupport? 'is-invalid':''}"
                                id="TechSupport" path="TechSupport">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorTechSupport}
                        </div>
                        <div class="col-6">
                            <c:set var="errorStreamingTV">
                                <form:errors path="StreamingTV" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="StreamingTV" class="form-label">khách hàng có sử dụng dịch vụ Streaming
                                TV?</label>
                            <form:select class="form-select ${not empty errorStreamingTV? 'is-invalid':''}"
                                id="StreamingTV" path="StreamingTV">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorStreamingTV}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorStreamingMovies">
                                <form:errors path="StreamingMovies" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="StreamingMovies" class="form-label">khách hàng có sử dụng dịch vụ Streaming
                                Movies?</label>
                            <form:select class="form-select ${not empty errorStreamingMovies? 'is-invalid':''}"
                                id="StreamingMovies" path="StreamingMovies">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Đúng</form:option>
                                <form:option value="No">Sai</form:option>
                                <form:option value="No internet service">Không sử dụng dịch vụ mạng</form:option>
                            </form:select>
                            ${errorStreamingMovies}
                        </div>
                        <div class="col-6">
                            <c:set var="errorContract">
                                <form:errors path="Contract" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="Contract" class="form-label">Loại thời hạn hợp đồng khách hàng sử dụng
                                là?</label>
                            <form:select class="form-select ${not empty errorContract? 'is-invalid':''}" id="Contract"
                                path="Contract">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Month-to-month">Từng tháng một</form:option>
                                <form:option value="One year">1 năm</form:option>
                                <form:option value="Two year">2 năm</form:option>
                            </form:select>
                            ${errorContract}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <c:set var="errorPaperlessBilling">
                                <form:errors path="PaperlessBilling" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="PaperlessBilling" class="form-label">Khi thanh toán khách hàng có cần bill
                                không?</label>
                            <form:select class="form-select ${not empty errorPaperlessBilling? 'is-invalid':''}"
                                id="PaperlessBilling" path="PaperlessBilling">
                                <option selected disabled>Mở lên để chọn</option>
                                <form:option value="Yes">Có</form:option>
                                <form:option value="No">Không</form:option>
                            </form:select>
                            ${errorPaperlessBilling}
                        </div>
                        <div class="col-6">
                            <c:set var="errorMonthlyCharges">
                                <form:errors path="MonthlyCharges" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="MonthlyCharges" class="form-label">Số tiền khách hàng thường phải trả hàng
                                tháng?</label>
                            <form:input type="number"
                                class="form-control ${not empty errorMonthlyCharges? 'is-invalid':''}"
                                id="MonthlyCharges" path="MonthlyCharges" />
                            ${errorMonthlyCharges}
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-12">
                            <c:set var="errorTotalCharges">
                                <form:errors path="TotalCharges" cssClass="invalid-feedback" />
                            </c:set>
                            <label for="TotalCharges" class="form-label">Tổng số tiền mà khách hàng phải trả?</label>
                            <form:input type="number"
                                class="form-control ${not empty errorTotalCharges? 'is-invalid':''}" id="TotalCharges"
                                path="TotalCharges" />
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