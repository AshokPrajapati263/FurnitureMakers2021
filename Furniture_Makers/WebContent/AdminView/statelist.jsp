<%@ include file="Variable.jsp" %>
<%index =2; subIndex=2; %>
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
				<h1>State List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item active">State</li>
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
					<a href="createstate.jsp"class="col-sm-2 btn btn-primary btn-block float-sm-right"> <i
							id="CREATE" class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>State Name</th>
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
								String sql = "select state.id,state.name,country.name,state.is_active,state.created_date,state.updated_date from state inner join country on state.country_id = country.id";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(5)%></td>
									<td>
										<%
										if (rs.getString(6) == null || rs.getString(6) == "")
											out.print("---");
										else
											out.print(rs.getString(6));
										%>
									</td>
									<td><%
											if(rs.getBoolean(4)){
										%>
										<i
											class="fas fa-check fa-lg" style="color: green;"></i>
										<%}else{ %>
										<i class="fas fa-times fa-lg" style="color: red;"></i>
										<%} %></td>
									<td><a href="editstate.jsp?id=<%=rs.getInt(1)%>"><i
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