package controller;



import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Products;
import model.Registration;


@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
       Registration reg =new Registration(session);
       try {
    	   
    	    if (request.getParameter("login") != null) {
               String email = request.getParameter("email");
               String pass = request.getParameter("pw");
               String status = reg.login(email, pass);
               if (status.equals("success")) {

                   RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");

                   rd1.forward(request, response);

               } else if (status.equals("failure")) {
                   request.setAttribute("status", "Login failed");
                   RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                   rd1.forward(request, response);
               }
          }else if( request.getParameter("pid")!=null) {
  	    	int pid=Integer.parseInt(request.getParameter("pid"));
  	    	Products p=new Products();
  	    	p=reg.getProduct(pid);
  	    	if(p!=null) {
 	    		session.setAttribute("product", p);
  				RequestDispatcher rd1=request.getRequestDispatcher("ViewDetails.jsp");
  				rd1.forward(request, response);
  	    	}	
  	    }  
           else if (request.getParameter("logout") != null) {
               session.invalidate();
               RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");
               rd1.forward(request, response);
           }
       }catch (Exception e) {
           e.printStackTrace();
       }
       
       
       
       
    }
   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}