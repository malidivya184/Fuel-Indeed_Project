<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Assign Bookings</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: url('images/green-background.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
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
        color: #fff;
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
    .content {
        margin-left: 250px; /* Adjusted for the width of the sidebar */
        padding: 20px;
        width: calc(100% - 250px); /* Make sure content fits within remaining width */
        display: flex;
        flex-direction: column;
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
        font-size: 14px;
        transition: color 0.3s ease;
        display: flex;
        align-items: center;
    }
    .navbar a:hover {
        color: #4caf50;
    }
    .navbar .nav-item i {
        margin-right: 5px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4caf50;
        color: #fff;
    }
    tr:hover {
        background-color: #f1f1f1;
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
            <span><a href="admin_login.html" style="color: #fff;">Admin</a></span>
        </div>
        <div class="menu-item fuel-station">
            <span><a href="login_fuel_station.html" style="color: #fff;">Fuel Station</a></span>
        </div>
        <div class="menu-item delivery-person">
            <span><a href="delivery_person_login.html" style="color: #fff;">Delivery Person</a></span>
        </div>
        <div class="menu-item user">
            <span><a href="User_login.html" style="color: #fff;">User</a></span>
        </div>
    </div>
    <div class="navbar">
        <a href="View_user_fuelstation.jsp" class="nav-item"><i class="fas fa-gas-pump"></i> Fuel Stations</a>
        <a href="search_fuelstation.jsp" class="nav-item"><i class="fas fa-search"></i> Search Fuel Station</a>
        <a href="User_pending_bookings.jsp" class="nav-item"><i class="fas fa-clock"></i> Pending Status</a>
        <a href="User_Assign_Bookings.jsp" class="nav-item"><i class="fas fa-tasks"></i> Assign Bookings</a>
        <a href="View_User_Dilivered_Bookings.jsp" class="nav-item"><i class="fas fa-check-circle"></i> Delivered Bookings</a>
        <a href="View_User_Rejected_bookings.jsp" class="nav-item"><i class="fas fa-times-circle"></i> Rejected Bookings</a>
        <a href="User_ChangePassword.html" class="nav-item"><i class="fas fa-key"></i> Change Password</a>
        <a href="index.html" class="nav-item"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div><br><br>
    <div class="content">
        <h2>User Assign Bookings</h2>
        <table>
            <tr>
                <th>Booking Id</th>
                <th>User Id</th>
                <th>Station Id</th>
                <th>Delivery Person Id</th>
                <th>Fuel Type</th>
                <th>Quantity</th>
                <th>Total Bill</th>
                <th>Status</th>
                <th>Delivery Code</th>
            </tr>
            <%
                try {
                    Connection con = ConnectDB.dbcon();
                    PreparedStatement ps = con.prepareStatement("select * from bookings where status=? and uid=?");
                    ps.setString(1, "assigned");
                    ps.setInt(2, User.getUid());
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><%= rs.getInt(3) %></td>
                <td><%= rs.getInt(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getFloat(6) %></td>
                <td><%= rs.getFloat(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
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
