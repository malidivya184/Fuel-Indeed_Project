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
 * Servlet implementation class ManageBooking
 */
public class ManageBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageBooking() {
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
		
		 try {
	            String action = request.getParameter("action");
	            int bid = Integer.parseInt(request.getParameter("bid"));

	            Connection con =ConnectDB.dbcon();
	            PreparedStatement ps;

	            if ("assign".equalsIgnoreCase(action)) {
	                String dpid = request.getParameter("dpid");
	                ps = con.prepareStatement("update bookings set dpid = ?, status = 'assigned' where bid = ?");
	                ps.setString(1,dpid);
	                ps.setInt(2,bid);
	            } else if ("reject".equalsIgnoreCase(action)) {
	                ps = con.prepareStatement("update bookings set status = 'rejected' where bid = ?");
	                ps.setInt(1,bid);
	            } else {
	                throw new IllegalArgumentException("Invalid action: " + action);
	            }

	            ps.executeUpdate();
	            response.sendRedirect("User_pending_bookings.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.html");
	        }
	}

}
		
		
		
	