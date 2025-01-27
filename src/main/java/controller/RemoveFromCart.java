package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Registration;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class RemoveFromCart
 */
@WebServlet(name = "RemoveFromCart", urlPatterns = {"/removefromcart"})
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCart() {
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
		String productId = request.getParameter("cid");
        HttpSession session = request.getSession();
        
        Registration reg = new Registration(session);
        int c=Integer.parseInt(productId);
        int status = reg.deletecart(c);

        // Retrieve the cart from session
        @SuppressWarnings("unchecked")
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

        if (cartList != null && productId != null) {
            // Find and remove the product from the cart
            cartList.removeIf(item -> Integer.toString(item.getC_id()).equals(productId));
           
            session.setAttribute("cartList", cartList);
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
	}



