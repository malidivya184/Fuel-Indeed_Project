package fuel_indeed_services;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fuel_indeed_services.User;
import fuel_indeed_db.ConnectDB;

/**
 * Servlet implementation class User_login
 */
public class User_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_login() {
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
			
			String uemail=request.getParameter("uemail");
			String upassword=request.getParameter("upassword");
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("select * from user where uemail=? and upassword=?");
			ps.setString(1,uemail);
			ps.setString(2,upassword);
			ResultSet rs= ps.executeQuery();
		 if(rs.next())
		    {
			  User.setUid(rs.getInt(1));
		    	response.sendRedirect("user_Dashboard.html");
		    	
		    	
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
		
