$(document).ready(function() {
  $('.login').on('click', '#signup', function(event) {
  	event.preventDefault();
  	// $('.login form').fadeOut("slow");
  	// $('.login form').fadeIn("slow");
  	switchToSignUp();
  });
  $('.login').on('click', '#login', function(event) {
  	event.preventDefault();
  	// $('.login form').fadeOut("slow");
  	// $('.login form').fadeIn("slow");
  	switchToLogIn();
  });
});

function switchToSignUp() {
	$('.login form').attr('action', "/signup");
	$('.submit-button').val("sign up");
	$('.submit-button').css('left', '106px');
	$('.login p.directions').html('need to go back? click <a id="login" href="/">here</a>')
}

function switchToLogIn() {
	$('.login form').attr('action', "/login");
	$('.submit-button').val("log in");
	$('.submit-button').css('left', '122px');
	$('.login p.directions').html('new user? sign up <a id="signup" href="/signup">here</a>')
 }