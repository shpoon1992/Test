<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/main.js"></script> <!-- Gem jQuery -->
<script type="text/javascript">
    $(document).ready(function(){
        if (window.location.href.indexOf("test") == -1) {
            window.location.replace("/test.jsp");
        }
        if (window.history && window.history.pushState) {
            window.history.pushState('forward', null, './');

            $(window).on('popstate', function () {
                window.history.pushState('forward', null, './');
            });
        }
    });
</script>
</body>
</html>