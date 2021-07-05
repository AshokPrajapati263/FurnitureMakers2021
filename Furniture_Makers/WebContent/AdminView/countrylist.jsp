<%@ include file="Variable.jsp"%>
<%
index = 2;
subIndex = 1;
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
				<h1>Country List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Country</li>
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
						<a href="createcountry.jsp" id="CREATE"
							class="col-sm-2 btn btn-primary btn-block float-sm-right mb-2"> <i
							class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
								<form action="<%=request.getContextPath()%>/ReportController" method="post">
								<button type="submit" name="report" value="country"
							class="col-sm-2 btn btn-primary btn-block float-sm-left"><i
							class="fas fa-download"></i>&nbsp;&nbsp;<span>Download!</span></button></form>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Country Name</th>
									<th>Created Date</th>
									<th>Updated Date</th>
									<th>Is Active</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String sql = "select * from country order by id desc";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(4)%></td>
									<td>
										<%
										if (rs.getString(5) == null || rs.getString(5) == "")
											out.print("---");
										else
											out.print(rs.getString(5));
										%>
									</td>
									<td>
										<%
										if (rs.getBoolean(3)) {
										%> <i class="fas fa-check fa-lg" style="color: green;"></i> <%
 										} else {
										%>
										<i class="fas fa-times fa-lg" style="color: red;"></i> <%
 										}
 										%>
									</td>
									<td><a href="editcountry.jsp?id=<%=rs.getInt(1)%>"><i
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