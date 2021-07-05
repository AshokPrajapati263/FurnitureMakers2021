<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="Variable.jsp" %>
<%index =5; %>
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
				<h1>Subscription Type List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Subscription Type</li>
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
					<div class="card-header">
						<a href="createsubscriptiontype.jsp"class="col-sm-2 btn btn-primary btn-block float-sm-right"> <i
							id="CREATE" class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Subscription Type Name</th>
									<th>Validity Type</th>
									<th>Online Date</th>
									<th>End Date</th>
									<th>Price</th>
									<th>Created Date</th>
									<th>Updated Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String sql = "select * from subscription_type_master";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(5)%> MONTH</td>
									<td><%=rs.getString(7)%></td>
									<td>
										<%
										if (rs.getString(8) == null || rs.getString(8) == "")
											out.print("---");
										else
											out.print(rs.getString(8));
										%>
									</td>
									<td><%=rs.getInt(6)%></td>
									<td><%=rs.getString(3)%></td>
									<td>
										<%
										if (rs.getString(4) == null || rs.getString(4) == "")
											out.print("---");
										else
											out.print(rs.getString(4));
										%>
									</td>
									<td><a href="editsubscriptiontype.jsp?id=<%=rs.getInt(1)%>"
									<%Date date = new Date();
											Date stDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(rs.getString(7));
											if (stDateO.before(date) && rs.getString(8)!=null) {
												out.print("hidden=''");
											}%>
									><i
											class="fas fa-edit fa-lg"></i></a></td>
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