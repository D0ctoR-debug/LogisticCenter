<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>blogEdit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<header>
    <%@include file="/WEB-INF/views/navbar/navbarService.jsp" %>
</header>
<div class="container mt-5 mb-5">
    <h1>Редактирование категории</h1>
    <c:forEach var="el" items="${category}">
        <form method="post">
            <input type="text" name="name" placeholder="Введите название" class="form-control" value="<c:out value="${el.name}"/>"><br>
            <textarea name="description"  placeholder="Введите полный текст" class="form-control"> <c:out value="${el.description}"/></textarea><br>
            <input type="text" name="image" placeholder="Введите Url" class="form-control" value="<c:out value="${el.image}"/>"><br>
            <button type="submit" class="btn btn-success">Edit</button>
        </form>
    </c:forEach>
</div>
</body>
</html>
