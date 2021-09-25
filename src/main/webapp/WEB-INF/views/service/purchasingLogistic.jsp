<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchasing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/puchasingLogistic.css">
    <style>
        .Purchasing{
            background-image: url(https://catherineasquithgallery.com/uploads/posts/2021-02/1614248697_20-p-belo-zhelto-chernii-fon-24.jpg);
            color: black;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarService.jsp"%>
</head>
<body>
<div class="Purchasing">
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-12 text-center">
                    <h1>Purchasing Logistics</h1>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="col-12 text-center">
                <h3>Закупки – важная часть деятельности любого производства или торговой сети. Для осуществления своей деятельности компаниям важно своевременное приобретение качественного сырья, товаров, оснащения и других элементов формирующих материально-техническую базу. Закупочная логистика призвана упорядочить процесс закупки, учета, хранения, а также выдачи сырья на производственные линии для оптимизации деятельности предприятия и повышения уровня прибыли.
                </h3>
                <h3>Закупочная логистика – представляет собой деятельность по управлению товарной или сырьевой массой направленную на максимально быстрое обеспечение предприятия всем необходимым с долей экономической выгоды.
                </h3>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <h2 id="Services">Checkout</h2>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row justify-content-between">
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://storage.myseldon.com/news_pict_B8/B81B81D2EA2CA2525846327C624E1643"
                                         class="card-img-top" width="200" height="200" alt="Транспортная логистика">
                                    <div class="card-body">
                                        <h5 class="card-title">Transport Logistic</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="/views/service/transportLogistics.jsp" class="btn btn-primary">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://im0-tub-by.yandex.net/i?id=a6cd78f8221393e119edc4a9859e4892&n=13"
                                         class="card-img-top" width="200" height="200" alt="Складская логистика">
                                    <div class="card-body">
                                        <h5 class="card-title">Warehouse Logistics</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="/views/service/warehouseLogistics.jsp" class="btn btn-primary">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://avatars.mds.yandex.net/get-zen_doc/2404796/pub_60019eb90cf4a170b932fc60_6001b26efd62ee068979de07/scale_1200"
                                         class="card-img-top" width="200" height="200" alt="Перегон транспорта">
                                    <div class="card-body">
                                        <h5 class="card-title">Transport haul</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="/views/service/transportHaulService.jsp" class="btn btn-primary">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://im0-tub-by.yandex.net/i?id=d13232261a42cc64a48470378944fad2&n=13"
                                         class="card-img-top" width="200" height="200" alt="Аренда склада">
                                    <div class="card-body">
                                        <h5 class="card-title">Warehouse/office rental</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="/views/service/warehouseRental.jsp" class="btn btn-primary">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card w-100">
                                    <img src="https://img2.freepng.ru/20190302/flh/kisspng-logistics-distribution-supply-chain-management-tra-one-stop-cross-border-fulfillment-solution-for-sou-5c7a0decaef140.7161804315515028287166.jpg"
                                         class="card-img-top" width="200" height="200" alt="Аренда склада">
                                    <div class="card-body">
                                        <h5 class="card-title">Purchasing logistics</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="/views/service/purchasingLogistics.jsp" class="btn btn-primary">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
