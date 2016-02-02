<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
    <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
        <ul class="cd-switcher">
            <li><a href="#0">Sign in</a></li>
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
                <p class="fieldset">
                    <input class="full-width" type="submit" value="Login">
                </p>
            </form>
            <a href="#0" class="cd-close-form">Close</a>
        </div> <!-- cd-login -->
    </div> <!-- cd-user-modal-container -->
</div> <!-- cd-user-modal -->
