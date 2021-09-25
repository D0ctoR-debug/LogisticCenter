<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="d-flex flex-column h-100">
<main>
    <div class="container mt-5 mb-5">
    <h1><spring:message code="name.edit"/></h1>
    <c:forEach var="el" items="${user}">
        <form method="POST">
            <input type="text" name="name" placeholder="<spring:message code="editName.edit"/>" class="form-control" value="<c:out value="${el.name}"/>"><br>
            <input type="text" name="email" placeholder="<spring:message code="editEmail.edit"/>" class="form-control" value="<c:out value="${el.email}"/>"><br>
            <input type="text" name="phoneNumber" placeholder="<spring:message code="editPhoneNumber"/>" class="form-control" value="<c:out value="${el.phoneNumber}"/>"><br>
            <button type="submit" class="btn btn-success"><spring:message code="button.edit"/></button>
        </form>
    </c:forEach>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
