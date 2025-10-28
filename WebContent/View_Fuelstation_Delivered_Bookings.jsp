<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.Station" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>View Delivered Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #a8e063, #56ab2f); /* Green gradient background */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .dashboard {
            width: 250px;
            background-color: #333;
            color: #fff;
            height: 100%;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            position: fixed;
            left: 0;
            top: 0;
            overflow-y: auto;
        }
        .sidebar_user_info {
            text-align: center;
            margin-bottom: 20px;
            padding: 20px 0;
            border-bottom: 1px solid #575757;
        }
        .user_profle_side {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .user_img img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #fff;
        }
        .user_info {
            margin-top: 10px;
            text-align: center;
        }
        .user_info h6 {
            margin: 0;
            font-size: 16px;
        }
        .user_info p {
            margin: 5px 0 0;
            font-size: 14px;
        }
        .user_info .online_animation {
            display: inline-block;
            width: 10px;
            height: 10px;
            background-color: #4caf50;
            border-radius: 50%;
            animation: pulse 1s infinite;
        }
        @keyframes pulse {
            0% {
                transform: scale(0.9);
                opacity: 0.7;
            }
            100% {
                transform: scale(1.2);
                opacity: 1;
            }
        }
        .dashboard .menu-item {
            padding: 15px;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: background-color 0.3s ease;
        }
        .dashboard .menu-item:hover {
            background-color: #575757;
        }
        .dashboard .menu-item i {
            margin-right: 10px;
        }
        .dashboard .menu-item span {
            font-size: 18px;
        }
        .dashboard .menu-item a {
            color: #fff;
            text-decoration: none;
            display: block;
        }
        .dashboard .menu-item a:hover {
            color: #4caf50;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-y: auto;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-around;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 250px;
            width: calc(100% - 250px);
            z-index: 1000;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #4caf50;
        }
        .navbar .nav-item {
            display: flex;
            align-items: center;
        }
        .navbar .nav-item i {
            margin-right: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #000;
        }
        th {
            background-color: #000;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #fff;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="sidebar_user_info">
            <div class="user_profle_side">
                <div class="user_img">
                    <img class="img-responsive" src="./images/image1.png" alt="User Image">
                </div>
                <div class="user_info">
                    <h6>Fuel Booking Platform</h6>
                    <p><span class="online_animation"></span> Online</p>
                </div>
            </div>
        </div>
        <div class="menu-item admin">
            <span><a href="admin_login.html">Admin</a></span>
        </div>
        <div class="menu-item fuel-station">
            <span><a href="login_fuel_station.html">Fuel Station</a></span>
        </div>
        <div class="menu-item delivery-person">
            <span><a href="delivery_person_login.html">Delivery Person</a></span>
        </div>
        <div class="menu-item user">
            <span><a href="User_login.html">User</a></span>
        </div>
    </div>
    <div class="content">
        <div class="navbar">
            <a href="Update_fuel_update.html" class="nav-item"><i class="fas fa-gas-pump"></i> Update Fuel Availability</a>
            <a href="update_fuel_rate.html" class="nav-item"><i class="fas fa-dollar-sign"></i> Update Fuel Rates</a>
            <a href="delivery_person.html" class="nav-item"><i class="fas fa-truck"></i> Delivery Person</a>
            <a href="pending_bookings.jsp" class="nav-item"><i class="fas fa-clock"></i> Pending Bookings</a>
            <a href="Fuel_Station_Assign_Bookings.jsp" class="nav-item"><i class="fas fa-calendar-day"></i> Assign Bookings</a>
            <a href="View_Fuelstation_Delivered_Bookings.jsp" class="nav-item"><i class="fas fa-check-circle"></i> Delivered Bookings</a>
            <a href="View_Rejected_Bookings.jsp" class="nav-item"><i class="fas fa-times-circle"></i> Rejected Bookings</a>
            <a href="Fuelstation_changepassword.html" class="nav-item"><i class="fas fa-key"></i> Change Password</a>
            <a href="index.html" class="nav-item"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
        <div class="main-content">
        <br>
        <br>
        <br>
            <h1>View Delivered Bookings:</h1>
            <table>
                <tr>
                    <th>Id</th>
                    <th>UserId</th>
                    <th>StationId</th>
                    <th>Deliveryperson Id</th>
                    <th>Fuel Type</th>
                    <th>Quantity</th>
                    <th>Total Bill</th>
                    <th>Status</th>
                    <th>Delivery Code</th>
                </tr>
                <% 
                try {
                    // Establish database connection
                    Connection con = ConnectDB.dbcon();
                    
                    // Query to fetch delivered bookings
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE status=? and stationid=?");
                    ps.setString(1, "Delivered");
                    ps.setInt(2, Station.getStationid());
                    ResultSet rs = ps.executeQuery();
                    
                    // Iterate through results and display in table rows
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("bid") %></td>
                    <td><%= rs.getString("uid") %></td>
                    <td><%= rs.getString("stationid") %></td>
                    <td><%= rs.getString("dpid") %></td>
                    <td><%= rs.getString("fueltype") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td><%= rs.getDouble("totalbill") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td><%= rs.getString("deliverycode") %></td>
                </tr>
                <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
        </div>
    </div>
</body>
</html>
