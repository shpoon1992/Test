<%@ page import="model.*" %>
<jsp:include page="start.jsp"/>
<body>
<%
    HttpSession mySession = request.getSession(false);
    Team team = (Team) mySession.getAttribute("team");
%>

<div class="container-fluid site-contents">

    <!--    LOGIN MODAL HERE    -->
    <jsp:include page="modal.jsp"/>
    <!--    LOGIN MODAL HERE    -->



    <!--    HEADER HERE     -->
    <jsp:include page="header.jsp"/>
    <!--    HEADER HERE     -->



    <!--    BODY HERE     -->

    <div id="main" class="row-fluid">

        <!-- Check if user has login -->
        <%
        if (team != null) {
            System.out.println("signed in");
        %>
        <script type="text/javascript">
            window.location.replace("/home.jsp");
        </script>
        <%
        } else {
            System.out.println("not signed in");
        %>
        <div class='attempt-text'>
            Attempt the quiz now?
        </div>
        <nav class="main-nav">
            <div class="cd-login login-register-text" href="#0">Log In</div>
            <%--
            <br/>
            <div class="cd-register login-register-text" href="#0">Register</div>
            --%>
        </nav>
        <%
        }
        %>
        <%--
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
        --%>
    </div>

    <!--    BODY HERE     -->



    <!--    FOOTER HERE     -->
    <jsp:include page="footer.jsp"/>
    <!--    FOOTER HERE     -->

</div>

<jsp:include page="endindex.jsp"/>