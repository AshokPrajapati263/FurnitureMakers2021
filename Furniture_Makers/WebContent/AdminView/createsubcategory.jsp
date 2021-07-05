<%@ include file="Variable.jsp" %>
<%index =3;subIndex=6; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>SUBCATEGORY CREATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="statelist.jsp">SubCategory
							List</a></li>
					<li class="breadcrumb-item active">SubCategory Create</li>
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
						<h3 class="card-title">ENTER NEW SUBCATEGORY DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<form class="form-horizontal" action="../SubCategoryController"
						method="post">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">SubCategory
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter SubCategory Name" name="name" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Select
									Category</label>
								<div class="col-sm-10">
									<%
									databaseConnectivity.openConnection();
									String sql = "select * from category";
									ResultSet rs = databaseConnectivity.fatchData(sql);
									%>
									<select class="form-control" name="categoryid">
										<%
										while (rs.next()) {
										%>
										<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
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
												name="isactive">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit"  value="CREATE" name="button" class="btn btn-primary">Submit</button>
							<button type="button" class="btn btn-default float-right">Cancel</button>
						</div>
						<!-- /.card-footer -->
					</form>
				</div>
				<!-- /.card -->
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>