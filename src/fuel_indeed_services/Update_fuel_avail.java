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
 * Servlet implementation class Update_fuel_avail
 */
public class Update_fuel_avail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_fuel_avail() {
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
			String femail=Station.getFemail();

			String fpetrolqty=request.getParameter("fpetrolqty");
			String  fdieselqty=request.getParameter("fdieselqty");
			
			System.out.println(femail);
			System.out.println(fpetrolqty);
			System.out.println(fdieselqty);
			
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("update fuelstation set fpetrolqty=?, fdieselqty=? where femail=?");
			ps.setString(1,fpetrolqty);
			ps.setString(2,fdieselqty);
			ps.setString(3,femail);
			int rs= ps.executeUpdate();
			
		  if(rs>0)
		    {
		    	response.sendRedirect("view_fuelstation.jsp");
		    	
		    	
		    }else
		    {
		    	response.sendRedirect("error.html");
		    }
			
			
		}
		catch(Exception e)
		{
		e.printStackTrace();
		
		
	}

}
}
