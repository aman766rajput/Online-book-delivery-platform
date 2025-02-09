<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ADMIN : Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<%@include file="allCss.jsp" %>
</head>
<body>
	

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="img/signin-image.jpg" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in as Admin</h2>
						<form action="adminlog.jsp" method="post"  class="register-form"
							id="login-form">
							<div class="form-group">
				 				<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="auname" id="uname"
									placeholder="Username Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="apass" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<input type="hidden" id="state" value="<%=request.getAttribute("status") %>">
   
   <script>
       if (state.value == "Failed") {
           alert("Login failed");
       }
   </script>
   
   
   <%@include file="footer.jsp" %>
   
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>