<%@page import="DBconnection.DatabaseConnectivity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="Variable.jsp"%>
<%index = 2;%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>Product List</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active">Product</li>
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
						<a href="#"class="col-sm-2 btn btn-primary btn-block float-sm-right"> <i
							id="CREATE" class="fas fa-plus-square"></i>&nbsp;&nbsp;<span>CREATE
								NEW</span></a>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Name</th>
									<th>Price</th>
									<th>Discounted Price</th>
									<th>Size</th>
									<th>Company Name</th>
									<th>Description</th>
									<th>Colour</th>
									<th>Materials Name</th>
									<th>Sub Category Name</th>
									<th>Created date</th>
									<th>Updated date</th>
									<th>Is Active</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								databaseConnectivity.openConnection();
								String sql = "select product.name,product.price,product.discounted_price,product.size,product.company_name,product.description,product.colour,materials_type.name,sub_category.name,product.is_active,product.created_date,product.updated_date from product inner join materials_type on product.materials_type_id=materials_type.id inner join user on product.user_id=user.id inner join sub_category on product.sub_category_id=sub_category.id where user_id=6";
								ResultSet rs = databaseConnectivity.fatchData(sql);
								while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6).substring(0, 50)%><span data-toggle="tooltip" title="<%=rs.getString(6)%>" style="cursor: pointer;color: blue;">...</span></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getString(9)%></td>
									<td><%=rs.getString(11)%></td>
									<td>
										<%
										if (rs.getString(12) == null || rs.getString(12) == "")
											out.print("---");
										else
											out.print(rs.getString(12));
										%>
									</td>
									<td><%
											if(rs.getBoolean(10)){
										%>
										<i
											class="fas fa-check fa-lg" style="color: green;"></i>
										<%}else{ %>
										<i class="fas fa-times fa-lg" style="color: red;"></i>
										<%} %></td>
									<td><a href="#"><i
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