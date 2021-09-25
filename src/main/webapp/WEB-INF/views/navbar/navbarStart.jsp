<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<header>
    <nav id="navbarStart" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-xxl">
            <a class="navbar-brand" href="#Welcome">LogisticCenter</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <spring:message code="service.start"/>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                            <li><a class="dropdown-item active" href="#TransportLog"><spring:message
                                    code="dropdownTransport.start"/></a></li>
                            <li><a class="dropdown-item" href="#WarehouseLog"><spring:message
                                    code="dropdownWarehouse.start"/></a></li>
                            <li><a class="dropdown-item" href="#Transport"><spring:message
                                    code="dropdownHaul.start"/> </a></li>
                            <li><a class="dropdown-item" href="#Rental"><spring:message
                                    code="dropdownRental.start"/> </a></li>
                            <li><a class="dropdown-item" href="#Purchasing"><spring:message
                                    code="dropdownPurchasing.start"/></a></li>
                            <%--                        <li>--%>
                            <%--                            <hr class="dropdown-divider">--%>
                            <%--                        </li>--%>
                            <%--                        <li><a class="dropdown-item" href="#">Separated link</a></li>--%>
                        </ul>
                    </li>
                </ul>
                <div class="text-end">
                    <%--                    <a role="button" class="btn btn-outline-dark me-3" data-bs-toggle="modal"--%>
                    <%--                       data-bs-target="#exampleModal" href="/login">Login</a>--%>
                    <a role="button" class="btn btn-outline-dark me-3" href="/login"><spring:message
                            code="authorization.startPage"/></a>
                    <a role="button" class="btn btn-outline-success me-3" href="/registration"><spring:message
                            code="registration.startPage"/></a>
                    <a href="?lang=en"><img
                            src="https://cdn.pixabay.com/photo/2017/05/22/01/30/united-kingdom-2332854_640.png"
                            width="50" height="50" alt="English"></a>
                    <a href="?lang=ru"><img
                            src="https://cdn.pixabay.com/photo/2019/09/05/01/04/russia-4452835_1280.png" width="40"
                            height="40" alt="Русский"></a>
                </div>
            </div>
        </div>
    </nav>

<%--    &lt;%&ndash;Modal&ndash;%&gt;--%>
<%--    <c:import url="authorization/login.jsp"/>--%>
</header>