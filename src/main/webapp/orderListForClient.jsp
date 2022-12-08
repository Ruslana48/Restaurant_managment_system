<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mysql.ReceiptDaoSql" %>
<%@ page import="entity.Dish" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="css/myCss.css">
    <link href="css/mainCSS.css" rel="stylesheet">
    <link rel="stylesheet" href="css/allstyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
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
<c:if test="${clientDishesList.size() == 0}">
    <p class="cart_empty">Cart is empty</p>
</c:if>
<div class="dc_container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">${orderId}</th>
            <th scope="col">${status}</th>
            <th scope="col">${date}</th>
            <th scope="col">${dishes}</th>
            <th scope="col">${total}</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${clientOrdersList}">
            <jsp:useBean id="order" type="entity.Order"/>
            <tr>
                <td><p>${order.id}</p></td>
                <td><p>${order.status}</p></td>
                <td><p>${order.createDate}</p></td>
                <td><%
                    ReceiptDaoSql rds=new ReceiptDaoSql();
                    List<Dish> allDishes=rds.getAllOrderDishes(order.getId());
                    for (Dish d:allDishes) {
                %>
                    <p><%=d.getName()%>: <%=d.getPrice()%>$</p>
                    <%
                        }
                    %></td>
                <td><p>${order.total}$</p></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
