<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<%@page isErrorPage="true" %>
<html lang=${language}>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>404</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="error.oops" bundle="${lang}" var="opps"/>
    <fmt:message key="error.not.found" bundle="${lang}" var="notFound"/>
    <fmt:message key="error.not.exist" bundle="${lang}" var="notExist"/>
</fmt:bundle>
<a href="localization?language=en_US" class="localization">English</a>|
<a href="localization?language=ua_UA" class="localization_color">Українська</a>
<%session.setAttribute("pageName","error404.jsp");%>
<div class="d-flex align-items-center justify-content-center vh-100">
    <div class="text-center">
        <h1 class="display-1 fw-bold">404</h1>
        <p class="fs-3"> <span class="text-danger">${opps}!</span> ${notFound}.</p>
        <p class="lead">
            ${notExist}.
        </p>
        <a href="index.jsp" class="btn btn-primary">${home}</a>
    </div>
</div>
</body>
</html>

