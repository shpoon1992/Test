<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<jsp:include page="start.jsp"/>
<body>
<%
    HttpSession mySession = request.getSession(false);
    Team team = (Team) mySession.getAttribute("team");
    List<Member> memberList = (List<Member>) mySession.getAttribute("mList");
%>

<div class="container-fluid site-contents">

    <!--    HEADER HERE     -->
    <jsp:include page="header.jsp"/>
    <!--    HEADER HERE     -->



    <!--    BODY HERE     -->

    <div id="main" class="row-fluid">

        <!-- Check if user has login -->
        <%

            if (memberList != null || memberList.size() > 0) {
        %>
        <div class='question-text'>Welcome <%=team.getTeamName() %>!</div>
        <!--
        <nav class="main-nav">
            <div class="cd-login login-register-text" href="#0">Log In</div>
            <br/>
            <div class="cd-register login-register-text" href="#0">Register</div>
        </nav>
        -->
        <div class="questions">
            <div class="question-count">
                <!--Question 1/8-->
            </div>
            <div class='question-text'>
                <!--How much time can you commit to the Santa gig?-->
                Member Details
            </div>
            <div class="answers clear clearfix">
                <div class="answer-row">
                    <label class="answer-text answer-0 odd" data-answer-number="0">
                        <!--I'm free this weekend-->
                        NAME
                    </label>
                    <label class="answer-text answer-1 even" data-answer-number="1">
                        PHONE NUMBER
                    </label>
                </div>
                <div class="answer-row">
                    <label class="answer-text answer-2 odd" data-answer-number="2">
                        Member 1
                    </label>
                    <label class="answer-text answer-3 even" data-answer-number="3" onclick="onLogout()">
                        93749574
                    </label>
                </div>
                <div class="answer-row">
                    <label class="answer-text answer-4 odd" data-answer-number="4">
                        Member 2
                    </label>
                    <label class="answer-text answer-5 even" data-answer-number="5">
                        93748575
                    </label>
                </div>
                <div class="answer-row">
                    <label class="answer-text answer-6 odd" data-answer-number="6">
                        Member 3
                    </label>
                    <label class="answer-text answer-7 even" data-answer-number="7">
                        93748372
                    </label>
                </div>
            </div>
        </div>
        <%
        } else {
            System.out.println("not signed in");
            //Navigator.navigate(request, response, "/test.jsp", getServletConfig().getServletContext());
        %>
        <script type="text/javascript">
            window.location.replace("/test.jsp");
        </script>
        <%
            }
        %>
    </div>

    <!--    BODY HERE     -->



    <!--    FOOTER HERE     -->
    <jsp:include page="footer.jsp"/>
    <!--    FOOTER HERE     -->

</div>
<jsp:include page="endview.jsp"/>
