
<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.User" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                    <h1>Pending Fuel Bookings </h1>
                        
                            <%
                                int stationid = Integer.parseInt(request.getParameter("stationid"));
                                int uid = Integer.parseInt(request.getParameter("uid"));
                                String fueltype = request.getParameter("fueltype");
                                int quantity = Integer.parseInt(request.getParameter("quantity"));
                                String status ="Pending";
                                int deliverycode = (int) (Math.random()*9000+1000);
                                String query = null;
                                
                                try {
                                    Connection con = ConnectDB.dbcon();
                                    if(fueltype.equals("Petrol")){
                                        query = "SELECT fpetrolrate FROM fuelstation WHERE stationid = ?";
                                    } else if(fueltype.equals("Diesel")){
                                        query = "SELECT fdieselrate FROM fuelstation WHERE stationid = ?";
                                    }
                                    
                                    PreparedStatement ps1 = con.prepareStatement(query);
                                    ps1.setInt(1,stationid);
                                    ResultSet rs = ps1.executeQuery();
                                    if(rs.next()) {
                                        float rate = rs.getFloat(1);
                                        float totalbill = rate * quantity;

                                        PreparedStatement ps = con.prepareStatement("insert into bookings (uid,stationid,fueltype,quantity,totalbill,status, deliverycode ) values (?, ?, ?, ?, ?, ?, ?)");
                                        ps.setInt(1,uid);
                                        ps.setInt(2,stationid);
                                        ps.setString(3,fueltype);
                                        ps.setInt(4,quantity);
                                        ps.setFloat(5,totalbill);
                                        ps.setString(6,status);
                                        ps.setDouble(7,deliverycode);
                                      
                                        

                                        int result = ps.executeUpdate();
                                        if(result > 0) {
                            %>
                            <p>Booking successfully created! Your delivery code is <%= deliverycode %> and your total bill is <%= totalbill %> INR.</p>
                            <%
                                        } else {
                            %>
                            <p>Failed to create booking. Please try again.</p>
                            <%
                                        }
                                    } else {
                            %>
                            <p>Failed to retrieve fuel rate. Please try again.</p>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                            %>
                            <p>Exception occurred: <%= e.getMessage() %></p>
                            <%
                                }
                            %>
                            <a href="view_fuelstation.jsp">Back to View Fuel Stations</a>
                        </div>
                    </div>
                </div>
          
        <!--footer-->
     
    <!-- Classie -->
    <script src="js/classie.js"></script>
    <script>
        var menuLeft = document.getElementById('cbp-spmenu-s1'),
            showLeftPush = document.getElementById('showLeftPush'),
            body = document.body;

        showLeftPush.onclick = function() {
            classie.toggle(this, 'active');
            classie.toggle(body, 'cbp-spmenu-push-toright');
            classie.toggle(menuLeft, 'cbp-spmenu-open');
            disableOther('showLeftPush');
        };

        function disableOther(button) {
            if (button !== 'showLeftPush') {
                classie.toggle(showLeftPush, 'disabled');
            }
        }
    </script>



</body>
</html>