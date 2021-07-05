package com.furnituremakers.service;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import DBconnection.DatabaseConnectivity;

public class ReportService {
	public void countyReport(HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		DatabaseConnectivity databaseConnectivity = DatabaseConnectivity.getInstance();
		databaseConnectivity.openConnection();
		String sql = "select * from country order by id desc";
		Workbook wb = new HSSFWorkbook(); 
		Sheet sheet = wb.createSheet("First Sheet");
		String header[] = {"Name","Created Date","Updated Date","Is Active"};
		ResultSet rs = databaseConnectivity.fatchData(sql);
		Row row = sheet.createRow(0);
		Cell cell;
		int hc = 0;
		for(String s: header)
		{
			if(hc<4)
			{
				cell = row.createCell(hc);
			    cell.setCellValue(s);
			    hc++;
			}
		}
		int r = 1;
		while(rs.next()) {
			row = sheet.createRow(r);
			cell = row.createCell(0);
	        cell.setCellValue(rs.getString(2));
	        cell = row.createCell(1);
	        cell.setCellValue(rs.getString(4));
	        cell = row.createCell(2);
	        cell.setCellValue(rs.getString(5));
	        cell = row.createCell(3);
	        cell.setCellValue(rs.getBoolean(3));
			r++;
		}
		OutputStream out = response.getOutputStream();
	    response.reset();
	    response.setContentType("application/vnd.ms-excel");
	    response.setHeader("Content-Disposition", "attachment; filename="+ "CountryReport.xls");
	    wb.write(out);
	    out.close();
	    wb.close();
		databaseConnectivity.closeConnection();
	}
}
