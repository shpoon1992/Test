<%@ page import="model.*" %>
<jsp:include page="start.jsp"/>
<body>
    <%
    HttpSession mySession = request.getSession(false);
    Team team = (Team) mySession.getAttribute("team");
%>

<div class="container-fluid site-contents">

    <!--    HEADER HERE     -->
    <jsp:include page="header.jsp"/>
    <!--    HEADER HERE     -->



    <!--    BODY HERE     -->

    <div id="main" class="row-fluid">

        <!-- Check if user has login -->
        <%

            if (team != null) {
        %>
        <div class="questions">
            <div class="question-count">
                <!--Question 1/8-->
                <label onclick="backtohome();">Back to Home</label>
            </div>
            <div class='question-text'>
                <!--How much time can you commit to the Santa gig?-->
                Current Score Achieved:&emsp;<%=team.getTeamScore()%>
            </div>
            <%--<div class="answers clear clearfix">
                <div class="answer-row">
                    <label class="answer-text answer-0 odd" data-answer-number="0">
                        &lt;%&ndash;I'm free this weekend&ndash;%&gt;
                        <a href="/retrieve?teamId=<%=team.getTeamId()%>">Edit Member Details</a>
                    </label>
                    <label class="answer-text answer-1 even" data-answer-number="1">
                        <a href="/viewscore?teamId=<%=team.getTeamId()%>">View Current Score</a>
                    </label>
                </div>
                <div class="answer-row">
                    <label class="answer-text answer-2 odd" data-answer-number="2">
                        <a href="">Attempt Quiz</a>
                    </label>
                    <label class="answer-text answer-3 even" data-answer-number="3" onclick="onLogout()">
                        <a href="/logout">Log Out</a>
                    </label>
                </div>
            </div>--%>
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
<jsp:include page="endscore.jsp"/>