<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<%@page isErrorPage="true" %>
<html lang=${language}>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="index.home.href" bundle="${lang}" var="home"/>
    <fmt:message key="error.smt.went.wrong" bundle="${lang}" var="wrong"/>
    <fmt:message key="new.register.now" bundle="${lang}" var="register"/>
</fmt:bundle>
<a href="localization?language=en_US" class="localization">English</a>|
<a href="localization?language=ua_UA" class="localization_color">Українська</a>
<%session.setAttribute("pageName","error.jsp");%>
<h1 class="display-3">${wrong}!</h1>
    <p><%= exception%></p>
    <a href="index.jsp" class="btn-outline-primary">${home}</a>
</body>
</html>
