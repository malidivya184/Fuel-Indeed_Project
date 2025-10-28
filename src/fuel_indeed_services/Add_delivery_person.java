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
 * Servlet implementation class Add_delivery_person
 */
public class Add_delivery_person extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_delivery_person() {
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
	       int dpid=0;
	       int stationid=Station.getStationid();
			String dname=request.getParameter("dname");
			String  dcity=request.getParameter("dcity");
			String  dcontact=request.getParameter("dcontact");
			String  daddress=request.getParameter("daddress");
			String  dpincode=request.getParameter("dpincode");
			String  demail=request.getParameter("demail");
			String  dpassword=request.getParameter("dpassword");
			Connection con=ConnectDB.dbcon();
			PreparedStatement ps=con.prepareStatement("insert into deliveryperson values(?,?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, dpid);
			ps.setInt(2, stationid);
			ps.setString(3,dname);
			ps.setString(4,dcity);
			ps.setString(5,dcontact);
			ps.setString(6,daddress);
			ps.setString(7,dpincode);
			ps.setString(8,demail);
			ps.setString(9,dpassword);
			int rs= ps.executeUpdate();
		 if(rs>0)
		    {
		    	
		    	response.sendRedirect("add_delivery_person.html");
		    	
		    	
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
		
		
		
	