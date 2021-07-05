package com.furnituremakers.pojo;
public class Cart {
	private int id;
	private int productId;
	private int quantity;
	private int userId;
	private double cartTotal;
	private Integer promocodeId;
	private double discountedAmount;
	private Integer deliveryAddressId;
	public Integer getPromocodeId() {
		return promocodeId;
	}
	public void setPromocodeId(Integer promocodeId) {
		this.promocodeId = promocodeId;
	}
	public double getDiscountedAmount() {
		return discountedAmount;
	}
	public void setDiscountedAmount(double discountedAmount) {
		this.discountedAmount = discountedAmount;
	}
	public Integer getDeliveryAddressId() {
		return deliveryAddressId;
	}
	public void setDeliveryAddressId(Integer deliveryAddressId) {
		this.deliveryAddressId = deliveryAddressId;
	}
	public double getCartTotal() {
		return cartTotal;
	}
	public void setCartTotal(double cartTotal) {
		this.cartTotal = cartTotal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
