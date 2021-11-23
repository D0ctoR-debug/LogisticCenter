<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        section {
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .sec-1 {
            background-image: url(https://avatars.mds.yandex.net/i?id=b58ffe6d77150853667193f8acbf6b89-5396308-images-thumbs&n=13);
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: auto;
        }

        .logistics_head {
            width: 100%;
            height: 400px;
            background-size: cover;
        }

        .front_logistics {
            background: rgba(17, 96, 107, 0.36);
            width: 100%;
            height: 400px;
        }

        .fadeInDown {
            animation-name: fadeInDown;
        }

        .logistics_head_p {
            font-style: normal;
            font-weight: 900;
            font-size: 37px;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: seashell;
            text-align: center;
            padding-top: 150px;
        }

        .services {
            display: flex;
            flex-wrap: wrap;
            margin-left: -15px;
            margin-right: -15px;
        }

        .text_logistics {
            font-style: normal;
            font-weight: 900;
            font-size: 37px;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: grey;
        }

        .img_logistics {
            width: 100%;
            height: 100%;
            max-width: 600px;
            max-height: 600px;
            vertical-align: bottom;
            border-style: none;

        }

        .services_p {
            font-size: 20px;
            font-style: normal;
            font-weight: normal;
            line-height: 100%;
            letter-spacing: -0.015em;
            color: hotpink;
            max-width: 433px;
        }

        .container {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .col_white_amrc {
            color: #FFF;
        }

        footer {
            width: 100%;
            background-color: #263238;
            min-height: 250px;
            padding: 10px 0px 25px 0px;
        }

        .pt2 {
            padding-top: 40px;
            margin-bottom: 20px;
        }

        footer p {
            font-size: 13px;
            color: #CCC;
            padding-bottom: 0px;
            margin-bottom: 8px;
        }

        .mb10 {
            padding-bottom: 15px;
        }

        .footer_ul_amrc {
            margin: 0px;
            list-style-type: none;
            font-size: 14px;
            padding: 0px 0px 10px 0px;
        }

        .footer_ul_amrc li {
            padding: 0px 0px 5px 0px;
        }

        .footer_ul_amrc li a {
            color: #CCC;
        }

        .footer_ul_amrc li a:hover {
            color: #fff;
            text-decoration: none;
        }

        .fleft {
            float: left;
        }

        .padding-right {
            padding-right: 10px;
        }

        .footer_ul2_amrc {
            margin: 0px;
            list-style-type: none;
            padding: 0px;
        }

        .footer_ul2_amrc li p {
            display: table;
        }

        .footer_ul2_amrc li a:hover {
            text-decoration: none;
        }

        .footer_ul2_amrc li i {
            margin-top: 5px;
        }

        .bottom_border {
            border-bottom: 1px solid #323f45;
            padding-bottom: 20px;
        }

        .foote_bottom_ul_amrc {
            list-style-type: none;
            padding: 0px;
            display: table;
            margin-top: 10px;
            margin-right: auto;
            margin-bottom: 10px;
            margin-left: auto;
        }

        .foote_bottom_ul_amrc li {
            display: inline;
        }

        .foote_bottom_ul_amrc li a {
            color: #999;
            margin: 0 12px;
        }

        .social_footer_ul {
            display: table;
            margin: 15px auto 0 auto;
            list-style-type: none;
        }

        .social_footer_ul li {
            padding-left: 20px;
            padding-top: 10px;
            float: left;
        }

        .social_footer_ul li a {
            color: #CCC;
            border: 1px solid #CCC;
            padding: 8px;
            border-radius: 50%;
        }

        .social_footer_ul li i {
            width: 20px;
            height: 20px;
            text-align: center;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarMain.jsp" %>
</head>
<body>
<div data-bs-spy="scroll" data-bs-target="#navbarUser" data-bs-offset="0" class="scrollspy-example" tabindex="0">
    <section class="sec-1 col-sm-12 col-lg-12">
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="logistics_head">
                    <div class="front_logistics">
                        <div class="fadeInDown">
                            <h1 class="logistics_head_p"><spring:message code="greetings.main"/> , <c:out
                                    value="${currentUser.username}"/></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="background">
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-7">
                    <h4><spring:message code="description.main"/></h4><br>
                    <%--                    <sec:authorize access="hasRole('ADMIN')">--%>
                    <%--                        <a href="#" class="btn-btn-primary">Change description</a>--%>
                    <%--                    </sec:authorize>--%>
                </div>
                <div class="col-5 g-5">
                    <img class="w-100"
                         src="https://avatars.mds.yandex.net/i?id=052c53a539c02ebf1711f6979d6c853f-5331782-images-thumbs&n=13"
                         alt="Warehouse">
                </div>
            </div>
        </div>
    </section>
    <div class="container-xxl">
        <h2 id="Services"><spring:message code="service.start"/> <sec:authorize access="hasRole('ADMIN')"><a
                class="btn btn-primary" href="/addCategory"><spring:message
                code="addCategory.main"/></a></sec:authorize></h2>
    </div>
    <c:forEach var="el" items="${categories}" varStatus="status">
        <c:if test="${el.id%2!=0}">

            <div class="container-xxl">
                <div class="col-sm-12 col-lg-12">
                    <div class="row justify-content-start">
                        <div class="services">
                            <div class="col-sm-12 col-lg-6">
                                <img alt="transportLogistic" class="img_logistics"
                                     src="${el.image}">
                                <br>
                            </div>
                            <div class="col-sm-12 col-lg-6 text_logistics">
                                <h3 id="${el.id}">
                                    <c:out value="${el.name}"/>
                                </h3>
                                <p class="services_p">
                                    <c:out value="${el.shortDescription}"/>
                                </p>
                                <a href="/category/<c:out value="${el.id}"/>" class="btn btn-primary"><spring:message
                                        code="readMore.main"/></a>
                                <sec:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                    <a href="/category/${el.id}/edit" class="btn btn-secondary"><spring:message
                                            code="editCategory.main"/></a>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <form action="/category/${el.id}/delete" method="post">
                                        <button type="submit" class="btn btn-danger"><spring:message
                                                code="deleteCategory.main"/></button>
                                    </form>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br><br><br><br>
        </c:if>
        <c:if test="${el.id%2==0}">
            <div class="container-xxl">
                <div class="col-sm-12 col-lg-12">
                    <div class="row justify-content-center">
                        <div class="services">
                            <div class="col-sm-12 col-lg-6 text_logistics">
                                <h3 id="${el.id}">
                                    <c:out value="${el.name}"/>
                                </h3>
                                <p class="services_p">
                                    <c:out value="${el.shortDescription}"/>
                                </p>
                                <a href="/category/<c:out value="${el.id}"/>" class="btn btn-primary"><spring:message
                                        code="readMore.main"/></a>
                                <sec:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                    <a href="/category/${el.id}/edit" class="btn btn-secondary"><spring:message
                                            code="editCategory.main"/></a>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <form action="/category/${el.id}/delete" method="post">
                                        <button type="submit" class="btn btn-danger"><spring:message
                                                code="deleteCategory.main"/></button>
                                    </form>
                                </sec:authorize>
                            </div>
                            <div class="col-sm-12 col-lg-6">
                                <img class="img_logistics"
                                     src="${el.image}">
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br><br><br><br>

        </c:if>
    </c:forEach>
            </div>
</div>
<%@include file="/WEB-INF/views/footer/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
