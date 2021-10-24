<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Doctor
  Date: 21.10.2021
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<%@include file="/WEB-INF/views/navbar/navbarService.jsp" %>
<body>
<h3 align="center">Orders</h3>
<table border="1" cellpadding="10" class="table_blur" align="center">
    <tr>
        <th>№</th>
        <th>Number</th>
        <th>User</th>
        <th>Amount</th>
        <th>Status</th>
<%--        <th>Action</th>--%>
    </tr>
    <c:forEach items="${orders}" var="order" varStatus="status">
        <tr>
            <td>${status.index+1}</td>
            <td>${order.id}</td>
            <td>${order.user.username}</td>
            <td>${order.amount}</td>
            <td>${order.orderStage.name}</td>
<%--            <td>--%>
<%--                <form method="post" action="/order/${order.id}/accept">--%>
<%--                    <button type="submit" class="btn btn-primary">Accept</button>--%>
<%--                </form>--%>
<%--                <form method="post" action="/order/${order.id}/reject">--%>
<%--                    <button type="submit" class="btn btn-danger">Reject</button>--%>
<%--                </form>--%>
<%--            </td>--%>
        </tr>
    </c:forEach>
</table>
<a href="/allOrders/ASC">В порядке возрастания</a>
<a href="/allOrders/desc">В порядке убывания</a>
<br>
<div style="color: #a2010e; font-size: large" align="center">${msg}</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

</body>
</html>