package model;




public class Cart {
    private int c_id;        // Cart Item ID (primary key in the cart table)
    private String userId;   // User ID to associate the cart with a user (assuming session management)
    private String c_name;   // Product name
    private String c_img;    // Product image URL or path
    private int c_cost;      // Cost of the product (price)
    private int quantity;    // Quantity of the product added to the cart

    // Default constructor
    public Cart() {}

    // Getter and Setter methods

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_img() {
        return c_img;
    }

    public void setC_img(String c_img) {
        this.c_img = c_img;
    }

    public int getC_cost() {
        return c_cost;
    }

    public void setC_cost(int c_cost) {
        this.c_cost = c_cost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
