package com.furnituremakers.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.furnituremakers.pojo.Cart;
import com.furnituremakers.pojo.CartProduct;
import com.furnituremakers.pojo.Order;
import com.furnituremakers.pojo.User;
import com.furnituremakers.util.MailUtil;
import com.furnituremakers.util.Util;

import DBconnection.DatabaseConnectivity;

public class OrderService {
	CartService cartService = new CartService();
	public boolean setOrder(HttpServletRequest httpServletRequest) throws ClassNotFoundException, SQLException
	{
		HttpSession httpSession = httpServletRequest.getSession();
		Order order = new Order();
		User user = null;
		if(httpSession.getAttribute("user")!=null)
		{
			user = (User)httpSession.getAttribute("user");
			order.setUserId(user.getId());
		}
		Double orderTotal=0.0;
		Cart cart = cartService.getCartFromUserId(order.getUserId());
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String orderCode = Util.getOrderCode();
		String SOsql = "insert into orders(order_code,user_id,created_date,order_total,promocode_id,discounted_amount,delivery_address_id,status_master_id) values('"+orderCode+"',"+order.getUserId()+",'"+Util.yyyymmddhhmmssFormate()+"',0,"+cart.getPromocodeId()+","+cart.getDiscountedAmount()+","+cart.getDeliveryAddressId()+",1)";
		order.setId(databaseConnectivity.excuteDataWithId(SOsql));
		setOrderProduct(cart.getId(),order.getId());
		String sql1 = "select sum(case when p.discounted_price is not null then p.discounted_price*op.quantity else p.price*op.quantity end) from order_product as op inner join product as p on op.product_id=p.id where op.order_id="+order.getId();
		ResultSet rs2 = databaseConnectivity.fatchData(sql1);
		while(rs2.next())
		{
			orderTotal=rs2.getDouble(1);
		}
		String sql2 = "update orders set order_total="+orderTotal+" where id="+order.getId();
		databaseConnectivity.excuteData(sql2);
		cartService.deleteCartProductFromCartId(cart.getId());
		cartService.deleteCartFromCartId(cart.getId());
		databaseConnectivity.closeConnection();
		MailUtil.send(user.getEmail(), "Orderd Pacled", "Your Order place successflly... Your Order Code is ::"+orderCode);
		return true;
	}
	public void setOrderProduct(int cartId,int orderId) throws ClassNotFoundException, SQLException {
		LinkedList<CartProduct> linkedList = cartService.getCartProductFromCartId(cartId);
		if(linkedList != null && !linkedList.isEmpty())
		{
			DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
			databaseConnectivity.openConnection();
			for(CartProduct cartProduct:linkedList)
			{
				ProductService productService = new ProductService();
				Double amount[] = productService.getPriceAndDiscountedPriceFromProductId(cartProduct.getProductId());
				String sql = "insert into order_product(quantity,product_id,price,discounted_price,order_id,status_master_id) values("+cartProduct.getQuantity()+","+cartProduct.getProductId()+","+amount[0]+","+amount[1]+","+orderId+",1)";
				databaseConnectivity.excuteData(sql);
			}
			//databaseConnectivity.closeConnection();
		}
	}
}
