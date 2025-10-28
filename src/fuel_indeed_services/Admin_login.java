package fuel_indeed_services;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fuel_indeed_db.ConnectDB;

/**
 * Servlet implementation class Admin_login
 */
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_login() {
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
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
try{
			
			String aemail=request.getParameter("aemail");
			String apassword=request.getParameter("apassword");
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("Select * from admin where aemail=? and apassword=?");
			ps.setString(1,aemail);
			ps.setString(2,apassword);
			ResultSet rs= ps.executeQuery();
		 if(rs.next())
		    {
		    	
		    	response.sendRedirect("loginDashboard.html");
		    	
		    	
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
		
		