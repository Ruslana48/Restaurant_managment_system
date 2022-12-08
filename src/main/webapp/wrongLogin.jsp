<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<head>
    <title>Wrong Login</title>
</head>
<body>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
    <fmt:message key="index.logIn.href" bundle="${lang}" var="logIn"/>
    <fmt:message key="wrong.email.or.password" bundle="${lang}" var="wrong"/>
</fmt:bundle>
<a href="localization?language=en_US" class="localization">English</a>|
<a href="localization?language=ua_UA" class="localization_color">Українська</a>
<%session.setAttribute("pageName","wrongLogin.jsp");%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>${wrong}!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <a href="login.jsp">${logIn}</a>
    </button>
</div>
</body>
</html>
