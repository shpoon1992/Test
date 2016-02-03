<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/main.js"></script> <!-- Gem jQuery -->
<script type="text/javascript">
    $(document).ready(function(){
        var url = window.location.href;
        if (url.indexOf("viewteamscore") == -1) {
            window.location.replace("/viewteamscore.jsp");
        }

        if (window.history && window.history.pushState) {
            window.history.pushState('forward', null, './viewteamscore.jsp');
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, './viewteamscore.jsp');
            });
        }
    });
    function backtohome() {
        window.location.replace("/home.jsp");
    }
</script>
</body>
</html>