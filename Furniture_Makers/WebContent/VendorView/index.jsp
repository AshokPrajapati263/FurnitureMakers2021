<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="Variable.jsp"%>
<%
index = 1;
String year = "";
%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">DASHBOARD</h1>
			</div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
	</div>
	<!-- /.container-fluid -->
</section>
<section class="content">
	<div class="container-fluid">
		<div class="row">
			<!-- ./col -->
			<div class="col-lg-4 col-6">
				<!-- small box -->
				<div class="small-box bg-warning">
					<div class="inner">
						<h3>
							<%
							databaseConnectivity.openConnection();
							String sql2 = "select count(*) from promocode where user_id=3;";
							ResultSet rs2 = databaseConnectivity.fatchData(sql2);
							while (rs2.next()) {
								out.print(rs2.getInt(1));
							}
							databaseConnectivity.closeConnection();
							%>
						</h3>

						<p>PromoCode</p>
					</div>
					<div class="icon">
						<i class="fas fas fa-tags"></i>
					</div>
					<a href="promocodelist.jsp" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-4 col-6">
				<!-- small box -->
				<div class="small-box bg-secondary">
					<div class="inner">
						<h3>
							<%
							databaseConnectivity.openConnection();
							String sql3 = "select count(*) from product where is_active=1 and user_id=6;";
							ResultSet rs3 = databaseConnectivity.fatchData(sql3);
							while (rs3.next()) {
								out.print(rs3.getInt(1));
							}
							databaseConnectivity.closeConnection();
							%>
						</h3>
						<p>Products</p>
					</div>
					<div class="icon">
						<i class="fas fa-box"></i>
					</div>
					<a href="productlist.jsp" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-4 col-6">
				<!-- small box -->
				<div class="small-box bg-info">
					<div class="inner">
						<h3>
							<%
							databaseConnectivity.openConnection();
							String sql4 = "select count(*) from orders inner join order_product on orders.id=order_product.order_id inner join product on (order_product.product_id=product.id) and (product.user_id=6) where year(orders.created_date)=year(curdate());";
							ResultSet rs4 = databaseConnectivity.fatchData(sql4);
							while (rs4.next()) {
								out.print(rs4.getInt(1));
							}
							databaseConnectivity.closeConnection();
							%>
						</h3>

						<p>
							Orders Of <span class="year"></span>
						</p>
					</div>
					<div class="icon">
						<i class="fas fa-truck-loading"></i>
					</div>
					<a href="orderslist.jsp" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-md-6">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Last 5 Orders And More</h3>
					</div>
					<div class="card-body">
						<table id="last5orders" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Customer Name</th>
									<th>Order Total</th>
									<th>Order Date</th>
									<th>Status</th>
									<th>Customer Number</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String oSql = "select user.first_name,user.last_name,orders.order_total,orders.created_date,status_master.name,user.phone_no from orders inner join user on orders.user_id=user.id inner join status_master on orders.status_master_id=status_master.id inner join order_product on order_product.order_id=orders.id inner join product on order_product.product_id=product.id where product.user_id=6 group by order_product.order_id order by orders.id desc;";
								ResultSet oRs = databaseConnectivity.fatchData(oSql);
								while (oRs.next()) {
								%>
								<tr>
									<td><%=oRs.getString(1)%> <%=oRs.getString(2)%></td>
									<td><%=oRs.getString(3)%></td>
									<td><%=oRs.getString(4)%></td>
									<td><%=oRs.getString(5)%></td>
									<td><%=oRs.getString(6)%></td>
								</tr>
								<%
								}
								databaseConnectivity.closeConnection();
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- STACKED BAR CHART -->
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Monthly Selling (DELIVERED ORDERS)</h3>
					</div>
					<div class="card-body">

						<div class="chart">
							<canvas id="stackedBarChart"
								style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
						</div>
						<div class="float-right" style="opacity: 60%;">
							<b>YEAR <span class="year"></span></b>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-12">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Last 5 Promocode</h3>
					</div>
					<div class="card-body">
						<table id="example3" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th>CSS grade</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- <div class="col-md-6">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">Customer Cart List</h3>
					</div>
					<div class="card-body">
						<table id="example4" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th>CSS grade</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Gecko</td>
									<td>Netscape Browser 8</td>
									<td>Win 98SE+</td>
									<td>1.7</td>
									<td>A</td>
								</tr>
								<tr>
									<td>Gecko</td>
									<td>Netscape Navigator 9</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td>A</td>
								</tr>
								<tr>
									<td>Gecko</td>
									<td>Mozilla 1.0</td>
									<td>Win 95+ / OSX.1+</td>
									<td>1</td>
									<td>A</td>
								</tr>
								<tr>
									<td>Gecko</td>
									<td>Mozilla 1.1</td>
									<td>Win 95+ / OSX.1+</td>
									<td>1.1</td>
									<td>A</td>
								</tr>
								<tr>
									<td>Gecko</td>
									<td>Mozilla 1.2</td>
									<td>Win 95+ / OSX.1+</td>
									<td>1.2</td>
									<td>A</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div> -->
		</div>
	</div>
</section>
<script>
	$(function() {
		var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext(
				'2d')
		var stackedBarChartData = {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
					'Sep', 'Oct', 'Nov', 'Dec' ],
			datasets : [ {
				label : 'Items Sold',
				backgroundColor     : 'rgba(0, 123, 255,0.9)',
		          borderColor         : 'rgba(0, 123, 255,0.8)',
		          pointRadius          : false,
		          pointColor          : '#007bff',
		          pointStrokeColor    : 'rgba(0, 123, 255,1)',
		          pointHighlightFill  : '#fff',
		          pointHighlightStroke: 'rgba(0, 123, 255,1)',
				<%databaseConnectivity.openConnection();
String sql = "select month(orders.created_date),year(orders.created_date),count(*),year(curdate()) from orders inner join order_product on orders.id=order_product.order_id inner join product on (order_product.product_id=product.id) and (product.user_id=6) where year(orders.created_date)=year(curdate()) and orders.status_master_id=6 group by month(orders.created_date) order by month(orders.created_date)";
ResultSet rs = databaseConnectivity.fatchData(sql);%>
					data : [<%int i = 1;
if (rs != null) {
	while (rs.next() && i <= 12) {
		if (rs.getInt(1) == 1)
			year = rs.getString(4);
		if (rs.getInt(1) == i) {
			out.print(rs.getInt(3));
			if (i < 12)
				out.print(",");
			i++;
		} else {
			if (i < 12)
				out.print(" ,");
			rs.previous();
			i++;
		}
	}
} else {
	while (i <= 12) {
		if (i < 12)
			out.print(" 0,");
		else
			out.print(" 0");
		i++;
	}
}
databaseConnectivity.closeConnection();%>]
						}, ]
		}
		$(".year").html("<%
				if(year!=null&&year!="")
				{
					out.print(year);
				}
				else{
					Date date = new Date();
					DateFormat dateFormat = new SimpleDateFormat("yyyy");
					String stDate = dateFormat.format(date);
					out.print(stDate);
				}
				%>");
		//---------------------
		//- STACKED BAR CHART -
		//---------------------
		var stackedBarChartOptions = {
			responsive : true,
			maintainAspectRatio : false,
			scales : {
				xAxes : [ {
					stacked : true,
				} ],
				yAxes : [ {
					stacked : true
				} ]
			}
		}

		var stackedBarChart = new Chart(stackedBarChartCanvas, {
			type : 'bar',
			data : stackedBarChartData,
			options : stackedBarChartOptions
		})
	});
</script>
<script>
$(function() {
	$('#example2').DataTable({
		"paging" : false,
		"lengthChange" : false,
		"searching" : false,
		"ordering" : false,
		"info" : false,
		"autoWidth" : false,
		"responsive" : true,
	});
	$('#example3').DataTable({
		"paging" : false,
		"lengthChange" : false,
		"searching" : false,
		"ordering" : false,
		"info" : false,
		"autoWidth" : false,
		"responsive" : true,
	});
	$('#example4').DataTable({
		"paging" : false,
		"lengthChange" : false,
		"searching" : false,
		"ordering" : false,
		"info" : false,
		"autoWidth" : false,
		"responsive" : true,
	});
});
</script>
<%@ include file="footer.jsp"%>