<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="Variable.jsp"%>
<%
index = 6;
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
				<h1>Promocode List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Promocode</li>
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
						<a href="createpromocode.jsp"
							class="col-sm-2 btn btn-primary btn-block float-sm-right"> <i
							id="CREATE" class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>PromoCode</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Amount/Percentage</th>
									<th>Is Percentage</th>
									<th>Max Discount</th>
									<th>Applicable Count</th>
									<th>Is Active</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String sql = "select * from promocode order by id desc";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getInt(7)%></td>
									<td><%=rs.getString(8)%></td>
									<td>
										<%
										if (rs.getString(9) == null || rs.getString(9) == "")
											out.print("---");
										else
											out.print(rs.getInt(9));
										%>
									</td>
									<td><%=rs.getString(10)%></td>
									<td>
										<%
										if (rs.getBoolean(5)) {
										%> <i class="fas fa-check fa-lg" style="color: green;"></i> <%
 } else {
 %>
										<i class="fas fa-times fa-lg" style="color: red;"></i> <%
 }
 %>
									</td>
									<td>
										<a href="editpromocode.jsp?id=<%=rs.getInt(1)%>"
										<%
										Date date = new Date();
										Date stDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
												.parse(rs.getString(3));
										if (stDateO.before(date)) {
											out.print("hidden=''");
										}
										%>><i
											class="fas fa-edit fa-lg"></i></a>
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