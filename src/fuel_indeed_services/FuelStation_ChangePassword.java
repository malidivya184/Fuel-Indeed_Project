package fuel_indeed_services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fuel_indeed_db.ConnectDB;

/**
 * Servlet implementation class FuelStation_ChangePassword
 */
public class FuelStation_ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuelStation_ChangePassword() {
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
		
		try
        {
        	String femail=request.getParameter("femail");
        	String fpassword=request.getParameter("fpassword");
        	String fuelstationpassword=request.getParameter("fuelstationpassword");
        	Connection con=ConnectDB.dbcon();
			PreparedStatement ps=con.prepareStatement("update fuelstation set fpassword=? where femail=?");
        	ps.setString(1,fuelstationpassword);
        	ps.setString(2,femail);
        	int i=ps.executeUpdate();
        	if(i>0)
        	{
        		response.sendRedirect("DoneChanePassword.html");
        	}else{
        		response.sendRedirect("error.html");
        	}
        }catch(Exception e)
        {
        	e.printStackTrace();
        }
    }
	

}

	
