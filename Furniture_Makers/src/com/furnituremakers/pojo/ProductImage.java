package com.furnituremakers.pojo;

import java.util.List;

public class ProductImage {
	private int id;
	private String name;
	private int productId;
	private List<String> errorMsg;
	public List<String> getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(List<String> errorMsg) {
		this.errorMsg = errorMsg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
}
