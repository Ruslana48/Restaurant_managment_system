<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error.jsp" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<c:set var="title" value="Catalog" scope="page"/>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Menu</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="css/cartCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" >


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/allstyle.css">

    <link rel="stylesheet" href="css/myCss.css">
    <link href="css/mainCSS.css" rel="stylesheet">
    <link href="css/menuStyle.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<div class="between"></div>
<%session.setAttribute("pageName","menuPagination.jsp");%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="order.page.id" bundle="${lang}" var="orderId"/>
    <fmt:message key="order.page.status" bundle="${lang}" var="status"/>
    <fmt:message key="order.page.date" bundle="${lang}" var="date"/>
    <fmt:message key="order.page.dishes" bundle="${lang}" var="dishesPage"/>
    <fmt:message key="order.page.total" bundle="${lang}" var="total"/>

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
        <a href="index.jsp" class="logo d-flex align-items-center me-auto me-lg-0">
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
<body>
<c:set var="currentPage" value="catalog" scope="page"/>
<nav class="c_header">
    <p class="c_category_name">${empty param.category || param.category == 0 ? "All dishes" : categories.get(param.category-1).name}</p>
    <form class="c_selectsort_form" action="menu" method="get">
        <div>
            Category:
            <label>
                <select name="category" class="form-select">
                    <option value="0"></option>
                    <c:forEach var="category" items="${categories}">
                        <option ${param.category == category.id ? "selected" : ""} value="${category.id}">
                                ${category.name}
                        </option>
                    </c:forEach>
                </select>
            </label>
        </div>
        <div>
            SortBy:
            <select name="sortBy" class="form-select">
                <c:forEach var="sort" items="${sortTypes}">
                    <option ${param.sortBy == sort.value ? "selected" : ""} value="${sort.value}">${sort.key}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            ShowOnPage:
            <select name="dishesOnPage" class="form-select">
                <c:forTokens items="6,9,12" delims="," var="item">
                    <option ${param.dishesOnPage == item ? "selected" : ""}>${item}</option>
                </c:forTokens>
            </select>
        </div>
        <select name="page" style="display: none">
            <option value="0" selected></option>
        </select>
        <input class="btn btn-outline-secondary" type="submit" value="show"/>
    </form>
</nav>

<main id="main">
    <div class="c_dishes2">
        <c:forEach var="dish" items="${dishes}">
            <%@include file="dish.jspf" %>
        </c:forEach>
    </div>
</main>

<nav class="c_pagination">
    <ul class="pagination justify-content-end">
        <li class="page-item ${param.page > 0 ? "" : "disabled"}">
            <a class="page-link"
               href="menu?category=${param.category}&sortBy=${param.sortBy}&page=${param.page-1}&dishesOnPage=${param.dishesOnPage}"
               tabindex="-1">
                Previous
            </a>
        </li>
        <c:forEach var="num" begin="0" end="${maxPage}">
            <li class="page-item ${param.page == num ? "active" : ""}">
                <a class="page-link"
                   href="menu?category=${param.category}&sortBy=${param.sortBy}&page=${num}&dishesOnPage=${param.dishesOnPage}">
                        ${num+1}
                </a>
            </li>
        </c:forEach>
        <li class="page-item ${param.page < maxPage ? "" : "disabled"}">
            <a class="page-link"
               href="menu?category=${param.category}&sortBy=${param.sortBy}&page=${param.page+1}&dishesOnPage=${param.dishesOnPage}">
                Next
            </a>
        </li>
    </ul>
</nav>

</body>
</html>