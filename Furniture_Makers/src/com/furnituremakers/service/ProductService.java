package com.furnituremakers.service;

import java.sql.ResultSet;
import java.sql.SQLException;


import DBconnection.DatabaseConnectivity;

public class ProductService {
	public Double[] getPriceAndDiscountedPriceFromProductId(int productId) throws ClassNotFoundException, SQLException
	{
		Double amount[] = new Double[2];
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "select price,discounted_price from product where id="+productId;
		ResultSet rs = databaseConnectivity.fatchData(sql);
		while(rs.next())
		{
			amount[0]=rs.getDouble(1);
			amount[1]=rs.getDouble(2)>0?rs.getDouble(2):null;
		}
		//databaseConnectivity.closeConnection();
		return amount;
	}
}
