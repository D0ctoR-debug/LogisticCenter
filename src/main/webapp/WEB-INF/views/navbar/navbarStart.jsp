<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<header>
    <nav id="navbarStart" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-xxl">
            <a class="navbar-brand" href="#Welcome"><img
                    src="https://www.transinfo.by/files/transinfo/reg_images/logis_logo.jpeg"
                    class="rounded float-start" width="70" height="50"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="btn btn-secondary" href="#Services"><spring:message code="service.start"/> </a>
                    </li>
                </ul>
                <div class="text-end">
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
</header>