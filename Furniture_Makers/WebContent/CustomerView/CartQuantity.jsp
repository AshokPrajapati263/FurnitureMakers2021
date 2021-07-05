<%databaseConnectivity.openConnection();
String qSql = "SELECT product.id,cart_product.quantity FROM product inner join cart_product on cart_product.product_id=product.id inner join cart on cart_product.cart_id=cart.id where product.is_active=1 and cart.user_id="
		+ userId + " order by product.id;";
ResultSet qRs = databaseConnectivity.fatchData(qSql);
int i = 0;
if (qRs.next()) {
	qRs.previous();
	while (qRs.next()) {
		if (rs.getInt(1) == qRs.getInt(1)) {
			out.print(qRs.getInt(2));
			i++;
		} else {
			if (qRs.next()) {
				qRs.previous();
				continue;
			} else {
				if (i <= 0)
					out.print("0");
			}
		}
	}
} else {
	if (i <= 0)
		out.print("0");
}%>