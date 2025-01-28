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

@WebServlet("/ForgotPassword")

public class Forgot extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Registration reg = new Registration(session);
		
		if(req.getParameter("forgotPass")!=null) {
			String email = req.getParameter("email");
			String pw= req.getParameter("pw");
			String cpw = req.getParameter("cpw");
			System.out.println(email);
			System.out.println(pw);
			System.out.println(cpw);
			
			if(pw.equals(cpw)) {
				boolean result =reg.ForgotPassword(email, pw);
				
				if(true) {
					req.setAttribute("changed", "Password Reset Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}else {
					req.setAttribute("unchange", "Password Reset Failed");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				
			}
			
		}
	}

}