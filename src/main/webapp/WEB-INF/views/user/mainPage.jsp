<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="mainPage.css">--%>
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

        .logistics_head {
            width: 100%;
            height: 400px;
            background-size: cover;
        }

        .front_logistics {
            background: rgba(17, 96, 107, 0.36);
            width: 100%;
            height: 400px;
        }

        .fadeInDown {
            animation-name: fadeInDown;
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

        .services {
            display: flex;
            flex-wrap: wrap;
            margin-left: -15px;
            margin-right: -15px;
        }

        .text_logistics {
            font-style: normal;
            font-weight: 900;
            font-size: 37px;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: grey;
        }

        .img_logistics {
            width: 100%;
            height: 100%;
            max-width: 600px;
            max-height: 600px;
            vertical-align: bottom;
            border-style: none;

        }

        .services_p {
            font-size: 20px;
            font-style: normal;
            font-weight: normal;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: hotpink;
            max-width: 433px;
        }

        .container {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarMain.jsp" %>
</head>
<body>
<a href="/admin">Admin</a>
<div data-bs-spy="scroll" data-bs-target="#navbarUser" data-bs-offset="0" class="scrollspy-example" tabindex="0">
    <section class="sec-1 col-sm-12 col-lg-12">
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="logistics_head">
                    <div class="front_logistics">
                        <div class="fadeInDown">
                            <h1 class="logistics_head_p"><spring:message code="greetings.main"/> , <c:out
                                    value="${currentUser.username}"/></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-7">
                    <h4><spring:message code="description.main"/></h4>
                </div>
                <div class="col-5 g-5">
                    <img class="w-100" src="https://my-tumen.ru/unimages/sklad/3.jpg" alt="Warehouse">
                </div>
            </div>
        </div>
    </section>
    <div class="container-xxl">
        <h2 id="Services"><spring:message code="service.start"/></h2>
    </div>
<%--<c:forEach var="el" items="${categories}">--%>
    <div class="container-xxl">
        <div class="col-sm-12 col-lg-12">
            <div class="row justify-content-start">
                <div class="services">
                    <div class="col-sm-12 col-lg-6">
                        <img alt="transportLogistic" class="img_logistics"
                             src="https://storage.myseldon.com/news_pict_B8/B81B81D2EA2CA2525846327C624E1643">
                        <br>
                    </div>
                    <div class="col-sm-12 col-lg-6 text_logistics">
                        <h3 id="TransportLog">
<%--                            <c:out value="${el.name}"/>--%>
                            <spring:message code="dropdownTransport.start"/>
                        </h3>
                        <p class="services_p">
<%--                            <c:out value="${el.description}"/>--%>
                            <spring:message code="descriptionForTransportLogistic"/>
                        </p>
                        <a href="/transport" class="btn btn-primary"><spring:message code="readMore.main"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br>
<%--</c:forEach>--%>
    <div class="container-xxl">
        <div class="col-sm-12 col-lg-12">
            <div class="row justify-content-center">
                <div class="services">
                    <div class="col-sm-12 col-lg-6 text_logistics">
                        <h3 id="WarehouseLog">
                            <spring:message code="dropdownWarehouse.start"/>
                        </h3>
                        <p class="services_p">
                            Транспортно-экспедиционная деятельность является неотъемлемым элементом эффективного
                            осуществления перевозок грузов
                            не только для клиента, оптимизируя его финансовые, трудовые и иные затраты, но и для нашего
                            Предприятия, непосредственно
                            осуществляющего перевозку груза, что позволяет нам позиционировать себя как надежного
                            делового партнера и дисциплинированного
                            игрока на рынке логистических услуг.
                        </p>
                        <a href="/warehouse" class="btn btn-primary"><spring:message code="readMore.main"/></a>
                    </div>
                    <div class="col-sm-12 col-lg-6">
                        <img class="img_logistics"
                             src="https://im0-tub-by.yandex.net/i?id=a6cd78f8221393e119edc4a9859e4892&n=13">
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br>
    <div class="container-xxl">
        <div class="col-sm-12 col-lg-12" data-wow-offset="300">
            <div class="row justify-content-start">
                <div class="services">
                    <div class="col-sm-12 col-lg-7">
                        <img class="img_logistics"
                             src="https://avatars.mds.yandex.net/get-zen_doc/2404796/pub_60019eb90cf4a170b932fc60_6001b26efd62ee068979de07/scale_1200">
                        <br>
                    </div>
                    <div class="col-sm-12 col-lg-5 text_logistics">
                        <h3 id="Transport">
                            <spring:message code="dropdownHaul.start"/>
                        </h3>
                        <p class="services_p">
                            Транспортно-экспедиционная деятельность является неотъемлемым элементом эффективного
                            осуществления перевозок грузов
                            не только для клиента, оптимизируя его финансовые, трудовые и иные затраты, но и для нашего
                            Предприятия, непосредственно
                            осуществляющего перевозку груза, что позволяет нам позиционировать себя как надежного
                            делового партнера и дисциплинированного
                            игрока на рынке логистических услуг.
                        </p>
                        <a href="/transportHaul" class="btn btn-primary"><spring:message code="readMore.main"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br>
    <div class="container-xxl">
        <div class="col-sm-12 col-lg-12">
            <div class="row justify-content-center">
                <div class="services">
                    <div class="col-sm-12 col-lg-5 text_logistics">
                        <h3 id="Rental">
                            <spring:message code="dropdownRental.start"/>
                        </h3>
                        <p class="services_p">
                            Транспортно-экспедиционная деятельность является неотъемлемым элементом эффективного
                            осуществления перевозок грузов
                            не только для клиента, оптимизируя его финансовые, трудовые и иные затраты, но и для нашего
                            Предприятия, непосредственно
                            осуществляющего перевозку груза, что позволяет нам позиционировать себя как надежного
                            делового партнера и дисциплинированного
                            игрока на рынке логистических услуг.
                        </p>
                        <a href="/warehouseRental" class="btn btn-primary"><spring:message code="readMore.main"/></a>
                    </div>
                    <div class="col-sm-12 col-lg-7">
                        <img class="img_logistics"
                             src="https://im0-tub-by.yandex.net/i?id=d13232261a42cc64a48470378944fad2&n=13">
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br>
    <div class="container-xxl">
        <div class="col-sm-12 col-lg-12" data-wow-offset="300">
            <div class="row justify-content-start">
                <div class="services">
                    <div class="col-sm-12 col-lg-7">
                        <img class="img_logistics"
                             src="https://img2.freepng.ru/20190302/flh/kisspng-logistics-distribution-supply-chain-management-tra-one-stop-cross-border-fulfillment-solution-for-sou-5c7a0decaef140.7161804315515028287166.jpg">
                        <br>
                    </div>
                    <div class="col-sm-12 col-lg-5 text_logistics">
                        <h3 id="Purchasing">
                            <spring:message code="dropdownPurchasing.start"/>
                        </h3>
                        <p class="services_p">
                            Транспортно-экспедиционная деятельность является неотъемлемым элементом эффективного
                            осуществления перевозок грузов
                            не только для клиента, оптимизируя его финансовые, трудовые и иные затраты, но и для нашего
                            Предприятия, непосредственно
                            осуществляющего перевозку груза, что позволяет нам позиционировать себя как надежного
                            делового партнера и дисциплинированного
                            игрока на рынке логистических услуг.
                        </p>
                        <a href="/purchasing" class="btn btn-primary"><spring:message code="readMore.main"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
