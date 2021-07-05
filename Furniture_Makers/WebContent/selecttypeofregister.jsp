<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Select Type</title>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<style type="text/css">
#leftcard:hover {
	background-color: #007BFF;
	color: white;
	cursor: pointer;
}

#rightcard:hover {
	background-color: gray;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body class="hold-transition register-page">
	<div class="col-12 col-sm-6 col-md-5 ">
		<div class="register-logo" style="margin-top: 130px;">
			<div class="brand-link image">
				<img
					src="<%=request.getContextPath()%>/dist/img/FurnitureMakersLogo1x2.png"
					alt="FurnitureMakers Logo" width="180">
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<p class="login-box-msg">
					<b>SELECT ACCOUNT TYPE</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<div class="card" id="leftcard">
							<div class="card-body"
								onclick="location.href='<%=request.getContextPath()%>/CustomerView/RegistrationPage.jsp'"
								style="cursor: pointer">
								<div class="text-center">
									<div class="pt-4 pb-3">
										<i class="fas fa-user fa-3x"></i>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-center">
									<p>
										<b> &nbsp;&nbsp; AS CUTOMER </b>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card" id="rightcard">
							<div class="card-body"
								onclick="location.href='<%=request.getContextPath()%>/CustomerView/RegistrationPage.jsp'"
								style="cursor: pointer">
								<div class="text-center">
									<div class="pt-4 pb-3">
										<i class="fas fa-users fa-3x"></i>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-center">
									<p>
										<b> &nbsp;&nbsp; AS VENDOR </b>
									</p>
								</div>
							</div>
							<div class="overlay dark">
								<i class="fas fa-2x fa-sync-alt fa-spin"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->
	<!-- jQuery -->

	<script
		src="<%=request.getContextPath()%>/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/dist/js/adminlte.min.js"></script>
</body>
</html>