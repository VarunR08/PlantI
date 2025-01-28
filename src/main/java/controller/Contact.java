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

@WebServlet("/contact")
public class Contact extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("submit")!=null) {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String message = req.getParameter("message");
			
			HttpSession session = req.getSession();
			Registration reg = new Registration(session);
			
			if(name!=null || email!=null || message!=null) {
				boolean result = reg.insertContact(name, email, message);
				
				if(true) {
					req.setAttribute("status", "Feedback submitted");
					RequestDispatcher rd = req.getRequestDispatcher("contact.jsp");
					rd.forward(req, resp);
				}else {
					req.setAttribute("fail", "Failed to submit");
					RequestDispatcher rd = req.getRequestDispatcher("contact.jsp");
					rd.forward(req, resp);
				}
			}else {
				System.out.println("Input mismatch");
			}
		}else {
				System.out.println("Something went wrong please try again later....");
		}
	}
}