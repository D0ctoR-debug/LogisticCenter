<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<header>
    <nav id="navbarUser" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-xxl">
            <a class="navbar-brand" href="/main">LogisticCenter</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="basket.jsp"><spring:message code="basket.profile"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <div class="text-end">
                    <a href="?lang=en"><img
                            src="https://cdn.pixabay.com/photo/2017/05/22/01/30/united-kingdom-2332854_640.png"
                            width="50" height="50" alt="English"></a>
                    <a href="?lang=ru"><img
                            src="https://cdn.pixabay.com/photo/2019/09/05/01/04/russia-4452835_1280.png" width="40"
                            height="40" alt="Русский"></a>
                    <a role="button" class="btn btn-outline-danger" href="/logout"><spring:message code="signOut.main"/></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container mt-5">
    <%--    <h1>Блог сайта</h1>--%>
    <%--    <div class="alert alert-info mt-2">--%>
    <%--        <c:forEach var="el" items="${users}">--%>
    <%--            <h3><c:out value="${el.title}"/></h3>--%>
    <%--            <p><c:out value="${el.anons}"/></p>--%>
    <%--            <a href="http://localhost:8080/blog/<c:out value="${el.id}"/>" class="btn btn-warning">Детальнее</a>--%>
    <%--        </c:forEach>--%>
    <%--    </div>--%>
    <table>
        <caption><spring:message code="allUsers.navbar.main"/></caption>
        <tr>
            <th><spring:message code="name.allUsers"/></th>
            <th><spring:message code="username.allUsers"/></th>
            <th><spring:message code="phone.allUsers"/></th>
            <th><spring:message code="email.allUsers"/></th>
            <th><spring:message code="role.allUsers"/></th>
            <th>Id</th>
        </tr>
        <c:forEach var="el" items="${users}">
            <tr>
                <td><c:out value="${el.name}"/></td>
                <td><c:out value="${el.username}"/></td>
                <td><c:out value="${el.phoneNumber}"/></td>
                <td><c:out value="${el.email}"/></td>
                <td><c:forEach items="${el.role}" var="role">${role.name} </c:forEach></td>
                <td><c:out value="${el.id}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>