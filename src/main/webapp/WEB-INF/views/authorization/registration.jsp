<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="title.registration"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%@include file="/WEB-INF/views/navbar/navbarRegistration.jsp" %>
    <style type="text/css">
        .error {
            color: red;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main>
    <div class="container" style="padding-top: 50px">
        <div class="row justify-content-center g-3 p-3">
            <div class="col-md-7 col-lg-8">
                <form:form method="post" modelAttribute="userForm">
                <h2 class="text-center"><spring:message code="title.registration"/></h2><br><br>
                <form class="needs-validation" novalidate="">
                    <div class="row g-3">
                        <div class="col-md-7">
                            <label for="name" class="form-label"><spring:message code="name.registration"/><span
                                    class="text-danger">*</span></label>
                                <form:input class="form-control" path="name" type="text" placeholder="Name"/>
                                <form:errors path="name" cssClass="error"/>
                                    <%--                                <label for="firstName" class="form-label">First name<span--%>
                                    <%--                                        class="text-danger">*</span></label>--%>
                                    <%--                                <input type="text" class="form-control" name="name" id="firstName" placeholder="" value=""--%>
                                    <%--                                       required="">--%>
                                    <%--                                <div class="invalid-feedback">--%>
                                    <%--                                    Valid first name is required.--%>
                                    <%--                                </div>--%>
                            </div>
                            <div class="col-md-7">
                                <label for="username" class="form-label"><spring:message code="username.registration"/>
                                    <span class="text-danger">*</span></label>
                                <form:input class="form-control" type="text" path="username" placeholder="Username"/>
                                <form:errors path="username" cssClass="error"/>
                                <div class="text-danger">${usernameError}</div>
                                    <%--                                <input type="text" class="form-control" name="username" id="username" placeholder="" value=""--%>
                                    <%--                                       required="">--%>
                                    <%--                                <div class="invalid-feedback">--%>
                                    <%--                                    Valid Username is required.--%>
                                    <%--                                </div>--%>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label"><spring:message code="email.registration"/> <span
                                        class="text-muted"> (<spring:message code="optional.registration"/>)</span></label>
                                <form:input class="form-control" type="text" path="email" placeholder="Email"/>
                                <form:errors path="email" cssClass="error"/>
                                    <%--                                <input type="email" name="email" class="form-control" id="email" placeholder="youremail@example.com">--%>
                                    <%--                                <div class="invalid-feedback">--%>
                                    <%--                                    Please enter a valid email address!--%>
                                    <%--                                </div>--%>
                            </div>
                            <div class="col-12">
                                <label for="phoneNumber" class="form-label"><spring:message code="phoneNumber.registration"/><span
                                        class="text-danger">*</span></label>
                                <form:input class="form-control" type="text" path="phoneNumber" placeholder="Phone"/>
                                <form:errors path="phoneNumber" cssClass="error"/>
                                    <%--                                <input class="form-control" name="phoneNumber" id="phoneNumber" placeholder="+375 (66) 666-66-66">--%>
                                    <%--                                <div class="invalid-feedback">--%>
                                    <%--                                    Please enter a valid phone number!--%>
                                    <%--                                </div>--%>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label for="password" class="form-label"
                                           aria-describedby="passwordHelpInline"><spring:message code="password.registration"/><span
                                            class="text-danger">*</span></label>
                                    <form:input type="password" path="password" placeholder="Password"
                                                class="form-control"/>
                                    <form:errors path="password" cssClass="error"/>
                                        <%--                                    <input type="password" name="password" class="form-control" id="registrationPassword">--%>
                                        <%--                                    <div class="col-auto">--%>
                                        <%--                                        <div class="invalid-feedback">--%>
                                        <%--                                            Enter the true password--%>
                                        <%--                                        </div>--%>
                                        <%--                                        <span id="passwordHelpInline" class="form-text">--%>
                                        <%--                                          Must be 8-20 symbols.--%>
                                        <%--                                        </span>--%>
                                </div>
                                <div class="col-6">
                                    <label for="passwordConfirm" class="form-label"><spring:message code="passwordConfirm.registration"/><span
                                            class="text-danger">*</span></label>
                                    <form:input type="password" path="passwordConfirm" class="form-control"
                                                placeholder="Confirm your password"/>
                                    <form:errors path="passwordConfirm"/>
                                    <div class="text-danger">${passwordError}</div>
                                        <%--                                    <input type="password" class="form-control" id="confirmation">--%>
                                        <%--                                    <div class="invalid-feedback">--%>
                                        <%--                                        Enter the true password--%>
                                        <%--                                    </div>--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="w-100">
                                    <button class="mt-5 btn btn-success btn-lg" type="submit"><spring:message code="button.registration"/></button>
                                </div>
                            </div>
                            </form:form>
                </form>
                <div class="row">
                    <a href="/" class="btn btn-outline-success"><spring:message code="main.registration"/></a>
                </div>
            </div>
        </div>
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
