<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang=${language}>
<head>
<c:set var="title" value="Receipts" scope="page"/>

    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Order list</title>
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

    <link rel="stylesheet" href="css/myCss.css">
    <link href="css/mainCSS.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<c:set var="currentPage" value="client" scope="page"/>
<jsp:useBean id="client" scope="session" type="entity.Client"/>
<div class="between"></div>
<%session.setAttribute("pageName","orderListForAdmin.jsp");%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="order.all" bundle="${lang}" var="allsorting"/>
    <fmt:message key="order.not.approved" bundle="${lang}" var="notApproved"/>
    <fmt:message key="order.approved.by.me" bundle="${lang}" var="approved"/>
    <fmt:message key="order.client.id" bundle="${lang}" var="clientId"/>
    <fmt:message key="order.manager.id" bundle="${lang}" var="managerId"/>

    <fmt:message key="order.page.id" bundle="${lang}" var="orderId"/>
    <fmt:message key="order.page.status" bundle="${lang}" var="status"/>
    <fmt:message key="order.page.date" bundle="${lang}" var="date"/>
    <fmt:message key="order.page.dishes" bundle="${lang}" var="dishes"/>
    <fmt:message key="order.page.total" bundle="${lang}" var="total"/>

    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="header.all.dishes" bundle="${lang}" var="all"/>
    <fmt:message key="index.dropDown.href" bundle="${lang}" var="dropDown"/>
    <fmt:message key="header.orders" bundle="${lang}" var="orders"/>
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
<c:set var="currentPage" value="pagination" scope="page"/>
<div class="form-block">
    <form action="adminOrderPage">
        <select name="filter">
            Show receipts:
            <option ${param.filter == "all" ? "selected" : ""} value="all">${allsorting}</option>
            <option ${param.filter == "not-approved" ? "selected" : ""} value="not-approved">${notApproved}</option>
            <option ${param.filter == "approved-by-me" ? "selected" : ""} value="approved-by-me">${approved}</option>
        </select>
        <input type="submit" value="Show">
    </form>
</div>
<div class="container my-3">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">${orderId}</th>
            <th scope="col">${clientId}</th>
            <th scope="col">${managerId}</th>
            <th scope="col">${status}</th>
            <th scope="col">${date}</th>
            <th scope="col">${dishes}</th>
            <th scope="col">${total}</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${receipts}" var="receipt">
            <tr>
                <th>${receipt.id}</th>
                <th>${receipt.clientId}</th>
                <th>${receipt.managerId}</th>
                <th>
                        ${receipt.status}
                    <c:if test="${receipt.status.ordinal() != 4 && (receipt.managerId == 0 || receipt.managerId == client.id)}">
                        <form method="get" action="status">
                            <input value="${receipt.id}" name="id" style="display: none">
                            <input value="${receipt.status.ordinal() + 2}" name="status_id" style="display: none">
                            <input type="submit" value="Next status">
                        </form>
                    </c:if>
                </th>
                <th>${receipt.createDate}</th>
                <th>
                    <c:forEach var="dish" items="${receipt.dishes}">
                        <p>${dish.name}: ${dish.price}$</p>
                    </c:forEach>
                </th>
                <th>${receipt.total}&#8372;</th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
