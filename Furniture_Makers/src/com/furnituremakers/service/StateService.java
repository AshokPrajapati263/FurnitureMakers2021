package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.State;

import DBconnection.DatabaseConnectivity;

public class StateService {
	public boolean createData(State state)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into state (name,is_active,created_date,country_id) values('"+state.getName()+"',"+state.isActive()+",'"+state.getCreatedDate()+"',"+state.getCountryId()+")";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(State state) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update state set name='"+state.getName()+"',updated_date='"+state.getUpdatedDate()+"',is_active="+state.isActive()+",country_id="+state.getCountryId()+" where id="+state.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
