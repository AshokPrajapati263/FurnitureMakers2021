package com.furnituremakers.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.furnituremakers.pojo.Country;

import DBconnection.DatabaseConnectivity;

public class CountryService {
	public boolean createData(Country country) throws Exception{
		/*
		 * DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
		 * .getInstance(); databaseConnectivity.openConnection();
		 * 
		 * String sql =
		 * "insert into country(name,is_active,created_date) values ('"+country.
		 * getName()+"',"+country.isActive()+",'"+country.getCreatedDate()+"')";
		 * System.out.println(sql); databaseConnectivity.excuteData(sql);
		 * databaseConnectivity.closeConnection();
		 */
			String sql = "insert into country(name,is_active,created_date) values (?,?,?)";
			DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
			Connection con = databaseConnectivity.openConnectionWithPrepared();
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, country.getName());
			preparedStatement.setBoolean(2, country.isActive());
			preparedStatement.setString(3, country.getCreatedDate());
			databaseConnectivity.excuteData(preparedStatement);
			databaseConnectivity.closeConnection();
		return true;
	}
	public boolean updateData(Country country) throws Exception{
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			String sql = "update country set name='"+country.getName()+"',updated_date='"+country.getUpdatedDate()+"',is_active="+country.isActive()+" where id="+country.getId();
			databaseConnectivity.excuteData(sql);
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
