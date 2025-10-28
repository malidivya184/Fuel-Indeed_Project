<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.Station" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Persons</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background-color: #e0f7fa;
        }
        .navbar {
            background-color: #000000; /* Black color */
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
            transition: color 0.3s;
        }
        .navbar a:hover {
            color: #c1c1c1;
        }
        .dashboard {
            width: 250px;
            background-color: #333;
            color: #fff;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .dashboard .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .dashboard .logo img {
            width: 80%;
            max-width: 200px;
        }
        .dashboard .menu-item {
            padding: 15px;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: background-color 0.3s;
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
            display: block;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            margin-top: 60px;
            flex: 1;
        }
        h1 {
            color: #00796b;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #000000; /* Black color */
            color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }
        th {
            background-color: #333; /* Darker shade for table header */
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #444; /* Slightly lighter black */
        }
        tr:hover {
            background-color: #555; /* Hover effect for table rows */
        }
        a {
            color: #00796b;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            color: #004d40;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
        <div class="menu-item">
            <i class="fas fa-home"></i>
            <a href="admin_login.html">Admin</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-building"></i>
            <a href="login_fuel_station.html">Fuel Station</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-truck"></i>
            <a href="delivery_person_login.html">Delivery Person</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-user"></i>
            <a href="User_login.html">User</a>
        </div>
    </div>

    <div class="navbar">
        <a href="Update_fuel_update.html"><i class="fas fa-gas-pump"></i> Update Fuel Availability</a>
        <a href="update_fuel_rate.html"><i class="fas fa-dollar-sign"></i> Update Fuel Rates</a>
        <a href="delivery_person.html"><i class="fas fa-truck"></i> Delivery Person</a>
        <a href="pending_bookings.jsp"><i class="fas fa-clock"></i> Pending Bookings</a>
        <a href="Fuel_Station_Assign_Bookings.jsp"><i class="fas fa-calendar-day"></i> Assign Bookings</a>
        <a href="View_Fuelstation_Delivered_Bookings.jsp"><i class="fas fa-check-circle"></i> Delivered Bookings</a>
        <a href="View_Rejected_Bookings.jsp"><i class="fas fa-times-circle"></i> Rejected Bookings</a>
        <a href="Fuelstation_changepassword.html"><i class="fas fa-key"></i> Change Password</a>
        <a href="index.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <h1>Delivery Persons</h1>
        <table>
            <tr>
                <th>Person Id</th>
                <th>Station Id</th>
                <th>Name</th>
                <th>City</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Pincode</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
            </tr>
            <% 
            try {
                Connection con = ConnectDB.dbcon();
                PreparedStatement ps = con.prepareStatement("select * from deliveryperson where stationid=?");
                ps.setInt(1, Station.getStationid());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
                <td><a href="deliveryperson_delete.jsp?dpid=<%= rs.getInt(1) %>">Delete</a></td>
            </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
</body>
</html>
