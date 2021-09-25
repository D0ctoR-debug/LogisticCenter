<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Doctor
  Date: 20.08.2021
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Haul</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/Services/css/warehouseLogistic.css">
    <style>
        .spoiler {
            padding: 24px;
            border: 1px solid #eee;
        }
        .spoiler + .spoiler {
            margin-top: 16px;
        }
    </style>
    <%@include file="/WEB-INF/views/navbar/navbarService.jsp"%>
</head>
<body>

<div class="Transport">
    <section>
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-12 text-center">
                    <h1>Transport Haul</h1>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <div class="col-12 text-center">
                <p>
                    Новое направление по доставке нового транспорта функционирует с 2018 года, собрав опытную профессиональную команду водителей и специалистов. Работаем по всем направлениям из ЕС в СНГ и Среднюю Азию и в обратном направлении.               </p>
            </div>
        </div>
    </section>
    <section>
        <div class="container-xxl">
            <h2 id="Services">Checkout</h2>
            <p>
                <a class="btn btn-primary" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Переключить первый элемент</a>
            </p>
            <div class="col">
                <div class="collapse multi-collapse" id="multiCollapseExample1">
                    <div class="card card-body">
                        <ul>
                            <li>Планировка зон хранения в соответствии с требуемыми объемами заказчика</li>
                            <li>Организация специальных зон для возврата и блокировки</li>
                            <li>Сверка остатков</li>
                            <li>Инвентаризация с точностью 99,9%</li>
                            <li>Контроль температуры и влажности</li>
                            <li>Низкотемпературные зоны хранения</li>
                        </ul>
                    </div>
                </div>
            </div>
            <p>
                <a class="btn btn-primary" data-bs-toggle="collapse" href="#multiCollapseExample2" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Переключить первый элемент</a>
            </p>
            <div class="col">
                <div class="collapse multi-collapse" id="multiCollapseExample2">
                    <div class="card card-body">
                        <ul>
                            <li>Планировка зон хранения в соответствии с требуемыми объемами заказчика</li>
                            <li>Организация специальных зон для возврата и блокировки</li>
                            <li>Сверка остатков</li>
                            <li>Инвентаризация с точностью 99,9%</li>
                            <li>Контроль температуры и влажности</li>
                            <li>Низкотемпературные зоны хранения</li>
                        </ul>
                    </div>
                </div>
            </div>
            <p>
                <a class="btn btn-primary" data-bs-toggle="collapse" href="#multiCollapseExample3" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Переключить первый элемент</a>
            </p>
            <div class="col">
                <div class="collapse multi-collapse" id="multiCollapseExample3">
                    <div class="card card-body">
                        <ul>
                            <li>Планировка зон хранения в соответствии с требуемыми объемами заказчика</li>
                            <li>Организация специальных зон для возврата и блокировки</li>
                            <li>Сверка остатков</li>
                            <li>Инвентаризация с точностью 99,9%</li>
                            <li>Контроль температуры и влажности</li>
                            <li>Низкотемпературные зоны хранения</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>