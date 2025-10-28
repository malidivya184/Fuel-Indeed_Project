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
 * Servlet implementation class Delivery_person_changepassword
 */
public class Delivery_person_changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delivery_person_changepassword() {
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
        	String demail=request.getParameter("demail");
        	String dpassword=request.getParameter("dpassword");
        	String deliverypersonpassword=request.getParameter("deliverypersonpassword");
        	Connection con=ConnectDB.dbcon();
			PreparedStatement ps=con.prepareStatement("update deliveryperson set dpassword=? where demail=?");
        	ps.setString(1,deliverypersonpassword);
        	ps.setString(2,demail);
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


