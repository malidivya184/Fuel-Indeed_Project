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
    <title>Pending Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background-color: #f5f5f5;
        }
        .dashboard {
            width: 250px;
            background-color: #333;
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
        }
        .dashboard .sidebar_user_info {
            text-align: center;
            margin-bottom: 20px;
            padding: 20px 0;
            border-bottom: 1px solid #575757;
        }
        .dashboard .sidebar_user_info .user_img img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #fff;
        }
        .dashboard .sidebar_user_info .user_info h6,
        .dashboard .sidebar_user_info .user_info p {
            margin: 0;
        }
        .dashboard .sidebar_user_info .user_info .online_animation {
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
        }
        .dashboard .menu-item a:hover {
            color: #4caf50;
        }
        .navbar {
            background-color: #000;
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
            color: #4caf50;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            margin-top: 60px;
            flex: 1;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #000;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions form {
            display: inline;
        }
        .actions input[type="text"] {
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 5px;
        }
        .actions button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            color: #fff;
            background-color: #4caf50;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .actions button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="sidebar_user_info">
            <div class="user_img">
                    <img class="img-responsive" src="./images/image1.png" alt="User Image">
                </div>
              <div class="user_info"><br>
                    <h6>Fuel Booking Platform</h6><br>
                    <p><span class="online_animation"></span> Online</p>
                </div>
        </div>
       
        <div class="menu-item">
            <i class="fas fa-cogs"></i><a href="admin_login.html">Admin</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-gas-pump"></i><a href="login_fuel_station.html">Fuel Station</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-truck"></i><a href="delivery_person_login.html">Delivery Person</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-user"></i><a href="User_login.html">User</a>
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
        <h1>Pending Bookings</h1>
        <table>
            <tr>
                <th>Id</th>
                <th>UserId</th>
                <th>StationId</th>
                <th>Deliveryperson Id</th>
                <th>Fuel Type</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <% 
            try {
                Connection con = ConnectDB.dbcon();
                PreparedStatement ps = con.prepareStatement("select * from bookings where status=? and stationid=?");
                ps.setString(1, "pending");
                ps.setInt(2, Station.getStationid());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(8) %></td>
                <td class="actions">
                    <form action="ManageBooking" method="post" style="display:inline;">
                        <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                        <input type="hidden" name="action" value="assign">
                        <input type="text" name="dpid" placeholder="Deliveryperson ID">
                        <button type="submit">Assign</button>
                    </form>
                    <form action="ManageBooking" method="post" style="display:inline;">
                        <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                        <input type="hidden" name="action" value="reject">
                        <button type="submit">Reject</button>
                    </form>
                </td>
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
