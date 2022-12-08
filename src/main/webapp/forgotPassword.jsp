<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error.jsp" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html lang=${language}>
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <title>Forgot Password</title>
  <link
          href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
          rel='stylesheet'>
  <link href='' rel='stylesheet'>
  <script type='text/javascript'
          src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
  <link rel="stylesheet" href="css/myCss.css">
</head>
<body oncontextmenu='return false' class='snippet-body'>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<fmt:bundle basename="i18n">
  <fmt:message key="forgot.password" bundle="${lang}" var="forgot"/>
  <fmt:message key="password.change" bundle="${lang}" var="change"/>
  <fmt:message key="password.enter.email" bundle="${lang}" var="enterEmailbelow"/>
  <fmt:message key="password.send" bundle="${lang}" var="send"/>
  <fmt:message key="password.otp" bundle="${lang}" var="otp"/>
  <fmt:message key="password.enter.only.email" bundle="${lang}" var="onlyEmail"/>
  <fmt:message key="password.enter.register.email" bundle="${lang}" var="registerEmail"/>
  <fmt:message key="password.get.new.password" bundle="${lang}" var="getPassword"/>
  <fmt:message key="password.back" bundle="${lang}" var="back"/>
</fmt:bundle>
<a href="localization?language=en_US" class="localization">English</a>|
<a href="localization?language=ua_UA" class="localization_color">Українська</a>
<%session.setAttribute("pageName","forgotPassword.jsp");%>
<div class="container padding-bottom-3x mb-2 mt-5">
  <div class="row justify-content-center">
    <div class="col-lg-8 col-md-10">
      <div class="forgot">
        <h2>${forgot}?</h2>
        <p>${change}!</p>
        <ol class="list-unstyled">
          <li><span class="text-primary text-medium">1. </span>${enterEmailbelow}</li>
          <li><span class="text-primary text-medium">2. </span>${send}</li>
          <li><span class="text-primary text-medium">3. </span>${otp}</li>
        </ol>
      </div>
      <form class="card mt-4" action="forgotPassword" method="POST">
        <div class="card-body">
          <div class="form-group">
            <label for="email-for-pass">${onlyEmail}</label> <input
                  class="form-control" type="text" name="email" id="email-for-pass" required=""><small
                  class="form-text text-muted">${registerEmail}.</small>
          </div>
        </div>
        <div class="card-footer">
          <button class="btn btn-success" type="submit">${getPassword}</button>
          <button class="btn btn-danger" type="submit"><a class="a_color" href="login.jsp">${back}</a></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript' src=''></script>
<script type='text/javascript' src=''></script>
<script type='text/Javascript'></script>
</body>
</html>

