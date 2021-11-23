<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Basket</title>
    <%@include file="/WEB-INF/views/navbar/navbarProfile.jsp" %>
    <style>
        .table_blur {
            margin-left: auto;
            margin-right: auto;
            background: #f5ffff;
            border-collapse: collapse;
            text-align: center;
        }

        .table_blur th {
            border-top: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
            background: linear-gradient(#9595b6, #263238);
            color: white;
            padding: 10px 15px;
            position: relative;
        }

        .table_blur th:after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            top: 25%;
            height: 25%;
            width: 100%;
            background: linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, .08));
        }

        .table_blur tr:nth-child(odd) {
            background: #ebf3f9;
        }

        .table_blur th:first-child {
            border-left: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }

        .table_blur th:last-child {
            border-right: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }

        .table_blur td {
            border: 1px solid #e3eef7;
            padding: 10px 15px;
            position: relative;
            transition: all 0.5s ease;
            word-wrap: break-word;
        }

        .table_blur tbody:hover td {
            color: transparent;
            text-shadow: 0 0 3px #a09f9d;
            word-wrap: break-word;
        }

        .button-update-sc {
            color: red;
            margin: 5px 5px 5px 20px;
        }

        .table_blur tbody:hover tr:hover td {
            color: #444444;
            text-shadow: none;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2 align="center"><spring:message code="your.basket"/></h2>
<br>
<c:if test="${basket.basketInfos.size()==0}">
    <br><br>
    <h2><spring:message code="noItems.basket"/><br> <a href="/main" class="btn btn-success"><spring:message code="services.basket"/></a></h2>
</c:if>
<c:if test="${basket.basketInfos.size()!=0}">
    <a href="/main" class="btn btn-success"><spring:message code="back.basket"/></a>
    <c:url value="/basket" var="getBasket"/>
    <form:form method="post" action="${getBasket}" modelAttribute="basket">
        <table border="1" cellpadding="10" class="table_blur" align="center">
            <tr>
                <th>№</th>
                <th><spring:message code="nameUser.order"/></th>
                <th><spring:message code="price.basket"/></th>
                <th><spring:message code="quantity.basket"/></th>
                <th><spring:message code="cost.basket"/></th>
                <th><spring:message code="action.basket"/></th>
            </tr>
            <c:forEach var="item" items="${basket.basketInfos}" varStatus="status">
                <form:hidden path="basketInfos[${status.index}].serviceInfo.id"/>
                <tr>
                    <td>${status.index+1}</td>
                    <td> ${item.serviceInfo.name}</td>
                    <td> ${item.serviceInfo.price} <c:if
                            test="${item.serviceInfo.category.id==1||item.serviceInfo.category.id==3}"> BYR per/km</c:if>
                        <c:if
                                test="${item.serviceInfo.category.id==2||item.serviceInfo.category.id==5}"> BYR per/day</c:if>
                    </td>
                    <td>
                        <form:input path="basketInfos[${status.index}].quantity"/> <c:if
                            test="${item.serviceInfo.category.id==1||item.serviceInfo.category.id==3}">km(s)</c:if>
                        <c:if
                                test="${item.serviceInfo.category.id==2||item.serviceInfo.category.id==5}">day(s)</c:if></td>

                    <c:set var="amount" value="${item.amount}"/>
                    <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${amount}"/> BYR</td>
                    <td>
                        <a title="Delete product from basket" href="/basket/delete?idService=${item.serviceInfo.id}"
                           class="btn btn-danger"><spring:message code="deleteCategory.main"/></a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3"></td>
                <td><input type="submit" class="button-update-sc" value="Update Quantity"/>
                </td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td align="right" colspan="4"><spring:message code="total.basket"/></td>
                <td align="center">${basket.amountTotal} BYR</td>
                <td>
                        <form:hidden path="userInfo.id"/>
                    <c:if test="${basket.amountTotal > 0}">
                    <a title="Confirm order" href="/order"><spring:message code="confirm.basket"/></a>
                    </c:if>
                    <br><br>
            </tr>
        </table>
    </form:form>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>