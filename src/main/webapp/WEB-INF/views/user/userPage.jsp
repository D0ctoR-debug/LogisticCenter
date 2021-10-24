<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="css/userPage.css">--%>
</head>
<%@include file="/WEB-INF/views/navbar/navbarProfile.jsp" %>
<body>
<!-- <div class="photo">
    <img src="https://w-dog.ru/wallpapers/13/9/505795850978289/muzhchina-minimalizm-siluet-ten-chelovek-paren-malchik-bantik-galstuk-babaochka-krasnyj-seryj.jpg" width="15%" height="15%">
</div> -->
<div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
    <div class="row">
        <div class="col-md-6">
            <h1 class="display-4 font-italic"><c:out value="${currentUser.username}"/></h1>
            <p class="lead my-3"><spring:message code="info.profile"/></p>
            <p class="lead my-3"><spring:message code="name.profile"/>: <c:out value="${currentUser.name}"/></p>
            <p class="lead my-3"><spring:message code="email.profile"/>: <c:out value="${currentUser.email}"/></p>
            <p class="lead my-3"><spring:message code="phone.profile"/>: <c:out value="${currentUser.phoneNumber}"/></p>
            <a href="/order" class="text-white font-weight-bold"><spring:message code="orders.profile"/></a>
            <a href="/orderHistory" class="text-white font-weight-bold"><spring:message code="myOrders.profile"/></a>
            <sec:authorize access="hasAnyRole('ADMIN','MANAGER')">
                <a href="/allOrders" class="text-white font-weight-bold"><spring:message code="allOrders.profile"/></a>
                <a href="/newOrders" class="text-white font-wight-bold"><spring:message code="newOrders.profile"/></a>
            </sec:authorize>
        </div>
        <div class="col-md-6 ml-5">
            <img src="https://w-dog.ru/wallpapers/13/9/505795850978289/muzhchina-minimalizm-siluet-ten-chelovek-paren-malchik-bantik-galstuk-babaochka-krasnyj-seryj.jpg"
                 width="100%" height="100%">
        </div>
        <p class="lead mb-0"><a href="/basket" class="text-white font-weight-bold"><spring:message
                code="basket.profile"/></a></p>
        <p class="lead mb-0"><a href="userPage/edit/<c:out value="${currentUser.id}"/>"
                                class="text-white font-weight-bold"><spring:message code="edit.profile"/></a>
            <a href="/changeImg" class="text-white font-weight-bold"><spring:message code="photo.profile"/></a>
            <sec:authorize access="hasRole('ADMIN')">
            <a href="/allUsers" class="text-white font-weight-bold"><spring:message code="all.allUsers"/></a></p>
        </sec:authorize>
        </p>

    </div>
    <!-- <div class="col-md-5">
        <img src="https://w-dog.ru/wallpapers/13/9/505795850978289/muzhchina-minimalizm-siluet-ten-chelovek-paren-malchik-bantik-galstuk-babaochka-krasnyj-seryj.jpg" width="15%" height="15%">
    </div>  -->
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
