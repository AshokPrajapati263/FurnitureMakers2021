<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="ASCII">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Furniture Makers (Admin)</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- DataTables -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<!-- SweetAlert2 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/sweetalert2/dist/sweetalert2.css">
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css"> --%>
<!-- Toastr -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/toastr/toastr.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<!-- <li class="nav-item d-none d-sm-inline-block"><a
					href="../index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li> -->
			</ul>

			<!-- SEARCH FORM -->
			<!-- <form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form> -->

			<!-- Right navbar links -->
			<!-- <ul class="navbar-nav ml-auto">Messages Dropdown Menu
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> Message Start
							<div class="media">
								<img src="../dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> Message Start
							<div class="media">
								<img src="../dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> Message Start
							<div class="media">
								<img src="../dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				Notifications Dropdown Menu
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul> -->
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary">
			<!-- Brand Logo -->
			<a href="index.jsp" class="brand-link image"> <img
				src="<%=request.getContextPath()%>/dist/img/FurnitureMakersLogo1x1.png"
				alt="FurnitureMakers Logo" width="128" style="padding-left: 8px;">
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<a href="index.jsp" style="display: inline-block; padding: 5px 5px 5px 22px;"><i class="nav-icon fas fa-user fa-lg"></i></a>
					<div class="info">
						<a href="index.jsp" class="d-block">Welcome,&nbsp;&nbsp;<%
						databaseConnectivity.openConnection();
						String userSql = "select * from user where id=5;";
						ResultSet userRs = databaseConnectivity.fatchData(userSql);
						while (userRs.next()) {
							out.print(userRs.getString(2));
						}
						databaseConnectivity.closeConnection();
						%></a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->





						<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/index.jsp"
							class="nav-link <%=(index == 1) ? "active" : ""%>"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>Dashboard</p>
						</a></li>

						<li
							class="nav-item <%=(index == 2) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 2) ? "active" : ""%>">
								<i class="nav-icon fas fa-globe-africa"></i>
								<p>
									Geographical <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/AdminView/countrylist.jsp"
									class="nav-link <%=(subIndex == 1) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Country</p>
								</a></li>
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/AdminView/statelist.jsp"
									class="nav-link <%=(subIndex == 2) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>State</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/citylist.jsp"
									class="nav-link <%=(subIndex == 3) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>City</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/arealist.jsp"
									class="nav-link <%=(subIndex == 4) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Area</p>
								</a></li>
							</ul></li>
						<li
							class="nav-item <%=(index == 3) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 3) ? "active" : ""%>">
								<i class="nav-icon fas fa-box-open"></i>
								<p>
									Product Offering <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/categorylist.jsp"
									class="nav-link <%=(subIndex == 5) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Category</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/subcategorylist.jsp"
									class="nav-link <%=(subIndex == 6) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Sub Category</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/materialstypelist.jsp"
									class="nav-link <%=(subIndex == 7) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Materials Type</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/productlist.jsp"
									class="nav-link <%=(subIndex == 8) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Product</p>
								</a></li>
							</ul></li>
						<li
							class="nav-item <%=(index == 4) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 4) ? "active" : ""%>">
								<i class="nav-icon fas fa-users"></i>
								<p>
									Users <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/vendorlist.jsp"
									class="nav-link <%=(subIndex == 9) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Vendor</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/customerlist.jsp"
									class="nav-link <%=(subIndex == 10) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>Customer</p>
								</a></li>
							</ul></li>

						<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/subscriptiontypelist.jsp"
							class="nav-link <%=(index == 5) ? "active" : ""%>"> <i
								class="nav-icon fas fa-crown"></i>
								<p>Subscription Type</p>
						</a></li>
						<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/promocodelist.jsp"
							class="nav-link <%=(index == 6) ? "active" : ""%>"> <i
								class="nav-icon fas fa-tags"></i>
								<p>PromoCode</p>
						</a></li>
						<li class="nav-item"><a href="<%=request.getContextPath()%>/AdminView/orderlist.jsp"
							class="nav-link <%=(index == 7) ? "active" : ""%>"> <i
								class="nav-icon fas fa-truck-loading"></i>
								<p>Orders</p>
						</a></li>
						
						<li class="nav-item"><a href="<%=request.getContextPath()%>/LogoutController"
							class="nav-link"> <i
								class="nav-icon fas fa-sign-out-alt"></i>
								<p>Logout</p>
						</a></li>
						
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">