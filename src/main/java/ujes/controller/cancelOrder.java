package oracle.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.db.ConnectionManager;

/**
 * Servlet implementation class cancelOrder
 */
@WebServlet("/cancelOrder")
public class cancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int odID = Integer.parseInt(request.getParameter("odID"));
		
		
		try {
			Connection con = ConnectionManager.getConnection();
			 ResultSet rs = null; 
			PreparedStatement ps=null;
			Statement stmt=null;
			
			ps = con.prepareStatement("DELETE FROM OrderProduct WHERE odID=?");
			ps.setInt(1, odID);
			
			
				
			//4. execute query
			ps.executeUpdate();
			System.out.println("Data is Successfully remove from Customer Order Table");
			
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
			 
	response.sendRedirect("listProductB.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
