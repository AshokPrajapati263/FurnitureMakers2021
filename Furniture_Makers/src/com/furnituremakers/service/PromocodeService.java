package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.Promocode;

import DBconnection.DatabaseConnectivity;

public class PromocodeService {
	public boolean createData(Promocode promocode) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "insert into promocode (code,start_date,end_date,is_active,user_id,amount,is_percentage,max_discounted,applicable_count) values('"
					+ promocode.getCode() + "','"
					+ promocode.getStartDate() + " 00:00:00','"
					+ promocode.getEndDate() + " 23:59:59',"
					+ promocode.isActive() + ","
					+ promocode.getUserId() + ","
					+ promocode.getAmount() + ","
					+ promocode.isPercentage() + ","
					+ promocode.getMaxDiscount() + ","
					+ promocode.getApplicableCount() + ")";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		} 
		return true;
	}
	public boolean updateData(Promocode promocode) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update promocode set code='"+promocode.getCode()+"',"
					+ "start_date='"+promocode.getStartDate()+" 00:00:00',"
					+ "end_date='"+promocode.getEndDate()+" 23:59:59',"
					+ "is_active="+promocode.isActive()+","
					+ "user_id="+promocode.getUserId()+","
					+ "amount="+promocode.getAmount()+","
					+ "is_percentage="+promocode.isPercentage()+","
					+ "max_discounted="+promocode.getMaxDiscount()+","
					+ "applicable_count="+promocode.getApplicableCount()+" where id="+promocode.getId()+"";
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
