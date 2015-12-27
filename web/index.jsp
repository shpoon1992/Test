<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/12/2015
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Testing Nia</title>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#gotoadd").click(function(){
                $(location).attr("href", "/add.jsp");
            });
        });
    </script>
</head>
<body>

    <form action="/test" method="post">
        <input type="submit" value="Submit"/>
    </form>
    <input id="gotoadd" type="button" value="Add Question"/>
</body>
</html>
