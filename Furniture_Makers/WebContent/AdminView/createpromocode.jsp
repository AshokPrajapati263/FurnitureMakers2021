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
				<h1>PROMOCODE CREATION</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="promocodelist.jsp">PromoCode
							List</a></li>
					<li class="breadcrumb-item active">PromoCode Create</li>
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
						<h3 class="card-title">ENTER NEW PROMOCODE DATA</h3>
					</div>

					<!-- /.card-header -->
					<!-- form start -->
					<form class="form-horizontal" action="../PromocodeController"
						method="post" id="createareaform">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">PromoCode</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Code" name="promocode" required id="promocode"
										maxlength="10" title="Note: Enter maximum 4 values. Example = Holi2021">
									<span id="available"></span>
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
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Amount /
									Percentage</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Amounnt / Percentage" name="amount"
										required inputmode="numeric" pattern="[0-9]{1,3}"
										maxlength="3" title="Example = 100">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Is
									Percentage</label>
								<div class="col-sm-10">
									<div class="form-control">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="ispercentage">Above value is percentage(%)?
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Max Discount</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Max Discount" name="maxdiscount"
										inputmode="numeric" pattern="[0-9]{3}" maxlength="3"
										title="Example = 299">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Start Date</label>
								<div class="col-sm-10">
									<%
									Date date = new Date();
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
									String stDate = dateFormat.format(date);
									%>
									<input type="date" id="startdatepromocode" class="form-control datetimepicker-input"
										name="startdate" value="<%=stDate%>" min="<%=stDate%>"
										onchange="document.getElementById('enddatepromocode').min = document.getElementById('startdatepromocode').value;document.getElementById('enddatepromocode').value = document.getElementById('startdatepromocode').value;" required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">End Date</label>
								<div class="col-sm-10">
									<input type="date" id="enddatepromocode" class="form-control datetimepicker-input"
										name="enddate" value="<%=stDate%>" min="<%=stDate%>" required />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Applicable Count</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="How many time user can use this code?"
										name="applicablecount" required inputmode="numeric"
										pattern="[0-9]{1,2}" maxlength="2"
										title="Example = 1 or 2 , Note : Max Applicable Count is 20.">
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button type="submit" value="CREATE" name="button"
								class="btn btn-primary" onmouseover="validate()">Submit</button>
							<button type="button" class="btn btn-default float-right">Cancel</button>
						</div>
						<!-- /.card-footer -->
					</form>
				</div>
				<!-- /.card -->
			</div>
		</div>
	</div>
<!-- 	popup start -->
	<div class="modal fade" id="modal-default">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" style="color:red;"><b>Error!</b></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="textfocus()">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p id="msg">Error&hellip;</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal" onclick="textfocus()">Close</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
	<!-- 	popup end -->
</section>
<script type="text/javascript">
$(document).ready(function(){
   
    $("#promocode").keyup(function(){
        var promocode =$("#promocode").val();
        if(promocode.length >= 1)
        {
            $.ajax({
                url:"checkpromocode.jsp",
                type:"post",
                data:"pcode="+promocode,
                dataType:"text",
                success:function(data)
                {
                    $("#available").html(data)
                } 
            }); 
        }
        else
        {
          $("#available").html("");
        }
        
   }); 
   
});    
</script>
<script type="text/javascript">
	function  validate() {
		var elementExists = document.getElementById("wrong");
		if (typeof(elementExists) != 'undefined' && elementExists != null)
		{
			 $('#modal-default').modal('show');
			 document.getElementById("msg").innerHTML="Promocode Is Already Exists !";
		}
	}
	function textfocus(){
		document.getElementById("promocode").select();
	}
</script>
<%@ include file="footer.jsp"%>