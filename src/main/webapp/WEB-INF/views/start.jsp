<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="title.start"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="/src/main/webapp/WEB-INF/resources/css/style.css" type="text/css">--%>
    <style>
        section {
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .sec-1 {
            background-image: url(https://st.depositphotos.com/1000128/2546/i/600/depositphotos_25462441-stock-photo-modern-business-buildings.jpg);
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: auto;
        }

        .logostics_head {
            width: 100%;
            height: 400px;
            background-size: cover;
        }

        .front_logistics {
            background: rgba(17, 96, 107, 0.36);
            width: 100%;
            height: 400px;
        }

        .logistics_head_p {
            font-style: normal;
            font-weight: 900;
            font-size: 37px;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: seashell;
            text-align: center;
            padding-top: 150px;
        }

        .logistics_addition {
            font-style: normal;
            font-weight: 700;
            font-size: 25px;
            line-height: 100%;
            letter-spacing: -0.010em;
            color: rgb(185, 56, 17);
            text-align: center;
            padding-top: 40px;
        }
    </style>
</head>
<body>
<c:import url="navbar/navbarStart.jsp"/>
<section>
    <div class="container-xxl">
        <div class="row align-items-center">
            <div class="col-12 text-center">
                <h1 id="Welcome"><spring:message code="welcome.start"/></h1><br>
            </div>
            <div class="col-7">
                <h4><spring:message code="info.startPage"/></h4>
            </div>
            <div class="col-5 g-5">
                <img class="w-100" src="https://teltsov.by/assets/galleries/77/cam09_ps_srednyaya.jpg"
                     alt="Logistic Center">
            </div>

            <div class="col-12 text-center">
                <br><br>
                <h1 id="Functions"><spring:message code="functions.startPage"/></h1><br>
            </div>
            <div class="col-7">
                <h4><spring:message code="startNewInfo.startPage"/>:<br>
                    1) <spring:message code="logFunctions.startPage"/>:<br>
                    <li><spring:message code="transport.logFunctions.startPage"/>,</li>
                    <li><spring:message code="storage.logFunctions.startPage"/>,</li>
                    <li><spring:message code="inventory.logFunctions.startPage"/>,</li>
                    <li><spring:message code="orderManagement.logFunctions.startPage"/>,</li>
                    <li><spring:message code="packaging.logFunctions.startPage"/></li>
                    <li><spring:message code="equipment.logFunctions.startPage"/>.</li>
                    <br>
                    2) <spring:message code="auxiliaryFunctions.startPage"/><br>
                    <li><spring:message code="freightForwarding.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="customsClearance.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="insurance.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="systematic.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="rental.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="it.auxiliaryFunctions.startPage"/>,</li>
                    <li><spring:message code="promotionMarketing.auxiliaryFunctions.startPage"/>.</li>
                    <br>
                    3) <spring:message code="additionalFunctions.startPage"/>:<br>
                    <li><spring:message code="vehicleMaintenance.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="sale.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="repair.additionalFunctions.startPage"/></li>
                    <li><spring:message code="hotel.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="catering.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="bank.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="accounting.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="tele.additionalFunctions.startPage"/>,</li>
                    <li><spring:message code="parking.additionalFunctions.startPage"/>.</li>
                </h4>
            </div>
            <div class="col-5 g-5">
                <img class="w-100" src="https://pediatrinfo.ru/wp-content/uploads/2/c/4/2c47a3e6b66fc6705780cb067f70323c.jpeg"
                     alt="Logistic Center">
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container-xxl">
        <h2 id="Services" class="col-12 text-center"><spring:message code="ourServices.start"/></h2>
        <div class="row justify-content-between">
            <c:forEach var="el" items="${categories}">
                <div class="col">
                    <div class="card w-100">
                        <img src="${el.image}"
                             class="card-img-top" alt="Service">
                        <div class="card-body">
                            <h5 class="card-title" id="Service">${el.name}</h5>
                            <p class="card-text">${el.shortDescription}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="text-center">
        <h5 align="center"><spring:message code="moreInfo.startPage"/></h5>
    </div>
</section>
<%@include file="/WEB-INF/views/footer/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
