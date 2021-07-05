package com.furnituremakers.service;

import java.sql.SQLException;

import com.furnituremakers.pojo.SubscriptionTypeMaster;
import com.furnituremakers.util.Util;

import DBconnection.DatabaseConnectivity;

public class SubscriptionTypeMasterService {
	public boolean createData(SubscriptionTypeMaster subscriptionTypeMaster) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			
			if(subscriptionTypeMaster.getEndDate()!=null && !subscriptionTypeMaster.getEndDate().isEmpty()) {
			String sql = "insert into Subscription_type_master (name,created_date,validity_type,price,online_date,end_date) values('"
					+ subscriptionTypeMaster.getName() + "','"
					+ subscriptionTypeMaster.getCreatedDate() + "','"
					+ subscriptionTypeMaster.getValidityType() + "',"
					+ subscriptionTypeMaster.getPrice() + ",'"
					+ subscriptionTypeMaster.getOnlineDate() + " 00:00:00','"
					+ subscriptionTypeMaster.getEndDate() + " 23:59:59')";
			databaseConnectivity.excuteData(sql);
			}
			else
			{
				String sql = "insert into Subscription_type_master (name,created_date,validity_type,price,online_date) values('"
						+ subscriptionTypeMaster.getName() + "','"
						+ subscriptionTypeMaster.getCreatedDate() + "','"
						+ subscriptionTypeMaster.getValidityType() + "',"
						+ subscriptionTypeMaster.getPrice() + ",'"
						+ subscriptionTypeMaster.getOnlineDate() + " 00:00:00')";
				databaseConnectivity.excuteData(sql);
			}
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean updateData(SubscriptionTypeMaster subscriptionTypeMaster) throws Exception {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity
				.getInstance();
		try {
			databaseConnectivity.openConnection();
			if(subscriptionTypeMaster.isFlag())
			{
			String sql = "update subscription_type_master set updated_date='"+subscriptionTypeMaster.getUpdatedDate()+"',end_date='"+Util.oneDayMinus(subscriptionTypeMaster.getOnlineDate())+" 23:59:59' where id="+subscriptionTypeMaster.getId();
			databaseConnectivity.excuteData(sql);
			String sql2 = "insert into Subscription_type_master (name,created_date,validity_type,price,online_date,subscription_type_master_id) values('"
					+ subscriptionTypeMaster.getName() + "','"
					+ subscriptionTypeMaster.getCreatedDate() + "','"
					+ subscriptionTypeMaster.getValidityType() + "',"
					+ subscriptionTypeMaster.getPrice() + ",'"
					+ subscriptionTypeMaster.getOnlineDate() + " 00:00:00',"
					+ subscriptionTypeMaster.getId()+")";
			databaseConnectivity.excuteData(sql2);
			}
			else
			{
				if(subscriptionTypeMaster.getEndDate()!=null && !subscriptionTypeMaster.getEndDate().isEmpty()) {
				String sql = "update subscription_type_master set name='"+subscriptionTypeMaster.getName()+"',created_date='"+subscriptionTypeMaster.getCreatedDate()+"',validity_type="+subscriptionTypeMaster.getValidityType()+",price="+subscriptionTypeMaster.getPrice()+",online_date='"+subscriptionTypeMaster.getOnlineDate()+" 00:00:00',updated_date='"+subscriptionTypeMaster.getUpdatedDate()+"',end_date='"+subscriptionTypeMaster.getEndDate()+" 23:59:59' where id="+subscriptionTypeMaster.getId();
				databaseConnectivity.excuteData(sql);
				}
				else
				{
					String sql = "update subscription_type_master set name='"+subscriptionTypeMaster.getName()+"',created_date='"+subscriptionTypeMaster.getCreatedDate()+"',validity_type="+subscriptionTypeMaster.getValidityType()+",price="+subscriptionTypeMaster.getPrice()+",online_date='"+subscriptionTypeMaster.getOnlineDate()+" 00:00:00',updated_date='"+subscriptionTypeMaster.getUpdatedDate()+"' where id="+subscriptionTypeMaster.getId();
					databaseConnectivity.excuteData(sql);
				}
			}
			databaseConnectivity.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
