<%@page import="com.furnituremakers.pojo.Country"%>
<%@ include file="Variable.jsp" %>
<%index =2;subIndex=1;%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>COUNTRY MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/AdminView/index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/AdminView/countrylist.jsp">Country
							List</a></li>
					<li class="breadcrumb-item active">Country Edit</li>
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
						<h3 class="card-title">EDIT COUNTRY DATA</h3>
					</div>
					<%
					Country country = (Country) request.getAttribute("CountyPojo");
					if (country != null && !country.getErrorMsg().isEmpty()) {
					%>
					<blockquote class="quote-danger" style="background: #f7f7f7;">
						<h5>Error !</h5>
						<ul>
							<%
							for (String s : country.getErrorMsg()) {
							%>
							<li><b><%=s%></b></li>
							<%
							}
							%>
						</ul>
					</blockquote>
					<%
					}
					%>
					<!-- /.card-header -->
					<!-- form start -->
					<%
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from country where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) {
					%>
					<form class="form-horizontal" action="<%=request.getContextPath()%>/CountryController"
						method="post">
						<div class="card-body">
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Country
									Name</label>
								<div class="col-sm-10">
									<input type="hidden" name="id" value="<%=rs.getString(1)%>">
									<input type="text" class="form-control"
										placeholder="Enter Country Name" name="name" required
										value="<%=country != null ? country.getName() : rs.getString(2)%>">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Is
									Active</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="isactive"
												<%=(country != null && country.isActive()) ? "checked" : ""%>
												<%if ("1".equals(rs.getString(3))) {
													out.print("checked=\"checked\"");
												}%>>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit" value="EDIT" name="button" class="btn btn-primary">Submit</button>
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