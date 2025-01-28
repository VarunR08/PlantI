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

               } else if (status.equals("admin")) {
                   RequestDispatcher rd1 = request.getRequestDispatcher("Dealerdashboard.jsp");
                   rd1.forward(request, response);
               }
               else if (status.equals("failure")) {
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
    		  
    		  if (status.equals("Success")) {
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
    	    
    	  else if(request.getParameter("dsubmit") !=null)
          {
       	   String name=request.getParameter("name");
				String phone=request.getParameter("phone");
				String email=request.getParameter("email");
				String address=request.getParameter("address");
				String pancard=request.getParameter("pan");
				String sname=request.getParameter("store");
				String cat=request.getParameter("plantCategory");
				String scat=request.getParameter("plantsubCategory");
				String gst=request.getParameter("gst");
				String password=request.getParameter("password");
				String confirm=request.getParameter("confirm");
				
				if(password.equals(confirm)) {
					
					String status=reg.dsignup(name, phone, email, address, pancard, sname, cat, scat, gst, password);
					if(status.equals("existed")) {
						request.setAttribute("status", "Existed Record");
						RequestDispatcher rd1=request.getRequestDispatcher("Dealersignup.jsp");
						rd1.forward(request, response);
					}
					else if(status.equals("success")) {
						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					}
					else if(status.equals("failure")) {
						request.setAttribute("status", "Registration Failed");
						RequestDispatcher rd = request.getRequestDispatcher("Dealersignup.jsp");
						rd.forward(request, response);
					}
				}
          }
    	  else if(request.getParameter("dlsubmit") !=null) {
    		  
  			String email=request.getParameter("email");
  			String password=request.getParameter("password");
  			String status = reg.dlogin(email, password);
              if (status.equals("success")) {

                  RequestDispatcher rd1 = request.getRequestDispatcher("dashboard.jsp");

                  rd1.forward(request, response);

              } else if (status.equals("failure")) {
                  request.setAttribute("status", "Login failed");
                  RequestDispatcher rd1 = request.getRequestDispatcher("Dealerlogin.jsp");
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
      	    	}else if(request.getParameter("csignup")!=null)
        	    {
        	    	String name=request.getParameter("name");
    				String phone=request.getParameter("phone");
    				String address=request.getParameter("address");
    				String email=request.getParameter("email");
    				String password=request.getParameter("password");
    				String cpass=request.getParameter("cpass");
    				
    				if(password.equals(cpass)) {
    					String status = reg.Signup(name, phone, address, email, password);
    					if(status.equals("existed")) {
    						request.setAttribute("status", "Existed Record");
    						RequestDispatcher rd1=request.getRequestDispatcher("Signup.jsp");
    						rd1.forward(request, response);
    					}
    					else if(status.equals("success")) {
    						request.setAttribute("status", "Successfully Registered");
    						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    						rd.forward(request, response);
    					}
    					else if(status.equals("failure")) {
    						request.setAttribute("status", "Registration Failed");
    						RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
    						rd.forward(request, response);
    					}
    				}
        	    }
    	    
               else if (request.getParameter("logout") != null) {
                   session.invalidate();
                   RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                   rd1.forward(request, response);
               }
           else if (request.getParameter("logout") != null) {
               session.invalidate();
               RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
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








