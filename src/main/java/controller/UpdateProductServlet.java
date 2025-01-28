package controller;




import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Registration;

import java.io.IOException;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID and new cost from the form
        int productId = Integer.parseInt(request.getParameter("p_id"));
        double newCost = Double.parseDouble(request.getParameter("p_cost"));
        
        // Get the Registration object from the session
        Registration registration = new Registration(request.getSession());
        
        // Call the method to update the product price
        boolean success = registration.updateProductCost(productId, newCost);
        
        if (success) {
            // Redirect to the dashboard or show a success message
            response.sendRedirect("Manage.jsp");
        } else {
            // Handle failure (maybe show an error message)
            request.setAttribute("error", "Failed to update product price.");
            request.getRequestDispatcher("Manage.jsp").forward(request, response);
        }
    }
}


