<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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

        .table_blur tbody:hover tr:hover td {
            color: #444444;
            text-shadow: none;
        }
    </style>
</head>
<%@include file="/WEB-INF/views/navbar/navbarService.jsp" %>
<body>
<h3 align="center">Orders</h3>
<c:if test="${orders.size()==0}">
    <h1>No orders</h1>
</c:if>
<c:if test="${orders.size()!=0}">
    <table border="1" cellpadding="10" class="table_blur" align="center">
        <tr>
            <th>№</th>
            <th>Number</th>
            <th>User</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${orders}" var="order" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${order.id}</td>
                <td>${order.user.username}</td>
                <td>${order.amount} BYR</td>
                <td>${order.orderStage.name}</td>
                <td>
                    <form method="post" action="/order/${order.id}/accept">
                        <button type="submit" class="btn btn-primary">Accept</button>
                    </form>
                    <form method="post" action="/order/${order.id}/reject">
                        <button type="submit" class="btn btn-danger">Reject</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
</c:if>
<div style="color: #a2010e; font-size: large" align="center">${msg}</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

</body>
</html>
