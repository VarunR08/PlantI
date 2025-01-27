package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Registration;

@WebServlet("/submitreview")
public class Review extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("submit")!= null) {
			/* int pid = Integer.parseInt(req.getParameter("p_id")); */
			String pname = req.getParameter("username");
			String review =req.getParameter("review");
			String rating = req.getParameter("rating");
			
			if(pname!=null ||review!=null ||rating !=null) {
				
			
				HttpSession session = req.getSession();
				
				Registration reg = new Registration(session);
				boolean result =reg.Review( pname, review, rating);
					if(true) {
						req.setAttribute("status", "Review Updated successfully");
					}else {
						req.setAttribute("status", "Failed to update your review!!Please try again...");
					}
			}else {
				req.setAttribute("status", "Invalid rating. Please select a valid star rating.");
			}
		}else {
			req.setAttribute("status", "Please fill out all the details...");
		}	
			RequestDispatcher rd = req.getRequestDispatcher("Aboutus.jsp");
			rd.forward(req, resp);
	}

}
