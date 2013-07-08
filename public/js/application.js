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
  
  $('.upload').on('click', '.create-album', function(event){
    event.preventDefault();
    $(this).closest('p').after('<form class="new-album" method="post" action="/albums/new"><input type="text" name="album" placeholder="album name"><input type="submit"></form>');
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