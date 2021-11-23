<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<%@include file="/WEB-INF/views/navbar/navbarService.jsp" %>
<body>
<div class="post-wrap">
    <div class="post-item">
        <div class="item-content">
            <div class="item-body">
                <h2 class="text-center"><spring:message code="confirmation.order"/></h2>

                <c:if test="${basketModel.basketInfos.size()==0}">
                    <h3>There is no services in the basket</h3>
                </c:if>
                <c:if test="${basketModel.basketInfos.size()!=0}">
                    <h3><spring:message code="userInfo.order"/>:</h3>
                    <li><spring:message code="nameUser.order"/>: <span>${user.name}</span></li>
                    <li>Email: <span>${user.email}</span></li>
                    <li>Phone Number: <span>${user.phoneNumber}</span></li>
                    <br>
                    <h3><spring:message code="basketSum.order"/> :</h3>
                    <li><spring:message code="total.order"/> ${basketModel.basketInfos.size()} <spring:message
                            code="sentence.order"/>
                        <c:set var="amount" value="${basketModel.amountTotal}"/>
                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${amount}"/> BYR.
                        С учетом скидки вы заплатите <c:out
                                value="${basketModel.amountTotal-(basketModel.amountTotal*user.discount/100)}"/>
                    </li>
                </c:if>
            </div>

            <div class="item-footer">
                <c:if test="${basketModel.basketInfos.size()==0}">
                    <h3><spring:message code="move.order"/> <a href="/basket" class="link"><spring:message
                            code="basketMove.order"/> </a><spring:message code="sentenceTwo.order"/></h3>
                    <a href="/main" class="btn btn-outline-success"><spring:message code="makeOrder.order"/></a><br>
                </c:if>
                <a href="/basket" class="btn btn-outline-primary"><spring:message code="basket.profile"/></a>

            </div>
            <div class="item-footer">
                <c:if test="${basketModel.basketInfos.size()!=0}">
                    <form:form method="post" action="/order" modelAttribute="user">
                        <%--                    <input type="image" value="send" src="/images/confirm.png">--%>
                        <input type="submit" value="send" class="btn btn-success">
                    </form:form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>