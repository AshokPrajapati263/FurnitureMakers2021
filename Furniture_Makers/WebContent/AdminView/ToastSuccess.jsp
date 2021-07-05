<script type="text/javascript">	
  $(function() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
    <%
	String msg = "";
	if(request.getParameter("action")!=null && request.getParameter("name")!=null) {
		if(request.getParameter("action").equals("create"))
			msg = "Created";
		else if(request.getParameter("action").equals("register"))
			msg = "Register";
		else if(request.getParameter("action").equals("login"))
			msg = "Login";
		else if(request.getParameter("action").equals("download"))
			msg = "Download";
		else
			msg="Edit";
	%>
    Toast.fire({
       icon: 'success',
       title: '&nbsp;<%=request.getParameter("name")%>&nbsp;<%=msg%> Successfully'
    })
    var uri = window.location.toString();
    if (uri.indexOf("?") > 0) {
        var clean_uri = uri.substring(0, uri.indexOf("?"));
        window.history.replaceState({}, document.title, clean_uri);
    }
	<%
		}
	%>
  });
</script>