<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="css/userPage.css">--%>
</head>
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
                        <a class="nav-link" href="basket.jsp">Basket</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <div class="text-end">
                    <a href="/registration"><img
                            src="https://cdn.pixabay.com/photo/2017/05/22/01/30/united-kingdom-2332854_640.png"
                            width="50" height="50" alt="English"></a>
                    <a href="/registration" class="me-3"><img
                            src="https://cdn.pixabay.com/photo/2019/09/05/01/04/russia-4452835_1280.png" width="40"
                            height="40" alt="Русский"></a>
                    <a role="button" class="btn btn-outline-danger" href="/logout">Sign-out</a>
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- <div class="photo">
    <img src="https://w-dog.ru/wallpapers/13/9/505795850978289/muzhchina-minimalizm-siluet-ten-chelovek-paren-malchik-bantik-galstuk-babaochka-krasnyj-seryj.jpg" width="15%" height="15%">
</div> -->
<div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
    <div class="row">
        <div class="col-md-6">
            <h1 class="display-4 font-italic"><c:out value="${currentUser.username}"/></h1>
            <p class="lead my-3">На этой странице вы можете увидеть информацию о вас, просмотреть историю ваших заказов,
                посетить карзину, а также редактировать ваш профиль.</p>
            <p class="lead my-3">Name: <c:out value="${currentUser.name}"/></p>
            <p class="lead my-3">Email: <c:out value="${currentUser.email}"/></p>
            <p class="lead my-3">Phone Number: <c:out value="${currentUser.phoneNumber}"/></p>
        </div>
        <div class="col-md-6 ml-5">
            <img src="https://w-dog.ru/wallpapers/13/9/505795850978289/muzhchina-minimalizm-siluet-ten-chelovek-paren-malchik-bantik-galstuk-babaochka-krasnyj-seryj.jpg"
                 width="100%" height="100%">
        </div>
        <p class="lead mb-0"><a href="/basket" class="text-white font-weight-bold">Перейти в карзину</a></p>
        <p class="lead mb-0"><a href="userPage/edit/<c:out value="${currentUser.id}"/>" class="text-white font-weight-bold">Редактировать</a>
            <a href="/changeImg" class="text-white font-weight-bold">Изменить аватар</a></p>
        <a href="/allUsers">Все пользователи</a>
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
