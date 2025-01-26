package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import model.Cart;
import model.Registration;

@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session1 = request.getSession();
        Registration reg = new Registration(session1);
        String p_id = request.getParameter("p_id");
        String qty = request.getParameter("qty");
        int pid=Integer.parseInt(p_id);
        int q=Integer.parseInt(qty);
        String status = reg.addtocart(pid,q);
        if (p_id == null || p_id.isEmpty() || qty == null || qty.isEmpty()) {
            response.getWriter().println("<h3>Error: Product ID or quantity is missing!</h3>");
            return;
        }

        HttpSession session = request.getSession(false); 
        if (session == null || session.getAttribute("id") == null) {
            response.getWriter().println("<h3>Error: User is not logged in or session attributes are missing!</h3>");
            return;
        }

        try {
            Registration registration = new Registration(session);
            int userId = Integer.parseInt(session.getAttribute("id").toString());
            
            String sql = "SELECT p_name, p_price, p_img FROM products WHERE p_id = ?";
            try (PreparedStatement ps = registration.getConnection().prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(p_id));
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String productName = rs.getString("p_name");
                    int productCost = rs.getInt("p_price");
                    String productImage = rs.getString("p_img");

                    @SuppressWarnings("unchecked")
                    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
                    if (cartList == null) {
                        cartList = new ArrayList<>();
                    }

                    boolean productExists = false;
                    for (Cart cartItem : cartList) {
                        if (cartItem.getC_id() == Integer.parseInt(p_id)) {
                            cartItem.setQuantity(cartItem.getQuantity() + Integer.parseInt(qty));
                            productExists = true;
                            break;
                        }
                    }

                    if (!productExists) {
                        Cart newCartItem = new Cart();
                        newCartItem.setC_id(Integer.parseInt(p_id));
                        newCartItem.setQuantity(Integer.parseInt(qty));
                        newCartItem.setC_name(productName);
                        newCartItem.setC_cost(productCost);
                        newCartItem.setC_img(productImage);
                        cartList.add(newCartItem);
                    }

                    session.setAttribute("cartList", cartList);
                } else {
                    response.getWriter().println("<h3>Error: Product not found!</h3>");
                    return;
                }
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.getWriter().println("<h3>Error: Invalid data format!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: Something went wrong!</h3>");
        }
    }
}
