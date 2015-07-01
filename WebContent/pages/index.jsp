<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<spring:message code="label.helloworld" />-->

<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="../css/reset_login.css" />
<!-- CSS reset -->
<link rel="stylesheet" type="text/css" href="../css/style_login.css" />
<!-- Gem style -->
<script src="js/modernizr.js"></script>
<!-- Modernizr -->
	<!-- cd-user-modal -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../js/main.js"></script>
	<!-- Gem jQuery -->
<title>Mobile Wallet</title>
</head>
<body>
	<header role="banner">
		<div id="cd-logo">
			<a href="#0"><img src="../img/Wallet-icon.png" alt="Logo"></a>
		</div>

		<nav class="main-nav">
			<ul>
				<!-- inser more links here -->
				<!--<li><a class="cd-signin" href="#0">Sign in</a></li>-->
				<li><a class="cd-signup" href="#0">Login</a></li>
			</ul>
		</nav>
	</header>

	<div class="cd-user-modal">
		<!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container">
			<!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Login</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login">
				<!-- log in form -->
				<form class="cd-form" action="homelogin" method=post>
					<p class="fieldset">
						<label class="image-replace cd-username" for="login_username">Username</label>
						<input class="full-width has-padding has-border"
							id="login_username" type="text" name="username"
							placeholder="Username or Mobile No." value="" > <span class="cd-error-message">Invalid
							Username</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="login_password">Password</label>
						<input class="full-width has-padding has-border"
							id="login_password" type="password" name="password"
							placeholder="Password" autocomplete="off"> <a href="#0"
							class="hide-password">Show</a> <span class="cd-error-message">Invalid
							Password</span>
					</p>

					<!--<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>-->

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				
				
				<c:if test="${not empty error}">
  	 				 ${error}	
  	 				 
  	 				 <script>
						var $form_modal = $('.cd-user-modal'), $form_login = $form_modal
						.find('#cd-login'), $form_signup = $form_modal
						.find('#cd-signup'), $form_forgot_password = $form_modal
						.find('#cd-reset-password'), $form_modal_tab = $('.cd-switcher'), $tab_login = $form_modal_tab
						.children('li').eq(0).children('a'), $tab_signup = $form_modal_tab
						.children('li').eq(1).children('a'), $forgot_password_link = $form_login
						.find('.cd-form-bottom-message a'), $back_to_login_link = $form_forgot_password
						.find('.cd-form-bottom-message a'), $main_nav = $('.main-nav');
						// on mobile close submenu
						$main_nav.children('ul').removeClass('is-visible');
						//show modal layer
						$form_modal.addClass('is-visible');
						//show the selected form
						$form_login.addClass('is-selected');
						$form_signup.removeClass('is-selected');
						$form_forgot_password.removeClass('is-selected');
						$tab_login.addClass('selected');
						$tab_signup.removeClass('selected');
					</script> 	 
			 </c:if>

				<p class="cd-form-bottom-message">
					<a href="#0">Forgot your password?</a>
				</p>
				<a href="#0" class="cd-close-form">Close</a>
			</div>
			<!-- cd-login -->



			<div id="cd-signup">
				<!-- sign up form -->
				<form class="cd-form" action="homesubmit" method=post>

					<p class="fieldset">
						<label class="image-replace cd-name" for="signup_name">FullName</label>
						<input class="full-width has-padding has-border" id="signup_name"
							type="text" name="name" placeholder="Full Name"> <span
							class="cd-error-message">Please Enter Name</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username</label>
						<input class="full-width has-padding has-border"
							id="signup-username" type="text" name="username"
							placeholder="Username"> <span class="cd-error-message">Username
							Not Available</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email"
							type="email" name="email" placeholder="E-mail"> <span
							class="cd-error-message">Enter another E-Mail</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-mobile" for="signup_mobile">Mobile</label>
						<input class="full-width has-padding has-border" id="signup_mobile" type="tel" name="mobileno" maxlength="10" placeholder="Mobile No.">
						<span class="cd-error-message">Please Enter Valid Mobile No.</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border"
							id="signup-password" type="password" name="password"
							placeholder="Password"> <a href="#0"
							class="hide-password">Show</a> <span class="cd-error-message">Error
							message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms"> <label
							for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Create account">
					</p>
				</form>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div>
			<!-- cd-signup -->

			<div id="cd-reset-password">
				<!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your
					email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email"
							type="email" placeholder="E-mail"> <span
							class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Reset password">
					</p>
				</form>


				<p class="cd-form-bottom-message">
					<a href="#0">Back to log-in</a>
				</p>
			</div>
			<!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div>
		<!-- cd-user-modal-container -->
	</div>

	
</body>
</html>
















<!-- 
<html>
<head>
</head>
<body>
	<form action="homesubmit" method=post>
		Name : <input type="text" name="name"><br />
		UserName : <input type="text" name="username"><br />
		Password : <input type="password" name="password"><br />
		Email : <input type="text" name="email"><br />
		mobile : <input type="text" name="mobile"><br />
		
		<input type="submit" />
	</form>
		
	<form action="homelogin">
		UserName : <input type="text" name="username"><br />
		Password : <input type="password" name="password"><br />
		
		<input type="submit" />
	</form>
	
	<c:if test="${not empty error}">
   ${error}
	</c:if>
	
	-->
