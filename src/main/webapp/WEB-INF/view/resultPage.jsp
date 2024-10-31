<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Result</title>
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

                    :root {
                        --bs-table-bg: transparent;
                    }

                    .my-custom-table {
                        --bs-table-bg: transparent;
                    }
                </style>
            </head>

            <body class="p-5">
                <h1 class="text-center mb-3">Dự đoán khả năng rời bỏ của khách hàng</h1>
                <h3 class="text-center p-2"
                    style="background-color: ${result.yesPercentage > 50 ? '#FF885B' : '#557C56'};">
                    Khả năng khách hàng rời đi là:
                    <span style="text-decoration: underline;">${result.yesPercentage}%</span> !!!
                </h3>
                <hr class="border border-2 border-success-subtle opacity-75 my-4">
                <div class="row mt-5">
                    <div class="col-5" style="border-right: solid 4px #98C1B7;">
                        <h4 class="mb-5 text-center">Biểu đồ khả năng khách hàng rời đi</h4>
                        <canvas id="myChart" style="width:100%;max-width:100%"></canvas>
                        <h5 class="mt-3 mb-4 text-center">Dự đoán khách hàng rời đi là: <span
                                style="text-decoration: underline;">${result.predictedClass}</span>!!!</h5>
                        <div class="d-flex justify-content-center flex-column">
                            <a href="/" type="button" class="btn btn-success mb-3">Trở lại</a>
                            <img style="height: 350px;" src="resources/gif.gif" alt="">
                        </div>
                    </div>
                    <div class="col-7 text-center">
                        <h4 class="mb-4">Các thuộc tính được phân tích</h4>
                        <table class="table my-custom-table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Thuộc tính</th>
                                    <th scope="col">Giá trị</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>gender</td>
                                    <td>${customer.gender}</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>seniorCitizen</td>
                                    <td>${customer.seniorCitizen}</td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>partner</td>
                                    <td>${customer.partner}</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>dependents</td>
                                    <td>${customer.dependents}</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>tenureMonths</td>
                                    <td>${customer.tenureMonths}</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>contract</td>
                                    <td>${customer.contract}</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>phoneService</td>
                                    <td>${customer.phoneService}</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>multipleLines</td>
                                    <td>${customer.multipleLines}</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>internetService</td>
                                    <td>${customer.internetService}</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>onlineSecurity</td>
                                    <td>${customer.onlineSecurity}</td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>onlineBackup</td>
                                    <td>${customer.onlineBackup}</td>
                                </tr>
                                <tr>
                                    <td>12</td>
                                    <td>deviceProtection</td>
                                    <td>${customer.deviceProtection}</td>
                                </tr>
                                <tr>
                                    <td>13</td>
                                    <td>techSupport</td>
                                    <td>${customer.techSupport}</td>
                                </tr>
                                <tr>
                                    <td>14</td>
                                    <td>streamingTV</td>
                                    <td>${customer.streamingTV}</td>
                                </tr>
                                <tr>
                                    <td>15</td>
                                    <td>streamingMovies</td>
                                    <td>${customer.streamingMovies}</td>
                                </tr>
                                <tr>
                                    <td>16</td>
                                    <td>paperlessBilling</td>
                                    <td>${customer.paperlessBilling}</td>
                                </tr>
                                <tr>
                                    <td>17</td>
                                    <td>paymentMethod</td>
                                    <td>${customer.paymentMethod}</td>
                                </tr>
                                <tr>
                                    <td>18</td>
                                    <td>monthlyCharges</td>
                                    <td>${customer.monthlyCharges}</td>
                                </tr>
                                <tr>
                                    <td>19</td>
                                    <td>totalCharges</td>
                                    <td>${customer.totalCharges}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
                <script>
                    var yesPercentage = ${ result.yesPercentage };
                    var noPercentage = ${ result.noPercentage };


                    var xValues = ["Yes", "No"];
                    var yValues = [yesPercentage, noPercentage];

                    var barColors = [
                        "#FF885B",
                        "#557C56"
                    ];

                    new Chart("myChart", {
                        type: "doughnut",
                        data: {
                            labels: xValues,
                            datasets: [{
                                backgroundColor: barColors,
                                data: yValues
                            }]
                        }
                    });
                </script>

            </body>

            </html>