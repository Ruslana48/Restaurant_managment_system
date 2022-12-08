<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Account</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/mainCSS.css" rel="stylesheet">
    <link rel="stylesheet" href="css/allstyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/myCss.css">
</head>
<body>
<c:set var="currentPage" value="client" scope="page"/>
<jsp:useBean id="client" scope="session" type="entity.Client"/>
<div class="between"></div>
<%session.setAttribute("pageName","AccountPageForClient.jsp");%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="account.information" bundle="${lang}" var="info"/>
    <fmt:message key="login.label.email" bundle="${lang}" var="Email"/>
    <fmt:message key="account.phone" bundle="${lang}" var="phone"/>
    <fmt:message key="login.label.password" bundle="${lang}" var="Password"/>
    <fmt:message key="account.change.password" bundle="${lang}" var="changePassword"/>

    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="index.menu.href" bundle="${lang}" var="menu"/>
    <fmt:message key="index.dropDown.href" bundle="${lang}" var="dropDown"/>
    <fmt:message key="header.orders" bundle="${lang}" var="orders"/>
    <fmt:message key="header.cart" bundle="${lang}" var="cart"/>
    <fmt:message key="header.account" bundle="${lang}" var="account"/>
    <fmt:message key="header.log.out" bundle="${lang}" var="logOut"/>
</fmt:bundle>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <a href="index.html" class="logo d-flex align-items-center me-auto me-lg-0">
            <h1>Restaurantly<span>.</span></h1>
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="index.jsp">${home}</a></li>
                <li><a href="menuPagination.jsp">${menu}</a> </li>
                <li><a href="orderListForClient.jsp">${orders}</a> </li>
                <li><a href="cart.jsp">${cart}</a></li>
                <li class="dropdown"><a href="#"><span>${dropDown}</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                </li>
                <li><a href="AccountPageForClient.jsp">${account}</a></li>
                <li><a href="logout?logout=">${logOut}</a> </li>
                <a href="localization?language=en_US" class="localization">English</a>|
                <a href="localization?language=ua_UA" class="localization_color">Українська</a>
            </ul>
        </nav><!-- .navbar -->

    </div>
</header>
<!-- End Header -->

<section class="vh-100" style="background-color: #f4f5f7;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-6 mb-4 mb-lg-0">
                <div class="card mb-3" style="border-radius: .5rem;">
                    <div class="row g-0">
                        <div class="col-md-4 gradient-custom text-center text-dark"
                             style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                            <img src="avatar.jpg"
                                 alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                            <h5>${client.surname} ${client.name}</h5>
                            <p>${client.status}</p>
                            <i class="far fa-edit mb-5"></i>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body p-4">
                                <h6>${info}</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>${Email}</h6>
                                        <p class="text-muted">${client.email}</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <h6>${phone}</h6>
                                        <p class="text-muted">${client.phone}</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <a href="newPassword.jsp">${changePassword}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
