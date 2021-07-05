package com.furnituremakers.pojo;

import java.util.List;

public class SubscriptionTypeMaster {
	private int id;
	private boolean flag;
	private String name;
	private String createdDate;
	private String updatedDate;
	private int validityType;
	private double price;
	private String onlineDate;
	private String endDate;
	private int subscriptionTypeMasterId;
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
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	public int getValidityType() {
		return validityType;
	}
	public void setValidityType(int validityType) {
		this.validityType = validityType;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getOnlineDate() {
		return onlineDate;
	}
	public void setOnlineDate(String onlineDate) {
		this.onlineDate = onlineDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getSubscriptionTypeMasterId() {
		return subscriptionTypeMasterId;
	}
	public void setSubscriptionTypeMasterId(int subscriptionTypeMasterId) {
		this.subscriptionTypeMasterId = subscriptionTypeMasterId;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
}
