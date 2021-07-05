<%@include file="ToastSuccess.jsp" %>
</div>
<!-- /.content-wrapper -->
<footer class="main-footer">
	<strong>Copyright &copy; 2019-2021 <a href="index.jsp">FurnitureMakers.com</a>.
	</strong> All rights reserved.
	<div class="float-right d-none d-sm-inline-block">
		<b>Version</b> 1.0.0
	</div>
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- ChartJS -->
<script src="<%=request.getContextPath()%>/plugins/chart.js/Chart.min.js"></script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=request.getContextPath() %>/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<%=request.getContextPath() %>/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="<%=request.getContextPath() %>/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="<%=request.getContextPath() %>/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=request.getContextPath() %>/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<%=request.getContextPath() %>/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="<%=request.getContextPath() %>/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath() %>/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script
	src="<%=request.getContextPath() %>/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=request.getContextPath() %>/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/dist/js/demo.js"></script>
<!-- DataTables -->
<script src="<%=request.getContextPath() %>/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath() %>/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="<%=request.getContextPath() %>/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath()%>/plugins/sweetalert2/dist/sweetalert2.all.js"></script>
<%-- <script src="<%=request.getContextPath()%>/plugins/sweetalert2/sweetalert2.min.js"></script> --%>
<!-- Toastr -->
<script src="<%=request.getContextPath()%>/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
	var req;
	var isIE;
	var txtboxid;
	var cartvalue;
	function cart(falg,txtid,productid){	
		cartvalue = parseInt(document.getElementById(""+txtid+"").value);
		txtboxid=txtid;
		var pid = parseInt(document.getElementById(""+productid+"").value);
		var userIdCart = <%=userId%>;
		if(falg==1){
			cartvalue += 1;
		}
		else{
			if(cartvalue > 0)
			{
				cartvalue -= 1;
			}
		}
		var url = "<%=request.getContextPath()%>/CartController?product_id="+pid+"&quantity="+cartvalue+"&useridcart="+userIdCart;
        req = initRequest();
        req.open("POST", url, true);
        req.onreadystatechange = callback;
        req.send();
	}
	function initRequest() {
	    if (window.XMLHttpRequest) {
	        if (navigator.userAgent.indexOf('MSIE') != -1) {
	            isIE = true;
	        }
	        return new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        isIE = true;
	        return new ActiveXObject("Microsoft.XMLHTTP");
	    }
	}
	function callback() {
	    if (req.readyState == 4) {
	        if (req.status == 200) {
	        	document.getElementById(""+txtboxid+"").value = cartvalue.toString();
	        	var val=req.responseText;
	        	document.getElementById('cartCount').innerHTML=val;
	        	if(cartvalue == 0)
	        	{
	        		$("#cartlistwithdetails").load(" #cartlistwithdetails");
	        	}
	        }
	    }
	}
</script>
<script>
	$(function() {
		$("#example1").DataTable({
			"responsive" : true,
			"autoWidth" : false,
			"order": [],
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
		});
		$('#example2').DataTable({
		      "paging": false,
		      "lengthChange": false,
		      "searching": false,
		      "ordering": false,
		      "info": false,
		      "autoWidth": false,
		      "responsive": true,
		});
	});
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
</body>
</html>
