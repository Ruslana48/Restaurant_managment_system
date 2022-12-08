<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<c:set var="title" value="Cart" scope="page"/>
<head>
    <title>Cart</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
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

        <!-- Template Main CSS File -->
        <link href="css/mainCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/myCss.css">
    </head>
<body>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="cart.total" bundle="${lang}" var="totalPrice"/>
    <fmt:message key="dish.name" bundle="${lang}" var="name"/>
    <fmt:message key="dish.description" bundle="${lang}" var="description"/>
    <fmt:message key="dish.price" bundle="${lang}" var="price"/>
    <fmt:message key="cart.buy.now" bundle="${lang}" var="buy"/>
    <fmt:message key="cart.cancel" bundle="${lang}" var="cancel"/>
    <fmt:message key="cart.remove" bundle="${lang}" var="remove"/>
    <fmt:message key="cart.save" bundle="${lang}" var="save"/>
    <fmt:message key="cart.make.an.order" bundle="${lang}" var="order"/>
    <fmt:message key="cart.alert" bundle="${lang}" var="alert"/>

    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="index.menu.href" bundle="${lang}" var="menu"/>
    <fmt:message key="index.dropDown.href" bundle="${lang}" var="dropDown"/>
    <fmt:message key="header.orders" bundle="${lang}" var="orders"/>
    <fmt:message key="header.cart" bundle="${lang}" var="cart"/>
    <fmt:message key="header.account" bundle="${lang}" var="account"/>
    <fmt:message key="header.log.out" bundle="${lang}" var="logOut"/>
    <fmt:message key="admin.my.page" bundle="${lang}" var="mypage"/>
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
<div class="container my-3">
    <%session.setAttribute("pageName","cart.jsp");%>
    <div class="example">
        <form method="post" action="checkout">
            <h3>${totalPrice}: $${total}</h3>
            <input type="submit" class="btn btn-info" value="Check Out">
        </form>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
        <th scope="col">${name}</th>
        <th scope="col">${description}</th>
        <th scope="col">${price}</th>
        <th scope="col">${buy}</th>
        <th scope="col">${cancel}</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dish" items="${clientDishesList}">
            <jsp:useBean id="dish" type="entity.Dish"/>
        <tr>
            <td><fmt:message key="dish.id.${dish.id}.name" bundle="${lang}"/></td>
            <td><fmt:message key="dish.id.${dish.id}.description" bundle="${lang}"/></td>
            <td>${dish.price}$</td>
            <td>
                <input type="hidden" name="id" value="${dish.id}" class="form_input">
                <form method="post" action="cart">
                    <div class="form_group d-flex justify-content-between">
                        <input type="text" name="quantity" class="quantity" min="1">
                    </div>
                    <input type="submit" class="btn btn-info" value="${save}">
                </form>

            </td>
            <td><form class="form_line" method="post" action="remove">
                <a class="btn btn-sm btn-danger" value="${dish.id}" href="remove?id=${dish.id}">${remove}</a></form>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <form action="order" method="get">
        <input type="submit" onclick="alert('${alert}')" value="${order}" data-target="#exampleModal">
    </form>
</div>
</body>
</html>
