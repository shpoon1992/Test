<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/12/2015
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <title>Title</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <!--<link href='../css/latin-ext.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="modal/css/reset.css">  <!-- CSS reset -->
    <!--<link rel="stylesheet" href="modal/css/style.css"> <!-- Gem style -->
    <!--<script src="../js/modernizr.js"></script> <!-- Modernizr -->
</head>
<body>
<!--
<header role="banner">
    <div id="cd-logo"><a href="#0"><img src="modal/img/cd-logo.svg" alt="Logo"></a></div>

    <nav class="main-nav">
        <ul>
            <li><a class="cd-signin" href="#0">Sign in</a></li>
            <li><a class="cd-signup" href="#0">Sign up</a></li>
        </ul>
    </nav>
</header>
-->

<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
    <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
        <ul class="cd-switcher">
            <li><a href="#0">Sign in</a></li>
            <!--<li><a href="#0">New account</a></li>-->
        </ul>

        <div id="cd-login"> <!-- log in form -->
            <form class="cd-form" action="/login" method="post">
                <p class="fieldset">
                    <label class="image-replace cd-username" for="signin-username">Username</label>
                    <input name="username" class="full-width has-padding has-border" id="signin-username" type="text" placeholder="Team Name">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-password" for="signin-password">Password</label>
                    <input name="password" class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password">
                    <!--<a href="#0" class="hide-password">Hide</a>-->
                    <span class="cd-error-message">Error message here!</span>
                </p>
                <!--
                <p class="fieldset">
                    <input type="checkbox" id="remember-me" checked>
                    <label for="remember-me">Remember me</label>
                </p>
                -->
                <p class="fieldset">
                    <input class="full-width" type="submit" value="Login">
                </p>
            </form>
            <!--
            <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>-->
            <a href="#0" class="cd-close-form">Close</a>
        </div> <!-- cd-login -->

        <!-- sign up form -->
        <!--
        <div id="cd-signup">
            <form class="cd-form">
                <p class="fieldset">
                    <label class="image-replace cd-username" for="signup-username">Username</label>
                    <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-email" for="signup-email">E-mail</label>
                    <input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <label class="image-replace cd-password" for="signup-password">Password</label>
                    <input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="Password">
                    <a href="#0" class="hide-password">Hide</a>
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <input type="checkbox" id="accept-terms">
                    <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
                </p>

                <p class="fieldset">
                    <input class="full-width has-padding" type="submit" value="Create account">
                </p>
            </form>

             <a href="#0" class="cd-close-form">Close</a>
        </div> <!-- cd-signup -->

        <!-- reset password form -->
        <!--
        <div id="cd-reset-password">
            <p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

            <form class="cd-form">
                <p class="fieldset">
                    <label class="image-replace cd-email" for="reset-email">E-mail</label>
                    <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                    <span class="cd-error-message">Error message here!</span>
                </p>

                <p class="fieldset">
                    <input class="full-width has-padding" type="submit" value="Reset password">
                </p>
            </form>

            <p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
        </div> <!-- cd-reset-password -->
        <!--<a href="#0" class="cd-close-form">Close</a>-->
    </div> <!-- cd-user-modal-container -->
</div> <!-- cd-user-modal -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="modal/js/main.js"></script> <!-- Gem jQuery -->
</body>
</html>
