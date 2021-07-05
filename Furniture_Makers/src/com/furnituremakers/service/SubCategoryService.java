package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.SubCategory;

import DBconnection.DatabaseConnectivity;

public class SubCategoryService {
	public boolean createData(SubCategory subCategory) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into sub_category(name,is_active,created_date,category_id) values('"+subCategory.getName()+"',"+subCategory.isActive()+",'"+subCategory.getCreatedDate()+"',"+subCategory.getCategoryId()+")";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(SubCategory subCategory) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update sub_category set name='"+subCategory.getName()+"',updated_date='"+subCategory.getUpdatedDate()+"',is_active="+subCategory.isActive()+",category_id="+subCategory.getCategoryId()+" where id="+subCategory.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
