package com.furnituremakers.pojo;

public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String phoneNo;
	private String email;
	private String password;
	private String dob;
	private String gender;
	private String addressLine1;
	private String addtessLine2;
	private int areaId;
	private int userTypeMasterId;
	private int subscriptionTypeMasterId;
	private int cartCount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddtessLine2() {
		return addtessLine2;
	}
	public void setAddtessLine2(String addtessLine2) {
		this.addtessLine2 = addtessLine2;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public int getUserTypeMasterId() {
		return userTypeMasterId;
	}
	public void setUserTypeMasterId(int userTypeMasterId) {
		this.userTypeMasterId = userTypeMasterId;
	}
	public int getSubscriptionTypeMasterId() {
		return subscriptionTypeMasterId;
	}
	public void setSubscriptionTypeMasterId(int subscriptionTypeMasterId) {
		this.subscriptionTypeMasterId = subscriptionTypeMasterId;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
}
