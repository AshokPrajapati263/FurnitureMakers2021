package com.furnituremakers.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.furnituremakers.pojo.Cart;
import com.furnituremakers.pojo.CartProduct;
import com.furnituremakers.util.Util;

import DBconnection.DatabaseConnectivity;

public class CartService {
	public boolean createData(Cart cart)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="select * from cart where user_id="+cart.getUserId();
		ResultSet rs = databaseConnectivity.fatchData(sql);
		if(rs.next())
		{
			rs.previous();
			while(rs.next())
			{
				cart.setId(rs.getInt(1));
			}
		}
		else {
			String dsql="SELECT id FROM delivery_address where user_id="+cart.getUserId()+" ORDER BY id DESC";
			ResultSet drs = databaseConnectivity.fatchData(dsql);
			while(drs.next())
			{
				cart.setDeliveryAddressId(drs.getInt(1));
				break;
			}
			String sql1="insert into cart (user_id,created_date,cart_total,delivery_address_id) values("+cart.getUserId()+",'"+Util.yyyymmddhhmmssFormate()+"',"+cart.getCartTotal()+","+cart.getDeliveryAddressId()+")";
			cart.setId(databaseConnectivity.excuteDataWithId(sql1));
		}
		createCartProduct(cart);
		databaseConnectivity.closeConnection();
		return true;
	}
	private boolean createCartProduct(Cart cart) throws SQLException, ClassNotFoundException {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="select * from cart_product where cart_id="+cart.getId()+" and product_id="+cart.getProductId();
		ResultSet rs = databaseConnectivity.fatchData(sql);
		if(rs.next())
		{
			rs.previous();
			if(cart.getQuantity() > 0) {
				String sql1 = "update cart_product set quantity="+cart.getQuantity()+" where cart_id="+cart.getId()+" and product_id="+cart.getProductId();
				databaseConnectivity.excuteData(sql1);
			}
			else
			{
				String sql1 = "delete from cart_product where cart_id="+cart.getId()+" and product_id="+cart.getProductId();
				databaseConnectivity.excuteData(sql1);
			}
		}
		else
		{
			if(cart.getQuantity()>0) {
				String sql1 = "insert into cart_product (quantity,product_id,cart_id) values("+cart.getQuantity()+","+cart.getProductId()+","+cart.getId()+")";
				databaseConnectivity.excuteData(sql1);
			}
		}
		getCartTotal(cart);
		String sql1 = "update cart set cart_total="+cart.getCartTotal()+" where id="+cart.getId();
		databaseConnectivity.excuteData(sql1);
		return true;
	}
	private void getCartTotal(Cart cart) throws SQLException, ClassNotFoundException {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "select sum(case when p.discounted_price is not null then p.discounted_price*cp.quantity else p.price*cp.quantity end) from cart_product as cp inner join product as p on cp.product_id=p.id where cp.cart_id="+cart.getId();
		ResultSet rs = databaseConnectivity.fatchData(sql);
		while(rs.next())
		{
			cart.setCartTotal(rs.getDouble(1));
		}
	}
	public int getCartCount(int userId) throws ClassNotFoundException, SQLException {
		int cartCount=0;
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "select count(*) from cart_product inner join cart on cart_product.cart_id=cart.id where cart.user_id="+userId;
		ResultSet rs = databaseConnectivity.fatchData(sql);
		while(rs.next())
		{
			cartCount = rs.getInt(1);
		}
		databaseConnectivity.closeConnection();
		return cartCount;
	}
	public Cart getCartFromUserId(int userId) throws ClassNotFoundException, SQLException
	{
		Cart cart = new Cart();
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="select * from cart where user_id="+userId;
		ResultSet rs = databaseConnectivity.fatchData(sql);
		while(rs.next())
		{
			cart.setId(rs.getInt(1));
			cart.setPromocodeId(rs.getInt(6)>0?rs.getInt(6):null);
			cart.setDiscountedAmount(rs.getInt(7));
			cart.setDeliveryAddressId(rs.getInt(8)>0?rs.getInt(8):null);
		}
		databaseConnectivity.closeConnection();
		return cart;
	}
	public LinkedList<CartProduct> getCartProductFromCartId(int cartId) throws ClassNotFoundException, SQLException
	{
		LinkedList<CartProduct> linkedList = new LinkedList<CartProduct>();
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="select * from cart_product where cart_id="+cartId;
		ResultSet rs = databaseConnectivity.fatchData(sql);
		while(rs.next())
		{
			CartProduct cartProduct = new CartProduct();
			cartProduct.setId(rs.getInt(1));
			cartProduct.setQuantity(rs.getInt(2));
			cartProduct.setProductId(rs.getInt(3));
			cartProduct.setCartId(rs.getInt(4));
			linkedList.add(cartProduct);
		}
		databaseConnectivity.closeConnection();
		return linkedList;
	}
	public void deleteCartProductFromCartId(int cartId) throws ClassNotFoundException, SQLException
	{
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="delete from cart_product where cart_id="+cartId;
		databaseConnectivity.excuteData(sql);
		databaseConnectivity.closeConnection();
	}
	public void deleteCartFromCartId(int cartId) throws ClassNotFoundException, SQLException
	{
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql="delete from cart where id="+cartId;
		databaseConnectivity.excuteData(sql);
		databaseConnectivity.closeConnection();
	}
}
