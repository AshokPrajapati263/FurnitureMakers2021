package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.Area;

import DBconnection.DatabaseConnectivity;

public class AreaService {
	public boolean createData(Area area)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into area (pincode,name,is_active,created_date,city_id) values('"+area.getPincode()+"','"+area.getName()+"',"+area.isActive()+",'"+area.getCreatedDate()+"',"+area.getCityId()+")";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(Area area) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update area set pincode='"+area.getPincode()+"',name='"+area.getName()+"',updated_date='"+area.getUpdatedDate()+"',is_active="+area.isActive()+",city_id="+area.getCityId()+" where id="+area.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
