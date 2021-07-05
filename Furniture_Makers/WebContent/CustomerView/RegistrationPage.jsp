<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Registration</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition register-page">
	<div class="col-12 col-sm-12 col-md-7">
		  <div class="register-logo" style="margin-top: 130px;">
		    <div class="brand-link image"> <img
				src="<%=request.getContextPath()%>/dist/img/FurnitureMakersLogo1x2.png"
				alt="FurnitureMakers Logo" width="180">
			</div>
		  </div>

		<div class="card">
			<div class="card-body">
				<p class="login-box-msg"><b>CREATE YOUR ACCOUNT</b></p>

				<form action="<%=request.getContextPath()%>/RegistrationController" id="registrationpage" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="firstname" placeholder="First Name">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="lastname" placeholder="Last Name">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="phonenumber" placeholder="Phone Number">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-phone"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="date" class="form-control" name="dob">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<select class="form-control select2" name="gender" style="width: 100%;">
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Other</option>
						</select>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="adl1" placeholder="ADL 1">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="adl2" placeholder="ADL 2">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<select class="form-control select2" name="state" style="width: 100%;">
							<option value="1">GUJARAT</option>
							<option value="2">RAJASTHAN</option>
							<option value="3">MAHARASTRA</option>
						</select>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<select class="form-control select2" name="city" style="width: 100%;">
							<option value="1">AHMEDABAD</option>
							<option value="2">GANDHINAGAR</option>
							<option value="3">KHEDA</option>
						</select>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<select class="form-control select2" name="area" style="width: 100%;">
							<option value="1">RAIPUR</option>
							<option value="2">MANINAGAR</option>
							<option value="3">ODHAV</option>
						</select>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="email" class="form-control" name="email" placeholder="Email">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" id="password" name="password" placeholder="Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" id="repassword" name="repassword"
							placeholder="Retype password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 float-sm-right">
							<input type="hidden" value="2" name="user"/>
							<button type="button" onclick="registration()" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->
<script type="text/javascript">
	function registration(){
		var pass = document.getElementById("password").value;
		var repass = document.getElementById("repassword").value;
		alert(pass+"     "+repass);
		if(pass==repass)
		{
			document.getElementById("registrationpage").submit();
		}			
	}

</script>



	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/dist/js/adminlte.min.js"></script>
</body>
</html>