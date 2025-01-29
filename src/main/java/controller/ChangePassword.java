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

@WebServlet("/changePass")

public class ChangePassword extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("submit")!=null) {
		String email =req.getParameter("email");
		String oldp = req.getParameter("opw");
		String newp = 	req.getParameter("npw");
		
		HttpSession session = req.getSession();
		Registration reg = new Registration(session);
		
		if(oldp.equals(newp)) {
			
			String s = reg.getPassword(email, oldp);
			if(s.equals("success") && oldp.equals(newp)) {
				req.setAttribute("status", "Old password and new password are same");
				RequestDispatcher rd = req.getRequestDispatcher("changePassword.jsp");
				rd.forward(req, resp);
			}
			}
		else {
				boolean cpwd = reg.ForgotPassword(email, newp);
				if(true) {
					req.setAttribute("pwdchanged", "Password changed");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
					
				}else {
					req.setAttribute("pwunchanged", "Password changed");
					RequestDispatcher rd = req.getRequestDispatcher("changePassword.jsp");
					rd.forward(req, resp);
				}
				
			}
			
			
			
		}
	}

}
