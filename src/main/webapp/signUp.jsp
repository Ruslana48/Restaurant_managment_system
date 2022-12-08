<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang=${language}>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration</title>
    <link rel="stylesheet" href="css/signup-style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="cssBootstrapSignUp/style.css">

</head>
<body>
<a href="localization?language=en_US">English</a>|
<a href="localization?language=ua_UA">Українська</a>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n" var="lang"/>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6 col-xl-5">
                <div class="login-wrap p-4 p-md-5">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-edit"></span>
                    </div>
                    <h3 class="text-center mb-4"><fmt:message key="signUp.create.account" bundle="${lang}"/> </h3>
                    <form action="register" class="signup-form" method="post">
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" name="surname" placeholder="Enter Surname">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" name="name" placeholder="Enter Name">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" name="email" placeholder="Enter Email">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" name="mobn" class="form-control" placeholder="Enter Phone Number">
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" name="password" class="form-control"placeholder="Enter Password">
                        </div>
                        <select name="yourrole">
                            <option value="CLIENT">Client</option>
                            <option value="MANAGER">Manager</option>
                        </select>
                        <div class="form-group">
                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                        </div>
                    </form>
                    <p>I'm already a member! <a data-toggle="tab" href="login.jsp">Sign In</a></p>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
</html>
