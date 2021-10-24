<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <nav id="navbarUser" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-xxl">
            <a class="navbar-brand" href="/main"><img
                    src="https://www.transinfo.by/files/transinfo/reg_images/logis_logo.jpeg"
                    class="rounded float-start" width="70" height="50"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<%--                    <sec:authorize access="!hasRole('ADMIN')">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="/basket"><spring:message code="basket.profile"/></a>--%>
<%--                    </li>--%>
<%--                    </sec:authorize>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
<%--                    </li>--%>
                </ul>
                <div class="text-end">
                    <a href="?lang=en"><img
                            src="https://cdn.pixabay.com/photo/2017/05/22/01/30/united-kingdom-2332854_640.png"
                            width="50" height="50" alt="English"></a>
                    <a href="?lang=ru"><img
                            src="https://cdn.pixabay.com/photo/2019/09/05/01/04/russia-4452835_1280.png" width="40"
                            height="40" alt="Русский"></a>
                    <a role="button" class="btn btn-outline-danger" href="/logout"><spring:message code="signOut.main"/></a>
                </div>
            </div>
        </div>
    </nav>
</header>
