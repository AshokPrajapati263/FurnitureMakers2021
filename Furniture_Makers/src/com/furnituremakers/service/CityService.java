package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.City;

import DBconnection.DatabaseConnectivity;

public class CityService {
	public boolean createData(City city)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into city (name,is_active,created_date,state_id) values('"+city.getName()+"',"+city.isActive()+",'"+city.getCreatedDate()+"',"+city.getStateId()+")";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(City city) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update city set name='"+city.getName()+"',updated_date='"+city.getUpdatedDate()+"',is_active="+city.isActive()+",state_id="+city.getStateId()+" where id="+city.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
