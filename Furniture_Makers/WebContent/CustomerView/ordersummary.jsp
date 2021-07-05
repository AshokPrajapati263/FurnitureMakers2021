<%@ include file="Variable.jsp"%>
<%@ include file="header.jsp"%>
<style>
#ratetable {
	border-collapse: separate;
	width: 100%;
}

#ratetable tr, #ratetable th, #ratetable td {
	padding: 10px;
}
</style>
<section class="content-header" style="margin-bottom: -16px;">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>YOUR ORDERSUMMARY</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">CartList</a></li>
					<li class="breadcrumb-item active">OrderSummary</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content">
	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="row d-flex align-items-stretch">
				<%
				int address = 0;
				databaseConnectivity.openConnection();
				String sql = "SELECT * FROM cart inner join delivery_address on cart.delivery_address_id=delivery_address.id inner join area on delivery_address.area_id=area.id where cart.user_id="
						+ userId;
				ResultSet rs = databaseConnectivity.fatchData(sql);
				if (rs.next()) {
					rs.previous();
					address = 1;
					while (rs.next()) {
				%>
				<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
					<div class="card card-outline card-primary">
						<div class="card-header text-muted">
							<b><%=rs.getString(10).toUpperCase()%>&nbsp;&nbsp;<%=rs.getString(11).toUpperCase()%></b>
						</div>
						<div class="card-body">
							<div class="col-12 text-muted">
								<%=rs.getString(12)%>,<%=rs.getString(13)%>,<%=rs.getString(19)%>,<%=rs.getString(18)%>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
								<button class="btn btn-block btn-primary">Change
									Address</button>
							</div>
						</div>
					</div>
				</div>
				<%
				break;
				}
				} else {
				%>
				<div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
					<div class="card card-outline card-primary">
						<div class="card-header text-muted border-bottom-0"></div>
						<div class="card-body pt-0">
							<div class="row">
								<span style="color: red;">You did't have any delivery
									address please add address...</span>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
								<button class="btn btn-block btn-primary"
									onclick="AddAddress();">Add Address</button>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				databaseConnectivity.closeConnection();
				%>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-primary">
						<div class="card-body">
							<table id="example2" class="table">
								<thead>
									<tr>
										<th>Qty</th>
										<th>Product</th>
										<th>Description</th>
										<th>Price</th>
										<th>Discount</th>
									</tr>
								</thead>
								<tbody>
									<%
									databaseConnectivity.openConnection();
									String sql1 = "SELECT * FROM cart_product inner join product on cart_product.product_id=product.id inner join product_image on product.id=product_image.product_id inner join cart on cart_product.cart_id=cart.id where cart.user_id="
											+ userId;
									ResultSet rs1 = databaseConnectivity.fatchData(sql1);
									while (rs1.next()) {
									%>
									<tr>
										<td><%=rs1.getInt(2)%></td>
										<td><%=rs1.getString(6).toUpperCase()%></td>
										<td><%=rs1.getString(11).substring(0, 50)%><span
											data-toggle="tooltip" title="<%=rs1.getString(11)%>"
											style="cursor: pointer; color: blue;">...</span></td>
										<td>&#x20B9;<%=rs1.getInt(7)%></td>
										<%
										if (rs1.getInt(8) != 0) {
										%>
										<td>&#x20B9;<%=rs1.getInt(8)%></td>
										<%
										} else {
										%>
										<td>---</td>
										<%
										}
										%>
									</tr>
									<%
									}
									databaseConnectivity.closeConnection();
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-primary">
						<div class="card-body">
							<div class="table-responsive">
								<table id="ratetable">
									<%
									databaseConnectivity.openConnection();
									String sql2 = "select sum(p.price*quantity) as MRP,sum(p.price*quantity)-sum(case when p.discounted_price is not null then p.discounted_price*cp.quantity else p.price*cp.quantity end) as Retail_Discount,sum(case when p.discounted_price is not null then p.discounted_price*cp.quantity else p.price*cp.quantity end) as Offer_Price from cart_product as cp inner join product as p on cp.product_id=p.id inner join cart as c on cp.cart_id=c.id where c.user_id="
											+ userId;
									ResultSet rs2 = databaseConnectivity.fatchData(sql2);
									while (rs2.next()) {
									%>
									<tr>
										<th style="width: 50%">MRP:</th>
										<td><b>&nbsp;&nbsp;&nbsp;&nbsp; &#x20B9;<%=rs2.getInt(1)%></b></td>
									</tr>
									<tr style="color: green"
										<%if (rs2.getInt(2) <= 0) {
	out.print("hidden");
}%>>
										<th>Retail Discount:</th>
										<td><b>(-) &#x20B9;<%=rs2.getInt(2)%></b></td>
									</tr>
									<tr>
										<th>Offer Price:</th>
										<td><b>&nbsp;&nbsp;&nbsp;&nbsp; &#x20B9;<%=rs2.getInt(3)%></b></td>
									</tr>
								</table>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="row">
										<label class="col-sm-3 col-form-label">APPLY
											PROMOCODE:</label>
										<div class="col-sm-7">
											<input type="text" class="form-control"
												placeholder="Enter Code" name="promocode" id="promocode"
												maxlength="10"
												title="Note: Enter minimum 4 values. Example = Holi2021">
											<span id="available"></span>
										</div>
										<div class="col-sm-2">
											<a type="button" style="color: white;"
												class="btn btn-primary btn-block float-sm-right"><b>APPLY</b></a>
										</div>
									</div>
								</div>
								<div class="overlay" hidden="">
									<i class="fas fa-2x fa-sync-alt fa-spin"></i>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<table
								style="color: red; border-collapse: separate; width: 100%; font-size: 130%;">
								<tr>
									<th>Your Total:</th>
									<td><b>&nbsp;&nbsp;&nbsp;&nbsp; &#x20B9;<%=rs2.getInt(3)%></b></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<%
				}
				databaseConnectivity.closeConnection();
				%>
			</div>
		</div>
		<form action="<%=request.getContextPath()%>/OrderController"
			method="post">
			<div class="card-footer">
				<div class="text-right">
					<button type="submit"
						class="col-sm-2 float-sm-right btn btn-block btn-primary"
						<%if (address == 0) {
	out.print("disabled");
}%>>Place
						Ordered</button>
				</div>
			</div>
		</form>
		<!-- <div class="overlay dark">
		<i class="fas fa-2x fa-sync-alt fa-spin"></i>
	</div> -->
	</div>
	
</section>
<%@ include file="footer.jsp"%>