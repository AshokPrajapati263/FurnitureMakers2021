<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="Variable.jsp"%>
<%
index = 6;
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
				<h1>PROMOCODE MODIFICATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="promocodelist.jsp">PromoCode
							List</a></li>
					<li class="breadcrumb-item active">PromoCode Edit</li>
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
						<h3 class="card-title">EDIT PROMOCODE DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<%
					String id = request.getParameter("id");
					databaseConnectivity.openConnection();
					String sql = "select * from promocode where id=" + id;
					ResultSet rs = databaseConnectivity.fatchData(sql);
					while (rs.next()) {
					%>
					<form class="form-horizontal" action="../PromocodeController"
						method="post" id="createareaform">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">PromoCode</label>
								<div class="col-sm-9">
									<input type="hidden" name="id" value="<%=rs.getString(1)%>">
									<input type="text" class="form-control"
										placeholder="Enter Code" name="promocode" required
										value="<%=rs.getString(2)%>" id="promocode" maxlength="10"
										title="Note: Enter minimum 4 values. Example = Holi2021">
									<span id="available"></span>
								</div>
								<div class="col-sm-1">
									<a id="reset" type="button"
										class="btn btn-primary btn-block float-sm-right"><i
										class="fas fa-redo-alt" style="color: white;"></i></a>
								</div>

							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Is Active</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="isactive"
												<%if ("1".equals(rs.getString(5))) {
	out.print("checked=\"checked\"");
}%>>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Amount /
									Percentage</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Amounnt / Percentage" name="amount"
										required inputmode="numeric" pattern="[0-9]{1,3}"
										maxlength="3" value="<%=rs.getInt(7)%>" title="Example = 100">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Is
									Percentage</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="ispercentage"
												<%if ("1".equals(rs.getString(8))) {
	out.print("checked=\"checked\"");
}%>>Above
											value is percentage(%)?
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Max Discount</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Max Discount" name="maxdiscount"
										inputmode="numeric" pattern="[0-9]{0,3}" maxlength="3"
										title="Example = 299" value="<%=rs.getInt(9)%>">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Start Date</label>
								<div class="col-sm-10">
									<%
									Date date = new Date();
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
									String stDate = dateFormat.format(date);
									Date stDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(3));
									String stDatev = dateFormat.format(stDateO);
									Date enDateO = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(4));
									String enDatev = dateFormat.format(enDateO);
									%>
									<input type="date" id="startdatepromocode" class="form-control datetimepicker-input"
										name="startdate" value="<%=stDatev%>" min="<%=stDate%>"
										onchange="document.getElementById('enddatepromocode').min = document.getElementById('startdatepromocode').value;document.getElementById('enddatepromocode').value = document.getElementById('startdatepromocode').value;" required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">End Date</label>
								<div class="col-sm-10">
									<input type="date" id="enddatepromocode" class="form-control datetimepicker-input"
										name="enddate" value="<%=enDatev%>" min="<%=stDatev%>" required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Applicable Count</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="How many time user can use this code?"
										name="applicablecount" required inputmode="numeric"
										pattern="[0-9]{1,2}" maxlength="2"
										value="<%=rs.getString(10)%>"
										title="Example = 1 or 2 , Note : Max Applicable Count is 20.">
								</div>
							</div>
							<div class="row col-sm-12">
								<span style="color: red; font-size: 120%;"
									<%if (!stDateO.before(date)) {
										out.print("hidden=''");
									}%>>Note: PromoCode is already live now, You can't change now...</span>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit" value="EDIT" name="button"
								class="btn btn-primary" onmouseover="validate()"
								<%if (stDateO.before(date)) {
	out.print("disabled title='PromoCode is already live now...'");
}%>>Submit</button>
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
<script type="text/javascript">
	$(document).ready(function() {

		$("#promocode").keyup(function() {
			var promocode = $("#promocode").val();
			if (promocode.length >= 1) {
				$.ajax({
					url : "checkpromocode.jsp",
					type : "post",
					data : "pcode=" + promocode,
					dataType : "text",
					success : function(data) {
						$("#available").html(data)
					}
				});
			} else {
				$("#available").html("");
			}

		});

	});
</script>
<script type="text/javascript">
	function validate() {
		var elementExists = document.getElementById("wrong");
		if (typeof (elementExists) != 'undefined' && elementExists != null) {
			alert("Promocode Is Already Exists !");
			document.getElementById("promocode").focus();
		}
	}
	document.getElementById('reset').onclick = function() {
		var promocode = document.getElementById('promocode');
		promocode.value = promocode.defaultValue;
		var elementExists = document.getElementById("wrong");
		var elementExists2 = document.getElementById("right");
		if (typeof (elementExists) != 'undefined' && elementExists != null) {
			document.getElementById("wrong").hidden = true;
		}
		if (typeof (elementExists2) != 'undefined' && elementExists2 != null) {
			document.getElementById("right").hidden = true;
		}
	};
</script>
<%@ include file="footer.jsp"%>