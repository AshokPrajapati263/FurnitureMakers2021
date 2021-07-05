package com.furnituremakers.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class Util {
	public static String yyyymmddhhmmssFormate() {
		Date date = Calendar.getInstance().getTime();  
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		return dateFormat.format(date);
	}
	public static String getOrderCode() {
		return "ORD"+Calendar.getInstance().getTime().getTime();
	}
	public static String oneDayMinus(String userDate) throws ParseException
	{
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(userDate, format);
		return localDate.minusDays(1).toString();
	}
}
