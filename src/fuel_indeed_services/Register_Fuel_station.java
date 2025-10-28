package fuel_indeed_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fuel_indeed_db.ConnectDB;

/**
 * Servlet implementation class Register_Fuel_station
 */
public class Register_Fuel_station extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_Fuel_station() {
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
				int stationid=0;
				String fname=request.getParameter("fname");
				String fcontact=request.getParameter("fcontact");
				String femail=request.getParameter("femail");
				String fpassword=request.getParameter("fpassword");
				String fcity=request.getParameter("fcity");
				String faddress=request.getParameter("faddress");
				String fpincode=request.getParameter("fpincode");
				String fpetrolqty=request.getParameter("fpetrolqty");
				String   fpetrolrate=request.getParameter("fpetrolrate");
				String fdieselqty=request.getParameter("fdieselqty");
				String fdieselrate=request.getParameter("fdieselrate");
				String fopentime=request.getParameter("fopentime");
				String fclosetime=request.getParameter("fclosetime");
				String fstatus="Pending";
				
				Connection con = ConnectDB.dbcon();
				PreparedStatement ps=con.prepareStatement("insert into fuelstation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			    ps.setInt(1, stationid);
			    ps.setString(2, fname);
			    ps.setString(3, fcontact);
			    ps.setString(4, femail);
			    ps.setString(5, fpassword);
			    ps.setString(6, fcity);
			    ps.setString(7,faddress );
			    ps.setString(8, fpincode);
			    ps.setFloat(9,Float.parseFloat(fpetrolqty) );
			    ps.setInt(10, Integer.parseInt(fpetrolrate));
			    ps.setFloat(11,Float.parseFloat(fdieselqty) );
			    ps.setInt(12,Integer.parseInt(fdieselrate ));
			    ps.setString(13,fopentime );
			    ps.setString(14, fclosetime);
			    ps.setString(15,fstatus);
			
			    int i=ps.executeUpdate();
				  if(i>0)
				  {
					     
				    	response.sendRedirect("login_fuel_station.html");
					  
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

