<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/main.js"></script> <!-- Gem jQuery -->
<script type="text/javascript">
    $(document).ready(function(){
        var url = window.location.href;
        if (url.indexOf("edit") == -1) {
            window.location.replace("/edit.jsp");
        }

        if (window.history && window.history.pushState) {
            window.history.pushState('forward', null, './edit.jsp');
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, './edit.jsp');
            });
        }
    });
    function backtohome() {
        window.location.replace("/home.jsp");
    }
</script>
</body>
</html>