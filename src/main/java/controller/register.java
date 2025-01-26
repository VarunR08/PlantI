package controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
          } 
    	  else if( request.getParameter("pid")!=null) {
    	  int pid=Integer.parseInt(request.getParameter("pid"));
    	  Products p=new Products();
    	  p=reg.getProduct(pid);
    	  if(p!=null) {
    	  	session.setAttribute("product", p);
    	  	RequestDispatcher rd1=request.getRequestDispatcher("ViewDetails.jsp");
    	  	rd1.forward(request, response);
    	  }	
    	  }else if( request.getParameter("book")!=null) {
        	  int pid=Integer.parseInt(request.getParameter("book"));
        	  Products p=new Products();
        	  p=reg.getProduct(pid);

        	  if(p!=null) {
        	  	session.setAttribute("Book", p);
 
        	  	RequestDispatcher rd1=request.getRequestDispatcher("Book.jsp");
        	  	rd1.forward(request, response);
        	  }	
        	  }
    	  
    	  else if(request.getParameter("addproduct")!=null){
    		  String pname= request.getParameter("pname");
    		  long price=Long.parseLong(request.getParameter("price"));
    		  String url=request.getParameter("url");
    		  String desp=request.getParameter("desp");
    		  String category=request.getParameter("plantCategory");
    		  String subcategory=request.getParameter("plantsubCategory");
    		  String status=reg.addProduct(pname,url,desp,category,subcategory,price);
    		  
    		  if (status.equals("success")) {
    			  request.setAttribute("status", "Product Added Successfully");
                  RequestDispatcher rd1 = request.getRequestDispatcher("AddProduct.jsp");
                  rd1.forward(request, response);

              } else if (status.equals("failure")) {
                  request.setAttribute("Status", "failed to add");
                  RequestDispatcher rd1 = request.getRequestDispatcher("AddProduct.jsp");
                  rd1.forward(request, response);
              }
    		  
    	  }
    	    
    	  else  if(request.getParameter("filter") !=null) {
  	    	
  	    	String plantcat =request.getParameter("plantCategory");
  	    	String plantsubcat=request.getParameter("plantsubCategory");
  	    	double min=Double.parseDouble(request.getParameter("min"));
  	    	double max=Double.parseDouble(request.getParameter("max"));
  	    
  	    	
  	    
  	    	
  	    	List<Products> Filter=reg.ApplyFilter(plantcat, plantsubcat, min, max);
  	    	if(Filter!=null) {
    	    		session.setAttribute("filter1", Filter);
    	    		 RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");
    	    		 rd1.forward(request, response);
    	    	}
  	    	
  	    	
  	    }
    	    
    	    
    	  else if(request.getParameter("productname") != null)
      	    {
      	    	String productn=request.getParameter("productname");
      	    	List<Products> statues=reg.searchProducts(productn);
      	    	if(statues!=null) {
      	    		session.setAttribute("products", statues);
      	    		 RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");
      	    		 rd1.forward(request, response);
      	    	}
      	    	}
    	    
               else if (request.getParameter("logout") != null) {
                   session.invalidate();
                   RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");
                   rd1.forward(request, response);
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








