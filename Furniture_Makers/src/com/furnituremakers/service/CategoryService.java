package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.Category;

import DBconnection.DatabaseConnectivity;

public class CategoryService {
	public boolean createData(Category category)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into category(name,is_active,created_date) values ('"+category.getName()+"',"+category.isActive()+",'"+category.getCreatedDate()+"')";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(Category category) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update category set name='"+category.getName()+"',updated_date='"+category.getUpdatedDate()+"',is_active="+category.isActive()+" where id="+category.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
