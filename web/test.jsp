<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/12/2015
  Time: 9:08 PM
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Who's the King of CTF?</title>

    <!-- IMPORT CSS FILES -->
    <link rel='stylesheet' href='modal/css/reset.css' type='text/css'>
    <link rel='stylesheet' href='css/latin-ext.css' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.min.css" type='text/css'>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" type='text/css'>
    <link rel="stylesheet" href="css/custom.css" type='text/css'>
    <link rel="stylesheet" href="modal/css/style.css"> <!-- Gem style -->

    <!-- IMPORT JAVASCRIPT FILES -->
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script>
        var questions = [{"question":"How much time can you commit to the Santa gig?","answers":["I'm free this weekend","I've got all year","Time is but a concept","Let me check my calendar"],"type":["mall bad","stnick","hipster","office commercial"]},{"question":"What is your holiday beverage of choice?","answers":["Rum <del>and eggnog<\/del>","Milk (and Cookies)","<small>Organic, small-batch, seasonal, micro-brewed IPA<\/small>","Coca-Cola<sup>&reg;<\/sup>"],"type":["bad office","stnick","hipster","commercial"]},{"question":"What is playing on your \"sleigh-dio\"?","answers":["Guns N' Roses","<span class=\"wreck-it\">Today's pop hits<\/span>","You've probably never heard of it","Bing Crosby, Nat King Cole, Sinatra"],"type":["bad","commercial","hipster","stnick"]},{"question":"What is your favourite climate?","answers":["Tropical","Snowy!","Controlled","My couch"],"type":["bad","stnick","office mall commercial","hipster"]},{"question":"What is your preferred method of compensation?","answers":["Promotion (or drink tickets)","More rum please","Cold, hard cash","The joy of the world's children"],"type":["office","bad","commercial mall","stnick"]},{"question":"Do you like children?","answers":["Of course! Children are our future","Sure. Nothing aspirin and a bottle can\u2019t fix.","No thanks! Can't afford that much organic fruit.","Heck no!<br \/> I'm not a pervert!"],"type":["stnick","office","hipster","bad"]},{"question":"What is your signature style?","answers":["Suspenders, shiny buttons","My Armani suit","Black t-shirt","Going commando"],"type":["stnick mall hipster","commercial office","hipster bad","bad office"]},{"question":"Which would you choose for a pet?","answers":["Jack <del>Russell<\/del> Daniels","Reindeer","A mini version of myself","Backyard Chickens"],"type":["bad","stnick mall","commercial","hipster"]}];
        var santas = {"bad":{"title":"Bad Santa","tagline":"Because it's more fun on the naughty list."},"hipster":{"title":"Hipster Santa","tagline":"Ironic beard. Genuine apathy."},"mall":{"title":"Mall Santa","tagline":"In it for Santa's helpers. And the food court."},"office":{"title":"Office Santa","tagline":"Did somebody say holiday bonus?!"},"commercial":{"title":"Commercial Santa","tagline":"Invented to sell crap. And lots of it."},"stnick":{"title":"St. Nick","tagline":"The real deal. Rosy cheeks and jolly laugh included."}};
        var current_question = 0;
        var answers = [];
        var santa_scores = {
            bad: 0,
            hipster: 0,
            mall: 0,
            office: 0,
            commercial: 0,
            stnick: 0,
        };
    </script>
</head>
<body>
<%  HttpSession mySession = request.getSession(false);
    boolean isLoggedIn = request.getParameterMap().containsKey("user");%>

<div class="container-fluid site-contents">
    <jsp:include page="modal.jsp"/>
    <header class="row main-header">
        <div class="presented-by">
            <small>Whitehats presents: A Pre-CTF Understanding Quiz</small>
        </div>
        <div class="image float">
            <img height="204" width="155" src="img/whitehats.png" alt="santa's floating disembodied head" class="float" />
        </div>
        <div>
            <h1 class="title">Are you ready for CTF?</h1>
            <h2 class="sub-title">Take our quiz to find out now!</h2>
        </div>
    </header>
    <div id="main" class="row-fluid">

        <!-- Check if user has login -->
        <%

        if (isLoggedIn) {
            System.out.println("signed in");
            String groupName = (String)session.getAttribute("user");
        %>
        <div class='question-text'>Welcome <%=groupName %>!</div>

        <%
        } else {
            System.out.println("not signed in");
        %>
        <div class='attempt-text'>
            Attempt the quiz now?
        </div>
        <nav class="main-nav">
            <div class="cd-login login-register-text" href="#0">Log In</div>
            <br/>
            <div class="cd-register login-register-text" href="#0">Register</div>
        </nav>
        <%
        }
        %>
        <!--
        <div class="questions">
            <div class="question-count">
            Question 1/8		    </div>
            <div class='question-text'>
            How much time can you commit to the Santa gig?		    </div>
            <div class="answers clear clearfix">
            <div class="answer-row">

            <label class="answer-text answer-0 odd" data-answer-number="0" data-type="mall bad">
            I'm free this weekend    			    </label>

            <label class="answer-text answer-1 even" data-answer-number="1" data-type="stnick">
        I've got all year    			    </label>
        </div>
        <div class="answer-row">

        <label class="answer-text answer-2 odd" data-answer-number="2" data-type="hipster">
        Time is but a concept    			    </label>

        <label class="answer-text answer-3 even" data-answer-number="3" data-type="office commercial">
        Let me check my calendar    			    </label>
        </div>
        <div class="answer-row">
        </div>
        </div>
        </div>
        <div class="your-santa">
        <div class="your-santa-text">
        Congratulations! You're fit to be:
        </div>
        <div class="which-santa">

        </div>
        <div class="which-santa-tagline">

        </div>
        <div class="which-santa-photo">
        <div class="sparkle"></div>
        <img height="433" width="213" src="" alt="" />
        </div>
        <div class="share">
        <a class="twitter" target="_blank" href="">
        Share your Santa
        </a>
        <a class="facebook" target="_blank" href="">
        Share your Santa
        </a>
        </div>
        <div class="which-santa-other">
        <a href="assets/santas.pdf" id="pdf-download">Download the entire set of Santa “Paper doll Decorations” </a> or <a href="http://whosyoursanta.ca/">try again</a>.
        </div>
        <div class="which-santa-other">
        <a href="http://www.rtraction.com/holidayadvice">
        Ten ways to avoid an office party disaster
        </a>
        </div>
        <div class="thanks">
        <div class="clients">
        Thank you to all our clients.
        </div>
        <div class="clients-sub">
        For the third year in a row, we've teamed up with <a href="http://reforestlondon.ca/" target="_blank">Reforest London</a> to plant 100 trees on your behalf!
        </div>
        </div>
        </div>
        -->
    </div>
    <footer class="main-footer">
        <div class="wrap">
            <div class="lr">
                <!--&copy; 2013 rTraction Ho Ho Ho-->
                <a href="">Login</a>&emsp;| &emsp;
                <a href="">Register</a>
            </div>

            <div class="hosted-by">
                Hosted by <a href="http://whitehats.smusa.sg/">Whitehats 2016</a>
            </div>
        </div>
    </footer>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/main.js"></script> <!-- Gem jQuery -->
</body>
</html>
