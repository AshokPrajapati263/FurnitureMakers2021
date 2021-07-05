<%@ include file="Variable.jsp" %>
<%@page import="DBconnection.DatabaseConnectivity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    if(request.getParameter("pcode")!=null)
    {
        String promocode = request.getParameter("pcode"); 
        try
        {
            /* Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
    				"jdbc:mysql://localhost:3306/Furniture_Makers", "root",
    				"Admin@123"); 
            PreparedStatement pstmt=null; 
            pstmt=con.prepareStatement("SELECT * FROM promocode WHERE code=? "); 
            pstmt.setString(1,promocode); 
            ResultSet rs=pstmt.executeQuery(); */
            databaseConnectivity.openConnection();
            //String sql = "SELECT * FROM promocode WHERE code=?";
            String sql = "SELECT * FROM promocode WHERE code='"+promocode+"'";
            /* PreparedStatement pstmt = databaseConnectivity.openConnection(sql);
            databaseConnectivity.setString(1, promocode);  */
            ResultSet rs = databaseConnectivity.fatchData(sql);
            if(rs.next())               
            {  
                %>
                <span class="text-danger" id="wrong"> &nbsp;<%=rs.getString("code")%>&nbsp; CODE ALREDY EXISTS !</span>
                <%
            }
            else
            {
                %>
                <span class="text-success" id="right"> &nbsp;<%=promocode%>&nbsp; CODE IS AVAILABLE</span>
                <%
            }
            databaseConnectivity.closeConnection();
            /* con.close(); */
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>