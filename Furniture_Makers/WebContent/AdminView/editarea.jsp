<%@ include file="Variable.jsp" %>
<%index =2;subIndex=4; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>AREA MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="arealist.jsp">Area
							List</a></li>
					<li class="breadcrumb-item active">Area Edit</li>
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
						<h3 class="card-title">EDIT AREA DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<%
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from area where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) { 
					%>
					<form class="form-horizontal" action="../AreaController"
						method="post" id="createareaform">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Area
									Name</label>
								<div class="col-sm-10">
									<input type="hidden" name="id" value="<%=rs.getString(1)%>">
									<input type="text" class="form-control"
										placeholder="Enter Area Name" name="name" value="<%=rs.getString(3)%>" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">PINCODE</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter 6 digit PINCODE" name="pincode" value="<%=rs.getString(2)%>" required inputmode="numeric" pattern="[0-9]{6}" maxlength="6">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Select
									City</label>
								<div class="col-sm-10">
									<%
									databaseConnectivity.openConnection();
									String sql2 = "select * from city";
									ResultSet rs2 = databaseConnectivity.fatchData(sql2);
									%>
									<select class="form-control" name="cityid">
										<%
										while (rs2.next()) {
										%>
										<option value="<%=rs2.getInt(1)%>"<%if (rs.getInt(7) == rs2.getInt(1)) {
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
								<label class="col-sm-2 col-form-label">Is
									Active</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="isactive"<%if ("1".equals(rs.getString(4))) {
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