package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.MaterialsType;

import DBconnection.DatabaseConnectivity;

public class MaterialsTypeService {
	public boolean createData(MaterialsType materialsType) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into materials_type (name,is_active,created_date) values ('"+materialsType.getName()+"',"+materialsType.isActive()+",'"+materialsType.getCreatedDate()+"')";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(MaterialsType materialsType) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update materials_type set name='"+materialsType.getName()+"',updated_date='"+materialsType.getUpdatedDate()+"',is_active="+materialsType.isActive()+" where id="+materialsType.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
