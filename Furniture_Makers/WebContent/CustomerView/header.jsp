<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.furnituremakers.service.CartService"%>
<%@page import="com.furnituremakers.pojo.User"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<html>
<head>
<meta charset="utf-8">
<meta charset="ASCII">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Furniture Makers</title>
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
<body class="hold-transition sidebar-mini sidebar-collapse">
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
			<!-- <form class="form-inline">
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
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/CustomerView/cartlist.jsp"><i class="fas fa-shopping-cart fa-lg"></i><span id="DisplayCartValue"
						class="badge badge-warning navbar-badge" style="font-size: 13px;margin: -7px 5px"><b id="cartCount"><%
						
								session = request.getSession();
						User user = (User)session.getAttribute("user");
						CartService cartService = (CartService)session.getAttribute("cartservice");
						if(cartService!=null){
							out.print(cartService.getCartCount(user.getId()));
						}
						int userId = 0;
						if (user != null) {
							userId = user.getId();
						}
						%></b>
						</span>
				</a></li>
			</ul>
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
						<a href="index.jsp" class="d-block">Hello,&nbsp;&nbsp;<%
						if(user!=null){
							out.print(user.getFirstName());
						}
						else
						{
							response.sendRedirect(request.getContextPath()+"/Login.jsp");
						}
 						%></a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->





						<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/index.jsp"
							class="nav-link <%=(index == 1) ? "active" : ""%>"> <i
								class="nav-icon fas fa-home"></i>
								<p>Home</p>
						</a></li>
						
						
						
						<li
							class="nav-item <%=(index == 2) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 2) ? "active" : ""%>">
								<i class="nav-icon fas fa-chair"></i>
								<p>
									CHAIRS <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/CustomerView/armchairs.jsp"
									class="nav-link <%=(subIndex == 1) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>ARM CHAIRS</p>
								</a></li>
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/CustomerView/statelist.jsp"
									class="nav-link <%=(subIndex == 2) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>ROCKING CHAIRS</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/citylist.jsp"
									class="nav-link <%=(subIndex == 3) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>OFFICE CHAIRS</p>
								</a></li>
							</ul></li>
							
							
							
							
							<li
							class="nav-item <%=(index == 3) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 3) ? "active" : ""%>">
								<i class="nav-icon fas fa-couch"></i>
								<p>
									SOFAS <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/CustomerView/countrylist.jsp"
									class="nav-link <%=(subIndex == 4) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>SEATER SOFAS</p>
								</a></li>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/citylist.jsp"
									class="nav-link <%=(subIndex == 5) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>SOFA</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/arealist.jsp"
									class="nav-link <%=(subIndex == 6) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>SOFA CUM BEDS</p>
								</a></li>
							</ul></li>
							
							
							
							
							
							
							<li
							class="nav-item <%=(index == 4) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 4) ? "active" : ""%>">
								<i class="nav-icon fas fa-bed"></i>
								<p>
									BEDS <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/CustomerView/countrylist.jsp"
									class="nav-link <%=(subIndex == 7) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>SINGLE BEDS</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/citylist.jsp"
									class="nav-link <%=(subIndex == 8) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>QUEEN SIZE BEDS</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/arealist.jsp"
									class="nav-link <%=(subIndex == 9) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>KING SIZE BEDS</p>
								</a></li>
							</ul></li>
							
							
							
							
							
							
							<li
							class="nav-item <%=(index == 5) ? "has-treeview menu-open" : "has-treeview"%> "><a
							href="#" class="nav-link <%=(index == 5) ? "active" : ""%>">
								<i class="nav-icon fas fa-archway"></i>
								<p>
									TABLES <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<%=request.getContextPath()%>/CustomerView/countrylist.jsp"
									class="nav-link <%=(subIndex == 10) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>COFFEE TABLES</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/citylist.jsp"
									class="nav-link <%=(subIndex == 11) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>STUDY TABLES</p>
								</a></li>
								<li class="nav-item"><a href="<%=request.getContextPath()%>/CustomerView/arealist.jsp"
									class="nav-link <%=(subIndex == 12) ? "active" : ""%>"> <i
										class="far fa-circle nav-icon"></i>
										<p>OFFICE TABLES</p>
								</a></li>
							</ul></li>
							
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