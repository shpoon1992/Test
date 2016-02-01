<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2016
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Refresh" content="5;url=test.jsp">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Who's the King of CTF?</title>

    <link rel='stylesheet' href='css/latin-ext.css' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.min.css" type='text/css'>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" type='text/css'>
    <link rel="stylesheet" href="css/custom.css" type='text/css'>

    <!-- IMPORT JAVASCRIPT FILES -->
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            window.scrollTo(0,document.body.scrollHeight);
        });
    </script>
</head>
<body>
    <!--    HEADER HERE     -->
    <header class="row main-header">
        <div class="presented-by">
            <small>Whitehats presents: A CTF Understanding Quiz</small>
        </div>
        <div class="image float">
            <img height="204" width="155" src="img/whitehats.png" alt="santa's floating disembodied head" class="float" />
        </div>
        <div>
            <h1 class="title">Are you ready for CTF?</h1>
            <h2 class="sub-title">Take our quiz to find out now!</h2>
        </div>
    </header>

    <!--    HEADER HERE     -->


    <!--    BODY HERE     -->

    <div id="main" class="row-fluid">
        <h1 style="color:red">INCORRECT TEAM NAME OR PASSWORD!</h1>
        <h1 style="color:red">REDIRECTING BACK TO HOME PAGE...</h1>
    </div>

    <!--    BODY HERE     -->


    <!--    FOOTER HERE     -->

    <footer class="main-footer">
        <div class="wrap">
            <!--&copy; 2013 rTraction Ho Ho Ho-->
            <!--<div class="lr main-nav">
                <p>
                <a class="cd-login" href="#0">Login</a>&emsp;
                <label class="separator">|</label>&emsp;
                <a class="cd-register" href="#0">Register</a>
                </p>
            </div>
            -->
            <div class="hosted-by">
                Hosted by <a href="http://whitehacks.sg/">Whitehats 2016</a>
            </div>
        </div>
    </footer>

    <!--    FOOTER HERE     -->
</body>
</html>
