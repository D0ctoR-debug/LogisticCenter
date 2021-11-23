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
                <a class="btn btn-secondary" href="/category/<c:out value="${cat.id}"/>/addService"><b><spring:message code="addService.service"/></b></a>
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
                                               href="/addToBasket?idService=${el.id}"><spring:message code="addToBasket.transport"/></a><br><br>
                                            <sec:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                <a href="/service/${el.id}/edit" class="btn btn-secondary"><spring:message code="editCategory.main"/></a>
                                            </sec:authorize><br><br>
                                            <sec:authorize access="hasRole('ADMIN')">
                                                <form action="/service/${el.id}/remove" method="post">
                                                    <button type="submit" class="btn btn-danger"><spring:message code="deleteCategory.main"/></button>
                                                </form>
                                            </sec:authorize>
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
<%@include file="/WEB-INF/views/footer/footerOthers.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
