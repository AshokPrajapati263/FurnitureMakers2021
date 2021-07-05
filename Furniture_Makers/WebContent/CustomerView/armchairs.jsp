<%@ include file="Variable.jsp"%>
<%
index = 2;
subIndex = 1;
%>
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
<section class="content-header" style="margin-bottom: -22px">
</section>
<section class="content">
	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="row d-flex align-items-stretch">
				<%
				databaseConnectivity.openConnection();
				String sql = "SELECT * FROM product inner join product_image on product.id=product_image.product_id inner join materials_type on product.materials_type_id=materials_type.id where product.is_active=1 and product.sub_category_id=7;";
				ResultSet rs = databaseConnectivity.fatchData(sql);
				if (rs.next()) {
					rs.previous();
					while (rs.next()) {
				%>
				<div class="col-12 col-sm-6 col-md-6 d-flex align-items-stretch">
					<div class="card bg-light">
						<div class="card-header text-muted border-bottom-0"></div>
						<div class="card-body pt-0">
							<div class="row">
								<div class="col-12 col-sm-12 col-md-5 text-center mb-5">
								<a href="<%=request.getContextPath()%>/FMUploadedImages/<%=rs.getString(16)%>">
									<img src="<%=request.getContextPath()%>/FMUploadedImages/<%=rs.getString(16)%>"
										alt="" class="img-circle img-fluid"></a>
								</div>
								<div class="col-12 col-sm-12 col-md-7">
									<input type="hidden" id="<%=rs.getInt(1)%>"
										value="<%=rs.getInt(1)%>">
									<h2 class="lead">
										<b><%=rs.getString(2).toUpperCase()%></b>
									</h2>
									<p class="text-muted text-sm">
										<b>SIZE:&nbsp;&nbsp;</b><%=rs.getString(5)%>
									</p>
									<p class="text-muted text-sm">
										<b>COMPANY NAME:&nbsp;&nbsp;</b><%=rs.getString(6)%>
									</p>
									<p class="text-muted text-sm">
										<b>COLOUR:&nbsp;&nbsp;</b><%=rs.getString(8)%>
									</p>
									<p class="text-muted text-sm">
										<b>MATERIALS TYPE:&nbsp;&nbsp;</b><%=rs.getString(19)%>
									</p>
									<p class="text-muted text-sm">
										<b>DISCRIPTION:&nbsp;&nbsp;</b><%=rs.getString(7)%>
									</p>
									<p class="text-muted text-sm">
										<b>PRICE:&nbsp;&nbsp;</b>
										<%
										if (rs.getString(4) != null) {
										%>
										<span
											style="font-size: 20px; text-decoration: line-through; color: red;">&#x20B9;<%=rs.getInt(3)%></span>
										&nbsp;&nbsp;<span
											style="font-size: 20px; color: green;">&#x20B9;<%=rs.getInt(4)%></span>
										<%
										} else {
										%>
										<span style="font-size: 20px; color: green;">&#x20B9;<%=rs.getInt(3)%></span>
										<%
										}
										%>
									</p>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
							<span class="float-sm-left" style="padding-top: 5px;"><b>(+)ADD TO CART</b></span>
								<div id="minus" class="btn btn-sm bg-primary"
									onclick="cart(0,'<%=rs.getInt(1)%>1','<%=rs.getInt(1)%>')">
									<i class="fas fa-minus"></i>
								</div>
								<input type="text" class="cartvalue" id="<%=rs.getInt(1)%>1"
									value="<%@ include file="CartQuantity.jsp"%>"
									disabled></input>
								<div id="add" class="btn btn-sm bg-primary"
									onclick="cart(1,'<%=rs.getInt(1)%>1','<%=rs.getInt(1)%>')">
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
					<b>We currently have no products....</b>
				</H3>
				<%
				}
				databaseConnectivity.closeConnection();
				%>
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>