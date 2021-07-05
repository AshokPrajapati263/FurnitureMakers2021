<%@ include file="Variable.jsp"%>
<%
index = 4;
subIndex = 9;

%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp"%>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Vendor List</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item active">Vendor</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- <div class="card-header">
					<a href="#"
							class="col-sm-2 btn btn-primary btn-block"> <i
							class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
					</div> -->
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Vendor First Name</th>
										<th>Vendor Last Name</th>
										<th>Phone No.</th>
										<th>Email</th>
										<th>DOB</th>
										<th>Gender</th>
										<th>Area Name</th>
										<th>Subscription Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									databaseConnectivity.openConnection();
									String sql = "select user.first_name,user.last_name,user.phone_no,user.email,user.dob,user.gender,area.name,subscription_type_master.name,user_type_master.id from user inner join area on user.area_id = area.id inner join user_type_master on user.user_type_master_id=user_type_master.id inner join subscription_type_master on user.subscription_type_master_id=subscription_type_master.id where user_type_master_id='3'";
									ResultSet rs = databaseConnectivity.fatchData(sql);
									while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getString(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(5)%></td>
										<td><%=rs.getString(6)%></td>
										<td><%=rs.getString(7)%></td>
										<td><%=rs.getString(8)%></td>
										<td>
											<!-- <a href="#"><i
											class="fas fa-edit fa-lg"></i></a> -->
										</td>
									</tr>
									<%
									}
									databaseConnectivity.closeConnection();
									%>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="footer.jsp"%>