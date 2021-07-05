<%@ include file="Variable.jsp" %>
<%index =7; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>Orders List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Orders</li>
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
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Order Code</th>
									<th>User First Name</th>
									<th>User Last Name</th>
									<th>Order total</th>
									<th>Promocode</th>
									<th>Discounted Amount</th>
									<th>Order Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String sql = "select orders.order_code,user.first_name,user.last_name,orders.order_total,promocode.code,orders.discounted_amount,orders.created_date,status_master.name from orders inner join user on orders.user_id=user.id left join promocode on orders.promocode_id=promocode.id inner join status_master on orders.status_master_id=status_master.id";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
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
										if (rs.getString(6) == null || rs.getString(6) == "")
											out.print("---");
										else
											out.print(rs.getString(6));
										%>
									</td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(8)%></td>
									<td><!-- <a href="#"><i
											class="fas fa-edit fa-lg"></i></a> --></td>
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