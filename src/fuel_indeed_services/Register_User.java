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
 * Servlet implementation class Register_User
 */
public class Register_User extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_User() {
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
			int uid=0;
			String uname=request.getParameter("uname");
			String ucity=request.getParameter("ucity");
			String ucontact=request.getParameter("ucontact");
			String uaddress=request.getParameter("uaddress");
			String upincode=request.getParameter("upincode");
			String uemail=request.getParameter("uemail");
			String upassword=request.getParameter("upassword");
			
		
			Connection con = ConnectDB.dbcon();
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
		    ps.setInt(1, uid);
		    ps.setString(2, uname);
		    ps.setString(3, ucity);
		    ps.setString(4, ucontact);
		    ps.setString(5, uaddress);
		    ps.setString(6, upincode);
		    ps.setString(7,uemail );
		    ps.setString(8, upassword);
		   
		    int i=ps.executeUpdate();
			  if(i>0)
			  {
				  response.sendRedirect("User_login.html");
			    	
				  
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


