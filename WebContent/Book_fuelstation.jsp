<%@page import="java.sql.*"%>
<%@page import="fuel_indeed_db.*"%>
<%@page import="fuel_indeed_services.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Fuel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
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
        .content {
            margin-left: 250px; /* Adjusted for the width of the sidebar */
            padding: 20px;
            width: calc(100% - 250px); /* Make sure content fits within remaining width */
            margin-top: 60px; /* Added space for the navbar */
        }
        .form-container {
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
            margin: auto;
        }
        .form-container h4 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container select,
        .form-container input[type="number"],
        .form-container button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-container button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-container button:hover {
            background-color: #45a049;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
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
    <div class="navbar">
        <a href="View_user_fuelstation.jsp" class="nav-item"><i class="fas fa-gas-pump"></i> Fuel Stations</a>
        <a href="search_fuelstation.jsp" class="nav-item"><i class="fas fa-search"></i> Search Fuel Station</a>
        <a href="User_pending_bookings.jsp" class="nav-item"><i class="fas fa-clock"></i> Pending Status</a>
        <a href="User_Assign_Bookings.jsp" class="nav-item"><i class="fas fa-tasks"></i> Assign Bookings</a>
        <a href="View_User_Dilivered_Bookings.jsp" class="nav-item"><i class="fas fa-check-circle"></i> Delivered Bookings</a>
        <a href="View_User_Rejected_bookings.jsp" class="nav-item"><i class="fas fa-times-circle"></i> Rejected Bookings</a>
        <a href="User_ChangePassword.html" class="nav-item"><i class="fas fa-key"></i> Change Password</a>
    </div>
    <div class="content">
        <div class="form-container">
            <h4>Book Fuel:</h4>
            <form action="Bookfuel.jsp" method="post">
                <%
                    int stationid = 0;
                    String stationidParam = request.getParameter("stationid");
                    if (stationidParam != null && !stationidParam.trim().isEmpty()) {
                        stationid = Integer.parseInt(stationidParam);
                    }
                %>
                <input type="hidden" name="stationid" value="<%= stationid %>">
                <input type="hidden" name="uid" value="<%=User.getUid() %>">
                <label for="fueltype">Select Fuel Type:</label>
                <select id="fueltype" name="fueltype" required>
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                </select>
                <label for="quantity">Quantity (in Litres):</label>
                <input type="number" id="quantity" name="quantity" min="1" required>
                <button type="submit">Book</button>
            </form>
            <a href="view_fuelstation.jsp" class="back-link">Back to Fuel Stations</a>
        </div>
    </div>
</body>
</html>
