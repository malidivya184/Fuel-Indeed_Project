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
 * Servlet implementation class Delivery_person_login
 */
public class Delivery_person_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delivery_person_login() {
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
			
			String demail=request.getParameter("demail");
			String dpassword=request.getParameter("dpassword");
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("Select * from deliveryperson where demail=? and dpassword=?");
			ps.setString(1,demail);
			ps.setString(2,dpassword);
			ResultSet rs= ps.executeQuery();
		 if(rs.next())
		    {
			 DeliveryPerson.setDpid(rs.getInt(1));
			 //User.setUid(rs.getInt(1));
		    	response.sendRedirect("delivery_person_dashboard.html");
		    	
		    	
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
		