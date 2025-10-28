<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
     try{
    	 String stationid=request.getParameter("stationid");
           Connection con=ConnectDB.dbcon();
           PreparedStatement ps=con.prepareStatement("update fuelstation set fstatus=? where stationid=?");
           ps.setString(1,"Disapproved");
           ps.setInt(2,Integer.parseInt(stationid));
            int i=ps.executeUpdate();
     if(i>0)
     {
    	 response.sendRedirect("pending_fuel_station.jsp");
     }else
     {
    	 response.sendRedirect("error.html");
     }
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>