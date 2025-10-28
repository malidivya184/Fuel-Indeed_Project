package fuel_indeed_services;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fuel_indeed_services.Station;

import fuel_indeed_db.ConnectDB;

/**
 * Servlet implementation class Fuel_Staion_login
 */
public class Fuel_Staion_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String stationid;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fuel_Staion_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				response.getWriter().append("Served at: ").append(request.getContextPath());
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
				
		try{
					int stationid=0;
					String femail=request.getParameter("femail");
					String fpassword=request.getParameter("fpassword");
					
					Connection con=ConnectDB.dbcon();
					
					PreparedStatement ps=con.prepareStatement("Select * from fuelstation where femail=? and fpassword=?");
					ps.setString(1,femail);
					ps.setString(2,fpassword);
					ResultSet rs= ps.executeQuery();
					
				  if(rs.next())
				    {
					     Station.setStationid(rs.getInt(1));
					     Station.setFemail(femail);
				    	response.sendRedirect("fuel_station_Dashboard.html");
				    	
				    	
				    }else
				    {
				    	response.sendRedirect("error.html");
				    }
				    	
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				
			}

		
		
	}


