<%@ include file="Variable.jsp"%>
<%@ include file="header.jsp"%>
<style>
.cartvalue {
	width: 35px;
	padding-bottom: 4px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
<section class="content-header" style="margin-bottom: -16px;">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>YOUR CART LIST</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">CartList</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content" id="cartlistwithdetails">
	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="row d-flex align-items-stretch">
				<%
				databaseConnectivity.openConnection();
				int uid = 0;
				if (user != null) {
					uid = user.getId();
				}
				String sql = "SELECT * FROM cart_product inner join product on cart_product.product_id=product.id inner join product_image on product.id=product_image.product_id inner join cart on cart_product.cart_id=cart.id where cart.user_id="+uid;
				ResultSet rs = databaseConnectivity.fatchData(sql);
				if (rs.next()) {
					rs.previous();
					while (rs.next()) {
				%>
				<div class="col-12 col-sm-12 d-flex align-items-stretch">
					<div class="card bg-light">
						<div class="card-header text-muted border-bottom-0"></div>
						<div class="card-body pt-0">
							<div class="row">
								<div class="col-2 text-center">
									<img src="<%=request.getContextPath()%>/FMUploadedImages/<%=rs.getString(20)%>"
										alt="" class="img-circle img-fluid">
								</div>
								<div class="col-7">
									<input type="hidden" id="<%=rs.getInt(5)%>"
										value="<%=rs.getInt(5)%>">
									<h2 class="lead">
										<b><%=rs.getString(6).toUpperCase()%></b>
									</h2>
									<p class="text-muted text-sm">
										<b>SIZE:&nbsp;&nbsp;</b><%=rs.getString(9)%>
									</p>
									<p class="text-muted text-sm">
										<b>COMPANY NAME:&nbsp;&nbsp;</b><%=rs.getString(10)%>
									</p>
									<p class="text-muted text-sm">
										<b>DISCRIPTION:&nbsp;&nbsp;</b><%=rs.getString(11)%>
									</p>
									<p class="text-muted text-sm">
										<b>PRICE:&nbsp;&nbsp;</b>
										<%
										if (rs.getString(8) != null) {
										%>
										<span
											style="font-size: 20px; text-decoration: line-through; color: red;">&#x20B9;<%=rs.getInt(7)%></span>
										&nbsp;&nbsp;<span
											style="font-size: 20px; color: green;">&#x20B9;<%=rs.getInt(8)%></span>
										<%
										} else {
										%>
										<span style="font-size: 20px; color: green;">&#x20B9;<%=rs.getInt(7)%></span>
										<%
										}
										%>
									</p>
								</div>
							</div>
						</div>
						<div class="card-footer">
						<span class="float-sm-left" style="padding-top: 5px;"><b>(+)(-)QUANTITY</b></span>
							<div class="text-right">
								<div id="minus" class="btn btn-sm bg-primary"
									onclick="cart(0,'<%=rs.getInt(5)%>1','<%=rs.getInt(5)%>')">
									<i class="fas fa-minus"></i>
								</div>
								<input type="text" class="cartvalue" id="<%=rs.getInt(5)%>1"
									value="<%=rs.getInt(2)%>" disabled></input>
								<div id="add" class="btn btn-sm bg-primary"
									onclick="cart(1,'<%=rs.getInt(5)%>1','<%=rs.getInt(5)%>')">
									<i class="fas fa-plus"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				} else {
				%>
				<H3 style="padding-bottom: 12px; padding-left: 12px;">
					<b>Your Cart is empty.</b>
				</H3>
				<%
				}
				%>
			</div>
		</div>
		<%
		rs.beforeFirst();
		if (rs.next()) {
		%>
		<div class="card-footer">
			<div class="text-right">
				<a
					href="<%=request.getContextPath()%>/CustomerView/ordersummary.jsp"
					class="col-sm-2 float-sm-right btn btn-block btn-primary">Proceed
					To Order</a>
			</div>
		</div>
		<%
		}
		databaseConnectivity.closeConnection();
		%>
	</div>
</section>
<%@ include file="footer.jsp"%>