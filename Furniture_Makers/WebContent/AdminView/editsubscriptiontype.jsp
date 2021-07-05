<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ include file="Variable.jsp"%>
<%
index = 5;
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@ include file="header.jsp"%>
<style>
[type="date"] {
	cursor: text;
}

[type="date"]::-webkit-calendar-picker-indicator {
	margin-top: 3.5px;
	margin-right: -4.5px;
	cursor: pointer;
	opacity: 80%;
}

[type="date"]::-webkit-calendar-picker-indicator:hover {
	opacity: 100%;
	transform: scale(1.2);
}
</style>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>SUBSCRIPTION TYPE MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="coutrylist.jsp">Subscription
							Type List</a></li>
					<li class="breadcrumb-item active">Subscription Type Edit</li>
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
						<h3 class="card-title">EDIT SUBSCRIPTION TYPE DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<%
					boolean flag = false;
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from subscription_type_master where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) {
					%>
					<form class="form-horizontal"
						action="../SubscriptionTypeMasterController" method="post">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Subscription Type
									Name</label>
								<div class="col-sm-10">
									<%
									Date date = new Date();
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
									String strDate = dateFormat.format(date);
									Date oDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
											.parse(rs.getString(7));
									String oDatev = dateFormat.format(oDateO);
									String enDatev = "";
									if(rs.getString(8)!=null){
									Date enDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(8));
									enDatev = dateFormat.format(enDateO);}
									%>
									<input type="hidden" name="id" value="<%=rs.getString(1)%>">
									<input type="text" class="form-control" max="50"
										placeholder="Enter Subscription Type Name"
										value="<%=rs.getString(2)%>" name="name" required
										<%if (oDateO.before(date)) {
											out.print("readonly='readonly'");
											flag = true;
										}%>>
									<input type="hidden" name="flag" value="<%=flag%>">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Validity Type</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Note: Whatever Number You Enter Here It Considered As Month."
										name="validitytype" required pattern="[0-9]{1,2}"
										value="<%=rs.getString(5)%>" maxlength="2"
										title="Example = 6 OR 2">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Price" name="price" required
										inputmode="numeric" pattern="[0-9]{1,5}" maxlength="5"
										value="<%=rs.getInt(6)%>" title="Example = 999">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Start Date</label>
								<div class="col-sm-10">
									<input type="date" id="onlinedatesub"
										class="form-control datetimepicker-input" name="onlinedate"
										value="<%=oDatev%>" min="<%=strDate%>"
										onchange="document.getElementById('enddatesub').min = document.getElementById('onlinedatesub').value;"
										required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">End Date</label>
								<div class="col-sm-10">
									<input type="date" id="enddatesub"
										class="form-control datetimepicker-input" name="enddate"
										value="<%=enDatev%>" min="<%=oDatev%>"/>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit" value="EDIT" name="button"
								class="btn btn-primary">Submit</button>
							<a href="subscriptiontypelist.jsp"
								class="btn btn-default float-right">Cancel</a>
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