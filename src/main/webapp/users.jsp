<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:set var="title" value="Users" scope="page"/>
<c:set var="currentPage" value="client" scope="page"/>
<jsp:useBean id="client" scope="session" type="entity.Client"/>
<div class="between"></div>
<%session.setAttribute("pageName","orderListForClient.jsp");%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="order.page.id" bundle="${lang}" var="orderId"/>
    <fmt:message key="order.page.status" bundle="${lang}" var="status"/>
    <fmt:message key="order.page.date" bundle="${lang}" var="date"/>
    <fmt:message key="order.page.dishes" bundle="${lang}" var="dishes"/>
    <fmt:message key="order.page.total" bundle="${lang}" var="total"/>

    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="index.menu.href" bundle="${lang}" var="menu"/>
    <fmt:message key="index.dropDown.href" bundle="${lang}" var="dropDown"/>
    <fmt:message key="header.orders" bundle="${lang}" var="orders"/>
    <fmt:message key="header.cart" bundle="${lang}" var="cart"/>
    <fmt:message key="header.account" bundle="${lang}" var="account"/>
    <fmt:message key="header.log.out" bundle="${lang}" var="logOut"/>
</fmt:bundle>
<body>
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
<c:set var="currentPage" value="users" scope="page"/>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">id</th>
        <th scope="col">login</th>
        <th scope="col">role</th>
        <th scope="col">createDate</th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    </thead>
</table>
</body>
</html>
