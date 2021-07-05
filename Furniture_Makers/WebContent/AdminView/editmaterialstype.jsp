<%@ include file="Variable.jsp" %>
<%index =3;subIndex=7; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>MATERIALS TYPE MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="coutrylist.jsp">Materials Type
							List</a></li>
					<li class="breadcrumb-item active">Materials Type Edit</li>
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
						<h3 class="card-title">EDIT MATERIALS TYPE DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<%
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from materials_type where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) {
					%>
					<form class="form-horizontal" action="../MaterialsTypeController"
						method="post">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Materials Type
									Name</label>
								<div class="col-sm-10">
								<input type="hidden" name="id" value="<%=rs.getString(1)%>">
									<input type="text" class="form-control"
										placeholder="Enter Materials Type Name" value="<%=rs.getString(2)%>" name="name" required>
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
												}%> >
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