<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>All dishes</title>

    <meta content="" name="description">
    <meta content="" name="keywords">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
<%session.setAttribute("pageName","dishesForManager.jsp");%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="dish.image" bundle="${lang}" var="image"/>
    <fmt:message key="dish.name" bundle="${lang}" var="dishName"/>
    <fmt:message key="dish.price" bundle="${lang}" var="price"/>
    <fmt:message key="dish.description" bundle="${lang}" var="description"/>
    <fmt:message key="dish.weight" bundle="${lang}" var="weight"/>

    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="header.all.dishes" bundle="${lang}" var="all"/>
    <fmt:message key="index.dropDown.href" bundle="${lang}" var="dropDown"/>
    <fmt:message key="header.orders" bundle="${lang}" var="orders"/>
    <fmt:message key="header.cart" bundle="${lang}" var="cart"/>
    <fmt:message key="header.account" bundle="${lang}" var="account"/>
    <fmt:message key="header.log.out" bundle="${lang}" var="logOut"/>
</fmt:bundle>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <a href="index.jsp" class="logo d-flex align-items-center me-auto me-lg-0">
            <h1>Restaurantly<span>.</span></h1>
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="index.jsp">${home}</a></li>
                <li><a href="dishesForManager.jsp">${all}</a></li>
                <li><a href="orderListForAdmin.jsp">${orders}</a> </li>
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

<div class="dc_container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">${image}</th>
            <th scope="col">${dishName}</th>
            <th scope="col">${description}</th>
            <th scope="col">${weight}</th>
            <th scope="col">${price}</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dish" items="${dishesForManager}">
            <jsp:useBean id="dish" type="entity.Dish"/>
            <tr>
            <td><img class="dc_img" src="imagesForMenu/dish-${dish.id}.jpg"></td>
            <td><p><b>${dish.name}</b></p></td>
            <td><p>${dish.description}</p></td>
            <td><p class="weight">${dish.weight}g</p></td>
            <td><p class="price">${dish.price}$</p></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
