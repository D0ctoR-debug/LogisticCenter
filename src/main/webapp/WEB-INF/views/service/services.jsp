<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Doctor
  Date: 20.08.2021
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/purchasingLogistic.css">
    <link href="<c:url value="/static/js/addToBasket.js"/>" rel="stylesheet">

    <style>
        .Purchasing {
            background-image: url(https://catherineasquithgallery.com/uploads/posts/2021-02/1614248697_20-p-belo-zhelto-chernii-fon-24.jpg);
            color: black;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarService.jsp" %>
</head>
<body>
<div class="Transport">
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-12 text-center">
                    <h1><c:out value="${cat.name}"/></h1>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="col-12 text-center">
                <h3><c:out value="${cat.description}"/></h3>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <h2 id="Services"><spring:message code="order.transport"/></h2>
            <sec:authorize access="hasRole('ADMIN')">
                <a class="btn btn-secondary" href="/category/<c:out value="${cat.id}"/>/addService"><b>Add
                    Service</b></a>
                <br><br>
            </sec:authorize>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row justify-content-between">
                            <c:forEach var="el" items="${service}">
                                <div class="col">
                                    <div class="card w-100">
                                        <img src="${el.imageUrl}"
                                             class="card-img-top" width="250" height="250" alt="Транспортная логистика">
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                    ${el.name}
                                                    <%--                                            <spring:message code="firstType.transport"/>--%>
                                            </h5>
                                            <p class="card-text">
                                                    ${el.description}
                                                    <%--                                            <spring:message code="firstTypeDescription.transport"/>--%>
                                            </p>
                                            <a class="btn btn-primary" title="add to basket"
                                               href="/addToBasket?idService=${el.id}">Add to Basket</a><br><br>
                                            <sec:authorize access="hasRole('ADMIN')">
                                                <form action="/service/${el.id}/remove" method="post">
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </form>
                                            </sec:authorize>
                                            <sec:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                <a href="/service/${el.id}/edit" class="btn btn-secondary">Edit</a>
                                            </sec:authorize>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <%--                            <div class="col">--%>
                            <%--                                <div class="card w-100">--%>
                            <%--                                    <img src="https://im0-tub-by.yandex.net/i?id=a6cd78f8221393e119edc4a9859e4892&n=13"--%>
                            <%--                                         class="card-img-top" width="250" height="250" alt="Складская логистика">--%>
                            <%--                                    <div class="card-body">--%>
                            <%--                                        <h5 class="card-title"><spring:message code="secondType.transport"/></h5>--%>
                            <%--                                        <p class="card-text"><spring:message code="secondTypeDescription.transport"/></p>--%>
                            <%--                                        <a role="button" class="btn btn-primary" data-bs-toggle="modal"--%>
                            <%--                                           data-bs-target="#order" href="#order"><spring:message code="order.transport"/></a>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col">--%>
                            <%--                                <div class="card w-100">--%>
                            <%--                                    <img src="https://avatars.mds.yandex.net/get-zen_doc/2404796/pub_60019eb90cf4a170b932fc60_6001b26efd62ee068979de07/scale_1200"--%>
                            <%--                                         class="card-img-top" width="250" height="250" alt="Перегон транспорта">--%>
                            <%--                                    <div class="card-body">--%>
                            <%--                                        <h5 class="card-title"><spring:message code="thirdType.transport"/></h5>--%>
                            <%--                                        <p class="card-text"><spring:message code="thirdTypeDescription.transport"/></p>--%>
                            <%--                                        <a role="button" class="btn btn-primary" data-bs-toggle="modal"--%>
                            <%--                                           data-bs-target="#order" href="#order"><spring:message code="order.transport"/></a>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Modal -->
<div class="modal fade" id="order" tabindex="-1" aria-labelledby="orderJelLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="orderJelLabel"><spring:message code="orderInfo.transport"/></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/login">
                    <div class="mb-1">
                        <label for="weight" class="form-label"><spring:message code="weight.transport"/></label>
                        <input type="text" class="form-control" id="weight" required>
                    </div>
                    <div class="mb-3">
                        <label for="distance" class="form-label"><spring:message code="distance.transport"/></label>
                        <div class="input-group">
                            <input type="distance" class="form-control" id="distance" required>
                        </div>
                    </div>
                    <div class="col">
                        <p><spring:message code="result.transport"/>: </p>
                    </div>
                    <button type="submit" class="btn btn-success"><spring:message
                            code="addToBasket.transport"/></button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><spring:message
                            code="closeModal.transport"/></button>
                </form>
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
