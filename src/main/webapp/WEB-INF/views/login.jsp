<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <link rel="stylesheet" href="https://bootstrap5.ru/css/docs.css">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 420px;
            padding: 15px;
            margin: auto;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

        .form-label-group > input,
        .form-label-group > label {
            height: 3.125rem;
            padding: .75rem;
        }

        .form-label-group > label {
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            width: 100%;
            color: #495057;
            pointer-events: none;
            cursor: text; /* Match the input under the label */
            border: 1px solid transparent;
            border-radius: .25rem;
            transition: all .1s ease-in-out;
        }

        .form-label-group input::-webkit-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-ms-input-placeholder {
            color: transparent;
        }

        .form-label-group input::-moz-placeholder {
            color: transparent;
        }

        .form-label-group input::placeholder {
            color: transparent;
        }

        .form-label-group input:not(:placeholder-shown) {
            padding-top: 1.25rem;
            padding-bottom: .25rem;
        }

        .form-label-group input:not(:placeholder-shown) ~ label {
            padding-top: .25rem;
            padding-bottom: .25rem;
            font-size: 12px;
            color: #777;
        }

    </style>
</head>
<body>
<form class="form-signin" method="post" action="/login">
    <div class="text-center mb-4">
        <img src="https://www.transinfo.by/files/transinfo/reg_images/logis_logo.jpeg" class="rounded float-start" alt="logo" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal"><spring:message code="login.login"/></h1>
    </div>

    <div class="form-label-group">
        <input type="text" name="username" id="username" class="form-control" placeholder="Username" required="">
        <label for="username"><spring:message code="username.login"/></label>
    </div>

    <div class="form-label-group">
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Пароль" required="">
        <label for="inputPassword"><spring:message code="password.login"/></label>
    </div>

<%--    <div class="checkbox mb-3">--%>
<%--        <label>--%>
<%--            <input type="checkbox" value="remember-me"> Remember me--%>
<%--        </label>--%>
<%--    </div>--%>
    <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="enter.login"/></button>
    <p class="mt-5 mb-3 text-muted text-center">Все права защищены</p>
</form>
</body>
</html>