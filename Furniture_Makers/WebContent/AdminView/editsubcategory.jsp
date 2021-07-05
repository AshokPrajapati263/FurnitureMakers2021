<%@ include file="Variable.jsp" %>
<%index =3;subIndex=6; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>SUBCATEGORY MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="statelist.jsp">SubCategory
							List</a></li>
					<li class="breadcrumb-item active">SubCategory Edit</li>
				</ol>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">EDIT SUBCATEGORY DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<%
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from sub_category where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) { 
					%>
					<form class="form-horizontal" action="../SubCategoryController"
						method="post">
						<div class="card-body">
							<div class="form-group row">
								<input type="hidden" name="id" value="<%=rs.getString(1)%>"/>
								<label class="col-sm-2 col-form-label">SubCategory
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="<%=rs.getString(2)%>"
										placeholder="Enter SubCategory Name" name="name" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Select
									Category</label>
								<div class="col-sm-10">
									<%
									databaseConnectivity.openConnection();
									String sql2 = "select * from category";
									ResultSet rs2 = databaseConnectivity.fatchData(sql2);
									%>
									<select class="form-control" name="categoryid">
										<%
										while (rs2.next()) {
										%>
										<option value="<%=rs2.getInt(1)%>"<%if (rs.getInt(6) == rs2.getInt(1)) {
													out.print("selected");
												}%>><%=rs2.getString(2)%></option>
										<%
										}
										databaseConnectivity.closeConnection();
										%>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Is Active</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="isactive"<%if ("1".equals(rs.getString(3))) {
													out.print("checked=\"checked\"");
												}%>>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit"  value="EDIT" name="button" class="btn btn-primary">Submit</button>
							<button type="button" class="btn btn-default float-right">Cancel</button>
						</div>
						<!-- /.card-footer -->
					</form>
					<%
					}
					databaseConnectivity.closeConnection();
					%>
				</div>
				<!-- /.card -->
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>