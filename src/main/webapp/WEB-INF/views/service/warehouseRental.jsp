<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Doctor
  Date: 01.09.2021
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warehouse Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/warehouseLogistic.css">
    <style>
        .spoiler {
            padding: 24px;
            border: 1px solid #eee;
        }
        .spoiler + .spoiler {
            margin-top: 16px;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarService.jsp"%>
</head>
<body>
<div class="Transport">
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-12 text-center">
                    <h1>Transport Logistics</h1>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="col-12 text-center">
                <h3><spring:message code="description.transport"/></h3>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <h2 id="Services"><spring:message code="order.transport"/></h2>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row justify-content-between">
                            <c:forEach var="el" items="${rental}">
                                <div class="col">
                                    <div class="card w-100">
                                        <img src="${el.imageUrl}"
                                             class="card-img-top" width="250" height="250" alt="Транспортная логистика">
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                    ${el.name}
                                            </h5>
                                            <p class="card-text">
                                                    ${el.description}
                                            </p>
                                            <a title="add to basket" href="/addToBasket?idService=${el.id}">Dpbavit'</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
<!-- Modal -->
<section class="modal fade" id="order" tabindex="-1" aria-labelledby="orderJelLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="orderJelLabel">Введите информацию о заказе</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/login">
                    <div class="mb-1">
                        <label for="weight" class="form-label">Weight(tons)</label>
                        <input type="text" class="form-control" id="weight" required>
                    </div>
                    <div class="mb-3">
                        <label for="distance" class="form-label">Distance(km)</label>
                        <div class="input-group">
                            <input type="distance" class="form-control" id="distance" required>
                        </div>
                    </div>
                    <div class="col">
                        <p>Итого: </p>
                    </div>
                    <button type="submit" class="btn btn-success">Добавить в карзину</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </form>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
