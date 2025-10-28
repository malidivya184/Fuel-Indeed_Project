<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approved Fuel Stations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #4caf50, #81c784);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
        }
        .dashboard {
            width: 250px;
            background-color: #333;
            color: #fff;
            height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            position: fixed;
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
        .dashboard .menu-item a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
        }
        .menu-item span {
            position: relative;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            0% { opacity: 0; left: -10px; }
            100% { opacity: 1; left: 0; }
        }
        .content {
            margin-left: 250px; /* Adjusted for the width of the sidebar */
            padding: 20px;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-around;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 250px; /* Adjusted for the width of the sidebar */
            width: calc(100% - 250px);
            z-index: 1000;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
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
        .main-content {
            margin-top: 70px; /* Adjusted for the height of the navbar */
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .main-content h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            color: #333;
            text-decoration: none;
        }
        a:hover {
            color: #4caf50;
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
            <a href="admin_login.html"><i class="fas fa-user"></i> <span>Admin</span></a>
        </div>
        <div class="menu-item fuel-station">
            <a href="login_fuel_station.html"><i class="fas fa-gas-pump"></i> <span>Fuel Station</span></a>
        </div>
        <div class="menu-item delivery-person">
            <a href="delivery_person_login.html"><i class="fas fa-truck"></i> <span>Delivery Person</span></a>
        </div>
        <div class="menu-item user">
            <a href="User_login.html"><i class="fas fa-user-circle"></i> <span>User</span></a>
        </div>
    </div>
    <div class="navbar">
        <a href="pending_fuel_station.jsp" class="nav-item"><i class="fas fa-clock"></i> Pending Fuel Station</a>
        <a href="view_Approved_fuel_station.jsp" class="nav-item"><i class="fas fa-check-circle"></i> Approved Fuel Station</a>
        <a href="view_Disapproved_fuel_Station.jsp" class="nav-item"><i class="fas fa-times-circle"></i> Disapproved Fuel Station</a>
        <a href="View_user.jsp" class="nav-item"><i class="fas fa-users"></i> View Users</a>
        <a href="index.html" class="nav-item"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="content">
        <div class="main-content">
            <h1>Approved Fuel Stations: </h1>
            <table>
                <tr>
                    <th>Station Id</th>
                    <th>Station Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>City</th>
                    <th>Pincode</th>
                    <th>Petrol Qty</th>
                    <th>Petrol Rate</th>
                    <th>Diesel Qty</th>
                    <th>Diesel Rate</th>
                    <th>Status</th>
                </tr>
                <%
                    try {
                        Connection con = ConnectDB.dbcon();
                        PreparedStatement ps = con.prepareStatement("select * from fuelstation where fstatus=?");
                        ps.setString(1, "Approved");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(6) %></td>
                    <td><%= rs.getString(8) %></td>
                    <td><%= rs.getFloat(9) %></td>
                    <td><%= rs.getInt(10) %></td>
                    <td><%= rs.getFloat(11) %></td>
                    <td><%= rs.getInt(12) %></td>
                    <td><%= rs.getString(15) %></td>
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
