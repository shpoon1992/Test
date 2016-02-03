$().ready(function() {
    attach_click();
    $('.share a').click(function(){
        if($(this).hasClass('twitter')){
            ga('send', 'event', 'share', 'click', 'twitter', 1);
            } else if($(this).hasClass('facebook')) {
            ga('send', 'event', 'share', 'click', 'facebook', 1);
        }
    });
    $('.download').click(function(){
        ga('send', 'event', 'download', 'click', 'pdf', 1);
    });
    
    var formModal = $('.cd-user-modal'),
    formLogin = formModal.find('#cd-login'),
    formSignup = formModal.find('#cd-signup'),
    formForgotPassword = formModal.find('#cd-reset-password'),
    formModalTab = $('.cd-switcher'),
    tabLogin = formModalTab.children('li').eq(0).children('a'),
    tabSignup = formModalTab.children('li').eq(1).children('a'),
    forgotPasswordLink = formLogin.find('.cd-form-bottom-message a'),
    backToLoginLink = formForgotPassword.find('.cd-form-bottom-message a'),
    mainNav = $('.main-nav');
    
	//open modal
	mainNav.on('click', function(event){
		$(event.target).is(mainNav) && mainNav.children('ul').toggleClass('is-visible');
    });
    
	//open sign-up form
	//mainNav.on('click', '.cd-register', signup_selected);
	//open login-form form
	mainNav.on('click', '.cd-login', login_selected);
    
	//close modal
	formModal.on('click', function(event){
		if( $(event.target).is(formModal) || $(event.target).is('.cd-close-form') ) {
			formModal.removeClass('is-visible');
        }	
    });
	//close modal when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		formModal.removeClass('is-visible');
        }
    });
    
	//switch from a tab to another
	/*formModalTab.on('click', function(event) {
		event.preventDefault();
		( $(event.target).is( tabLogin ) ) ? login_selected() : signup_selected();
    });
    
	//hide or show password
	$('.hide-password').on('click', function(){
		var togglePass= $(this),
        passwordField = togglePass.prev('input');
		
		( 'password' == passwordField.attr('type') ) ? passwordField.attr('type', 'text') : passwordField.attr('type', 'password');
		( 'Hide' == togglePass.text() ) ? togglePass.text('Show') : togglePass.text('Hide');
		//focus and move cursor to the end of input field
		passwordField.putCursorAtEnd();
    });
    
	//show forgot-password form 
	forgotPasswordLink.on('click', function(event){
		event.preventDefault();
		forgot_password_selected();
    });
    
	//back to login from the forgot-password form
	backToLoginLink.on('click', function(event){
		event.preventDefault();
		login_selected();
    });*/
    
	function login_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.addClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.addClass('selected');
		tabSignup.removeClass('selected');
    }
    
	/*function signup_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.removeClass('is-selected');
		formSignup.addClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.removeClass('selected');
		tabSignup.addClass('selected');
    }
    
	function forgot_password_selected(){
		formLogin.removeClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.addClass('is-selected');
    }
    
	//REMOVE THIS - it's just to show error messages 
	formLogin.find('input[type="submit"]').on('click', function(event){
		event.preventDefault();
		formLogin.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    });
	formSignup.find('input[type="submit"]').on('click', function(event){
		event.preventDefault();
		formSignup.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    });*/
    
    
	//IE9 placeholder fallback
	//credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
	if(!Modernizr.input.placeholder){
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
            }
            }).blur(function() {
		 	var input = $(this);
		  	if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.val(input.attr('placeholder'));
            }
        }).blur();
		$('[placeholder]').parents('form').submit(function() {
		  	$(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
			 		input.val('');
                }
            })
        });
    }

    //mainNav.find( "a" ).css("display", "inline-block");
    //mainNav.find( "a" ).css("display", "inline-flex");
    //$( ".main-nav a" ).css( "border", "13px solid red" );
    
    
});

function attach_click() {
    $('.answer-text').bind('click', function() {
        var timeout = 250;
        var answer_number = parseInt($(this).attr('data-answer-number'));
        answer_number += 1;
        ga('send', {
            'hitType': 'event',
            'eventCategory': 'answers',
            'eventAction': 'pick',
            'eventLabel': 'question_'+current_question,
            'eventValue': answer_number
        });
        // prevent second/third/fourth clicking
        $('.answer-text').unbind('click');
        var $answers = $(this).parent();
        $answers.find('.selected').removeClass('selected');
        $(this).addClass('selected');
        var type = $(this).attr('data-type');
        type = type.split(' ');
        for (i in type) {
            santa_scores[type[i]]++;
        }
        current_question++;
        //let them see their selection for a bit
        var wrecked = false;
        if ($(this).find('.wreck-it').length > 0) {
            miley();
            timeout = 3000;
            wrecked = true;
        }
        setTimeout(function() {
            if (wrecked) {
                $('.wrecking-ball').removeClass('came-in-like-a');
            }
            display_question(current_question);
            scroll_to_question();
            attach_click();
        }, timeout);
    });
}

function scroll_to_question() {
    $('html, body').animate({
        scrollTop: $(".question-count").offset().top
    }, 500);
}

function miley() {
    $('#miley')[0].play();
    setTimeout(function() {
        $('.wrecking-ball').addClass('came-in-like-a');
    }, 500);
}

function display_question(index) {
    $('.selected').removeClass('selected');
    if (typeof questions[index] === 'undefined') {
        display_santa();
        return;
    }
    var question = questions[index];
    $('.question-text').html(question.question);
    $('.question-count').html('Question ' + (index + 1) + '/' + questions.length);
    for (i in question.answers) {
        $('.answer-' + i).html(question.answers[i]).attr('data-type', question.type[i]);
    }
}

function display_santa() {
    var url = "http://whosyoursanta.ca/";
    var santa_array = which_santa();
    if (santa_array.length > 1) {
        $('.your-santa-text').text('Too close to call! See how this fits:');
    }
    // if there is only one result it will pull it back
    var santa = santa_array[Math.floor(Math.random() * santa_array.length)];
    
    var twitter_text = 'I\'m "' + santas[santa].title + '". Are you fit to be St. Nick? Take the quiz. #happyholidays';
    $('.questions').fadeOut();
    $('.your-santa').fadeIn();
    var fb_title = 'I\'m "' + santas[santa].title + '"!';
    var fb_summary = "Think you're fit to be St. Nick? Take this quiz to find your Santa, and spread some cheer by sharing your results. Happy Holidays! #happyholidays";
    var fb_image = url + 'img/share/' + santa + '_santa.jpg';
    var fb_url = url;
    $('.which-santa-photo img').attr('src', 'img/' + santa + '_santa.png');
    $('.which-santa').html('"' + santas[santa].title + '"');
    $('.twitter').attr('href', 'http://twitter.com/home?status=' + encodeURIComponent(twitter_text) + ' ' + encodeURIComponent(url));
    var sharerURL = "http://www.facebook.com/sharer/sharer.php?s=100&p[url]=" + encodeURI(fb_url) + "&p[images][0]=" + encodeURI(fb_image) + "&p[title]=" + encodeURI(fb_title) + "&p[summary]=" + encodeURI(fb_summary);
    
    $('.facebook').attr('href', sharerURL);
    $('.which-santa-tagline').html(santas[santa].tagline);
    $('footer').addClass('done');
}

function which_santa() {
    var max = -Infinity, x;
    var which = [];
    for (i in santa_scores) {
        if (santa_scores[i] > max) {
            max = santa_scores[i];
        }
    }
    // get all the santas that have that score
    for (i in santa_scores) {
        if (santa_scores[i] === max) {
            which.push(i);
        }
    }
    return which;
}

//credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function() {
	return this.each(function() {
    	// If this function exists...
    	if (this.setSelectionRange) {
      		// ... then use it (Doesn't work in IE)
      		// Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
      		var len = $(this).val().length * 2;
      		this.focus();
      		this.setSelectionRange(len, len);
    	} else {
    		// ... otherwise replace the contents with itself
    		// (Doesn't work in Google Chrome)
      		$(this).val($(this).val());
    	}
	});
};
