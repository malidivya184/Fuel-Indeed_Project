<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.DeliveryPerson" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            background: url('images/background.jpg') no-repeat center center fixed; 
            background-size: cover; /* Ensures the background covers the whole screen */
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 128, 0, 0.4); /* Green overlay with 40% opacity */
            z-index: -1; /* Place the overlay behind the content */
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
            top: 0;
            left: 0;
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
          .dashboard .menu-item a {
            color: #fff; /* Ensure menu item links are white */
            text-decoration: none;
            width: 100%;
            display: flex;
            align-items: center;
        }
        .dashboard .menu-item i {
            margin-right: 10px;
        }
        .dashboard .menu-item span {
            font-size: 18px;
        }
        .dashboard .menu-item.admin::before {
            content: '\f406'; /* Font Awesome user icon */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
        }
        .dashboard .menu-item.fuel-station::before {
            content: '\f5b0'; /* Font Awesome gas pump icon */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
        }
        .dashboard .menu-item.delivery-person::before {
            content: '\f0d1'; /* Font Awesome truck icon */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
        }
        .dashboard .menu-item.user::before {
            content: '\f007'; /* Font Awesome user icon */
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
        }
        .menu-item span {
            position: relative;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            0% { opacity: 0; left: -10px; }
            100% { opacity: 1; left: 0; }
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
            font-size: 16px; /* Adjust font size for smaller text */
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
        .content {
            margin-left: 250px; /* Adjusted for the width of the sidebar */
            padding: 20px;
            width: calc(100% - 250px); /* Make sure content fits within remaining width */
            margin-top: 60px; /* Adjusted for the height of the navbar */
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .delivery-code-input {
            width: 100%;
            padding: 5px;
            margin-bottom: 5px;
        }
        button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="overlay"></div> <!-- Green overlay -->
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
    <div class="navbar">
        <a href="view_Assign_booking.jsp" class="nav-item"><i class="fas fa-clipboard-list"></i> View Assign Bookings</a>
        <a href="delivery_person_changepassword.html" class="nav-item"><i class="fas fa-key"></i> Change Password</a>
    </div>
    <div class="content">
        <h1>My Bookings</h1>
        <table>
            <tr>
                <th>Id</th>
                <th>UserId</th>
                <th>StationId</th>
                <th>Deliveryperson Id</th>
                <th>Fuel Type</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
            try {
                Connection con = ConnectDB.dbcon();
                PreparedStatement ps = con.prepareStatement("select * from bookings where status=? and dpid=?");
                ps.setString(1, "assigned");
                ps.setInt(2, DeliveryPerson.getDpid());
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
                <td><%= rs.getString(7) %></td>
                <td>
                    <form action="ChangeStatus1" method="post">
                        <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                        <input type="text" name="deliverycode" class="delivery-code-input" placeholder="Enter Delivery Code" required>
                        <button type="submit">Mark as Delivered</button>
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
