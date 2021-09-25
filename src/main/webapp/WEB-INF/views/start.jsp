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
                    <h1 id="Welcome"><spring:message code="welcome.start"/></h1>
                </div>
                <div class="col-7">
                    <h4>Логистический центр - это пространственно-функциональный объект с инфраструктурой и
                        организацией, в котором логистические услуги, связанные с приемом, хранением, распределением и
                        выдачей товаров и оказанием сопутствующих услуг, предоставляются хозяйствующими субъектами
                        независимо от отправителя или получателя.
                    </h4>
                </div>
                <div class="col-5 g-5">
                    <img class="w-100" src="https://my-tumen.ru/unimages/sklad/3.jpg" alt="Warehouse">
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <h2 id="Services" class="col-12 text-center"><spring:message code="ourServices.start"/></h2>
<%--            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">--%>
<%--                <div class="carousel-indicators">--%>
<%--                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"--%>
<%--                            class="active"--%>
<%--                            aria-current="true" aria-label="Slide 1"></button>--%>
<%--                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"--%>
<%--                            aria-label="Slide 2"></button>--%>
<%--                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"--%>
<%--                            aria-label="Slide 3"></button>--%>
<%--                </div>--%>
<%--                <div class="carousel-inner">--%>
<%--                    <div class="carousel-item active">--%>
                        <div class="row justify-content-between">
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://storage.myseldon.com/news_pict_B8/B81B81D2EA2CA2525846327C624E1643"
                                         class="card-img-top" alt="Транспортная логистика">
                                    <div class="card-body">
                                        <h5 class="card-title" id="TransportLog"><spring:message
                                                code="dropdownTransport.start"/></h5>
                                        <p class="card-text"><spring:message code="content.start"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://im0-tub-by.yandex.net/i?id=a6cd78f8221393e119edc4a9859e4892&n=13"
                                         class="card-img-top" alt="Складская логистика">
                                    <div class="card-body">
                                        <h5 class="card-title" id="WarehouseLog"><spring:message
                                                code="dropdownWarehouse.start"/></h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up
                                            the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://avatars.mds.yandex.net/get-zen_doc/2404796/pub_60019eb90cf4a170b932fc60_6001b26efd62ee068979de07/scale_1200"
                                         class="card-img-top" alt="Перегон транспорта">
                                    <div class="card-body">
                                        <h5 class="card-title" id="Transport"><spring:message
                                                code="dropdownHaul.start"/></h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up
                                            the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://im0-tub-by.yandex.net/i?id=d13232261a42cc64a48470378944fad2&n=13"
                                         class="card-img-top" alt="Аренда склада">
                                    <div class="card-body">
                                        <h5 class="card-title" id="Rental"><spring:message
                                                code="dropdownRental.start"/></h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up
                                            the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://im0-tub-by.yandex.net/i?id=d13232261a42cc64a48470378944fad2&n=13"
                                         class="card-img-top" alt="Аренда склада">
                                    <div class="card-body">
                                        <h5 class="card-title" id="Purchasing"><spring:message
                                                code="dropdownRental.start"/></h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up
                                            the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <div class="text-center">
            <h5> Для полной информации и для оформления заказа требуется войти в аккаунт или <a
                    href="/registration">зарегистрироваться </a>!</h5>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-12 text-center">
                    <h2 id="Contacts">Как с нами связаться</h2>
                </div>
                <div class="col-7">
                    <h4>Связаться можно любыми способами</h4>
                    <h4>Адрес: </h4>
                    <h4>Телефон: </h4>
                    <h4>Почта: </h4>
                </div>
                <div class="col-5 g-5">
                    <a href="/main">Юзер</a>
                </div>
            </div>
        </div>
        <h3><a href="/login">Voiti</a></h3>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</body>
</html>
