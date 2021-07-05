package com.furnituremakers.service;

import java.sql.ResultSet;

import com.furnituremakers.pojo.User;

import DBconnection.DatabaseConnectivity;

public class UserService {
	public boolean createData(User user)throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "insert into user(first_name,last_name,phone_no,email,password,dob,gender,address_line_1,address_line_2,area_id,user_type_master_id) values ('"+user.getFirstName()+"','"+user.getLastName()+"',"+user.getPhoneNo()+",'"+user.getEmail()+"','"+user.getPassword()+"','"+user.getDob()+"','"+user.getGender()+"','"+user.getAddressLine1()+"','"+user.getAddtessLine2()+"',"+user.getAreaId()+","+user.getUserTypeMasterId()+")";
		databaseConnectivity.excuteData(sql);
		databaseConnectivity.closeConnection();
		return true;
	}
	public User login(User user)throws Exception {
		User user2 = null;
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "select * from user where email='"+user.getEmail()+"' and password='"+user.getPassword()+"'";
		ResultSet rs = databaseConnectivity.fatchData(sql);
		if(rs.next())
		{
			rs.previous();
			user2 = new User();
			while(rs.next()) {
				user2.setFirstName(rs.getString(2));
				user2.setLastName(rs.getString(3));
				user2.setEmail(rs.getString(5));
				user2.setUserTypeMasterId(rs.getInt(12));
				user2.setId(rs.getInt(1));
			}
		}
		databaseConnectivity.closeConnection();
		return user2;
	}
}
