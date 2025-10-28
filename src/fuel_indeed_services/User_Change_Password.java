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
 * Servlet implementation class User_Change_Password
 */
public class User_Change_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Change_Password() {
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
        	String uemail=request.getParameter("uemail");
        	System.out.println(uemail);
        	String upassword=request.getParameter("upassword");
        	System.out.println(upassword);
        	String Userpassword=request.getParameter("Userpassword");
        	System.out.println(Userpassword);
        	Connection con=ConnectDB.dbcon();
			PreparedStatement ps=con.prepareStatement("update user set upassword=? where uemail=?");
        	ps.setString(1,Userpassword);
        	ps.setString(2,uemail);
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

