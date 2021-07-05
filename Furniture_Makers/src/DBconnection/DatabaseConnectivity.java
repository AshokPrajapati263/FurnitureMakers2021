package DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnectivity {

	private DatabaseConnectivity() {

	}
	static DatabaseConnectivity databaseConnectivity = null;
	Connection con = null;
	Statement state = null;
	PreparedStatement pstmt=null;

	public void openConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/Furniture_Makers", "root",
				"Admin@123");
		state = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	}
	public void excuteData(PreparedStatement pst) throws SQLException {
		pst.executeUpdate();
	}
	public Connection openConnectionWithPrepared() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/Furniture_Makers", "root",
				"Admin@123");
		return con;
	}

	public PreparedStatement openConnection(String sql) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/Furniture_Makers", "root",
				"Admin@123");
		pstmt=con.prepareStatement(sql);
		return pstmt;
	}
	public void setString(int index,String value) {
		try {
			pstmt.setString(index,value);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void closeConnection() throws SQLException {
		con.close();
	}
	public void excuteData(String sql) throws SQLException {
		state.executeUpdate(sql);
	}
	public int excuteDataWithId(String sql) throws SQLException {
		int generatedId = 0;
		state.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
		ResultSet rs = state.getGeneratedKeys();
		if(rs.next())
			generatedId = rs.getInt(1);
		return generatedId;
	}
	public ResultSet fatchData(PreparedStatement pstmt) throws SQLException {
		return pstmt.executeQuery();
	}
	public ResultSet fatchData(String sql) throws SQLException {
		return state.executeQuery(sql);
	}
	public static DatabaseConnectivity getInstance() {
		 if(databaseConnectivity == null)
			 databaseConnectivity = new DatabaseConnectivity();
		 return databaseConnectivity;
	}
}
