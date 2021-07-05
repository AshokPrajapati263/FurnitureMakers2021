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
[type="date"]{
	cursor: text;
}
[type="date"]::-webkit-calendar-picker-indicator {
	margin-top : 3.5px;
	margin-right : -4.5px;
	cursor: pointer;
	opacity: 80%;
}
[type="date"]::-webkit-calendar-picker-indicator:hover {
	opacity: 100%;
	transform : scale(1.2);
}
</style>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>SUBSCRIPTION TYPE CREATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="coutrylist.jsp">Subscription
							Type List</a></li>
					<li class="breadcrumb-item active">Subscription Type Create</li>
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
						<h3 class="card-title">ENTER NEW SUBSCRIPTION TYPE DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<form class="form-horizontal"
						action="../SubscriptionTypeMasterController" method="post">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Subscription Type
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" maxlength="50"
										placeholder="Enter Subscription Type Name" name="name"
										required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Validity Type</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Note: Whatever Number You Enter Here It Considered As Month."
										name="validitytype" required pattern="[0-9]{1,2}"
										maxlength="2" title="Example = 6 OR 2">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Price" name="price" required
										inputmode="numeric" pattern="[0-9]{1,5}" maxlength="5"
										title="Example = 999">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Online Date</label>
								<div class="col-sm-10">
									<%
									Date date = new Date();
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
									String strDate = dateFormat.format(date);
									%>
									<input type="date" class="form-control datetimepicker-input" id="onlinedatesub"
										name="onlinedate" value="<%=strDate%>" min="<%=strDate%>"
										onchange="document.getElementById('enddatesub').min = document.getElementById('onlinedatesub').value;"
										required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">End Date</label>
								<div class="col-sm-10">
									<input type="date" id="enddatesub"
										class="form-control datetimepicker-input" name="enddate"
										min="<%=strDate%>"/>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit" value="CREATE" name="button"
								class="btn btn-primary">Submit</button>
							<a href="subscriptiontypelist.jsp"
								class="btn btn-default float-right">Cancel</a>
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