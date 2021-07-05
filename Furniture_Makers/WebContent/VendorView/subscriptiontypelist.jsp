<%@page import="DBconnection.DatabaseConnectivity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="Variable.jsp"%>
<%
index = 3;
%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>YOUR SUBSCRIPTION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Subscription</li>
				</ol>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</section>
<section class="content">
	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="row d-flex align-items-stretch">
				<%
				databaseConnectivity.openConnection();
				String sql = "select subscription_type_master.name,subscription_type_master.validity_type,subscription_type_master.online_date,subscription_type_master.end_date,subscription_type_master.price,user.subscription_start_date,user.subscription_end_date from user inner join subscription_type_master on (user.subscription_type_master_id=subscription_type_master.id) and user.id=6";
				ResultSet rs = databaseConnectivity.fatchData(sql);
				if (rs.next()) {
					rs.previous();
				while (rs.next()) {
				%>
				<div class="col-12 col-sm-6 col-md-3">
					<div class="card card-outline card-primary">
						<div class="card-header text-muted">
							<b><%=rs.getString(1).toUpperCase()%></b>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-12"> 
									<p class="text-muted text-sm">
										<b>START DATE:&nbsp;&nbsp;</b><span
											style="font-size: 15px; font-weight: bold;"><%=rs.getString(6)%></span>
									</p>
									<p class="text-muted text-sm">
										<b>DUE DATE:&nbsp;&nbsp;</b><span
											style="font-size: 15px; font-weight: bold; color: red;"><%=rs.getString(7)%></span>
									</p>
									<p class="text-muted text-sm">
										<b>VALIDITY TYPE:&nbsp;&nbsp;</b><span
											style="font-size: 15px; font-weight: bold; color: red;"><%=rs.getString(2)%>
											MONTH</span>
									</p>
									<p class="text-muted text-sm">
										<b>PRICE:&nbsp;&nbsp;</b> <span
											style="font-size: 20px; color: green;">&#x20B9;<%=rs.getInt(5)%></span>
									</p>
								</div>
							</div>
						</div>
						<!-- <div class="card-footer">
							<div class="text-right">
								<button class="btn btn-block btn-primary"
									onclick="AddAddress();">Buy</button>
							</div>
						</div> -->
					</div>
				</div>
				<%
				break;
				}
				} else {
				%>
				<div class="col-12">
					<div class="callout callout-danger">
						<h5>No Subscription!</h5>
						<p>You currently have no subscription so please select and buy
							subscription.</p>
					</div>
				</div>
				<%
				String sql2 = "select * from subscription_type_master";
				ResultSet rs2 = databaseConnectivity.fatchData(sql2);
				while (rs2.next()) {
				%>
				<div class="col-12 col-sm-6 col-md-3">
					<div class="card card-outline card-primary">
						<div class="card-header text-muted">
							<b><%=rs2.getString(2).toUpperCase()%></b>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<input type="hidden" id="<%=rs2.getInt(1)%>"
										value="<%=rs2.getInt(1)%>">
									<p class="text-muted text-sm">
										<b>VALIDITY TYPE:&nbsp;&nbsp;</b><span
											style="font-size: 15px; font-weight: bold; color: red;"><%=rs2.getString(5)%>
											MONTH</span>
									</p>
									<p class="text-muted text-sm">
										<b>PRICE:&nbsp;&nbsp;</b> <span
											style="font-size: 20px; color: green;">&#x20B9;<%=rs2.getInt(6)%></span>
									</p>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
								<button class="btn btn-block btn-primary"
									onclick="AddAddress();">Buy</button>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				databaseConnectivity.closeConnection();
				%>
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>