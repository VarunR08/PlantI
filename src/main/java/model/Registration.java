package model;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class Registration {

    private Connection con;
    jakarta.servlet.http.HttpSession se;
    Products p=null;
    public Registration(jakarta.servlet.http.HttpSession session) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leafnow", "root", "tiger");
            // connection with data base
            se = session;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConnection() {
        return this.con;
    }

    public String login(String email, String pass) {
        String status1 = "", id = "";
        String name = "", emails = "";

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();

            rs = st.executeQuery("select * from users where mailid='" + email + "' and password='" + pass + "';");
            boolean b = rs.next();
            if (b == true) {
                id = rs.getString("id");
                name = rs.getString("name");
                emails = rs.getString("mailid");
                se.setAttribute("uname", name);
                se.setAttribute("email", emails);
                se.setAttribute("id", id);
                status1 = "success";
            } else {
                status1 = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status1;
    }

    
	public List<Products> getProducts() {
		ArrayList< Products> al=new ArrayList<Products>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from products ";
		
       
            try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				 while(rs.next())
		            {
		              p=new Products();
		              p.setPid(rs.getInt(1));
		              p.setP_name(rs.getString(2));
		              p.setPrice(rs.getLong(3));
		              p.setP_img(rs.getString(4));
		              p.setP_des(rs.getString(5));
		               al.add(p); 
		            }
		           
		            
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           
		return al;
		
	}
   
	public Products getProduct( int pid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from products where p_id=? ";
		
       
            try {
				ps=con.prepareStatement(query);
				ps.setInt(1, pid);
				rs=ps.executeQuery();
				 while(rs.next())
		            {
		              p=new Products();
		              p.setPid(rs.getInt(1));
		              p.setP_name(rs.getString(2));
		              p.setPrice(rs.getLong(3));
		              p.setP_img(rs.getString(4));
		              p.setP_des(rs.getString(5));
		                
		            }
		           
		            
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           
		return p;
		
	}

	public String addProduct(String pname, String url, String desp, String category, String subcategory, long price) {
		PreparedStatement ps=null;
        String query="INSERT INTO products VALUES(0,?,?,?,?,?,?)";
        int res=0;
        try
        {
            ps=con.prepareStatement(query);
            ps.setString(1, pname);
            ps.setLong(2,price);
            ps.setString(3,url);
            ps.setString(4,desp);
            ps.setString(5,category);
            ps.setString(6,subcategory);
            
            res=ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        if(res>0)
        {
            return "Success";
        }
        else {
            
            return "failure";
        }

	}
	
	
	public List<Products> searchProducts(String  productn)
	{
		ArrayList< Products> al=new ArrayList<Products>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM products WHERE p_name LIKE ?"; 
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,"%" +productn +"%");
			rs=ps.executeQuery();
			while(rs.next())
			{
				  p=new Products();
	              p.setPid(rs.getInt(1));
	              p.setP_name(rs.getString(2));
	              p.setPrice(rs.getLong(3));
	              p.setP_img(rs.getString(4));
	              p.setP_des(rs.getString(5));
	               al.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
		
	}

	public User getInfo() {
        Statement st = null;
        ResultSet rs = null;
        User u = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from users where id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                u = new User();
                u.setName(rs.getString("name"));
                u.setPhone(rs.getLong("phone"));
                u.setMailid(rs.getString("mailid"));
            } else {
                u = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
	
	 public String orderdetails(String order_address, String order_city, String order_state, double tcost) {
		 Statement st = null;
		 ResultSet rs = null;
	        String status = "", c_id = "";
	        int order_id = 0;
	        try {
	            
	            PreparedStatement ps;
	            st = (Statement) con.createStatement();
	       //     ps = (PreparedStatement) con.prepareStatement("INSERT INTO  `leafnow`.`order` VALUES (0, ?, ?, ?,  group_concat(c_id), ?, '" + se.getAttribute("uname") + "', 'ordered', now(), '" + se.getAttribute("id") + "');");
	            
	            ps = (PreparedStatement) con.prepareStatement("insert into `leafnow`.`order` select 0,?, ?, ?, group_concat(c_id)," + tcost + ",'" + se.getAttribute("uname") + "','ordered',now()," + se.getAttribute("id") + " from cart where uid= " + se.getAttribute("id") + " and status='pending';");

	            
	            ps.setString(1, order_address);
	            ps.setString(2, order_city);
	            ps.setString(3, order_state);
	          //  ps.setDouble(4, tcost);
	            int a = ps.executeUpdate();
	            if (a > 0) {
	                status = "success";
	            } else {
	                status = "failure";
	            }                                                                                          //last order of my id with status=ordered,
	            String qry1 = "select order_id,c_id from `leafnow`.`order` where uid=" + se.getAttribute("id") + " and status='ordered' order by order_id desc limit 1;";
	            rs = st.executeQuery(qry1);
	            while (rs.next()) {
	                order_id = rs.getInt("order_id");
	                c_id = rs.getString("c_id");
	            }
	            String qry = "update cart set status='ordered',order_id=" + order_id + " where c_id = " + c_id + " and uid=" + se.getAttribute("id") + " and status='pending';";
	            int b = st.executeUpdate(qry);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	   }
	 public int deleteorder(int oid) {
	        int status = 0;
	        try {
	            Statement st = null;
	            st = (Statement) con.createStatement();
	            String qry = "update `leafnow`.`order` set status='Canceled' where order_id=" + oid + ";";
	            status = st.executeUpdate(qry);
	            String qry1 = "update `leafnow`.`cart` set status='Canceled' where order_id=" + oid + ";";
	            status = st.executeUpdate(qry1);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	 public ArrayList<Order> getorderinfo() {
		   Statement st = null;
		   ResultSet rs = null;
	        ArrayList<Order> al = new ArrayList<Order>();
	        try {
	            st = con.createStatement();
	            String qry =" SELECT * FROM leafnow.order where uid=" + se.getAttribute("id") + ";";
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Order p = new Order();
	                p.setoid(rs.getInt("order_id"));
	                p.setc_cost(rs.getDouble("c_cost"));
	                p.setc_id(rs.getString("c_id"));
	                p.setstatus(rs.getString("status"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
 
	 public List<Products> ApplyFilter(String plantcat,String plantsubcat, double min,double max){
			ArrayList< Products> al=new ArrayList<Products>();
			PreparedStatement ps=null;
			ResultSet rs=null;
			String query="select * from products where p_category=? and p_subcategory=? and p_price between ? and ?"; 
			
			try {
				ps=con.prepareStatement(query);
				ps.setString(1, plantcat);
				ps.setString(2, plantsubcat);
				ps.setDouble(3, min);
				ps.setDouble(4, max);
				rs=ps.executeQuery();
				while(rs.next())
				{
					 p=new Products();
		              p.setPid(rs.getInt(1));
		              p.setP_name(rs.getString(2));
		              p.setPrice(rs.getLong(3));
		              p.setP_img(rs.getString(4));
		              p.setP_des(rs.getString(5));
		               al.add(p);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return al;
			
		}
	 
	 public ArrayList<Order> getorderinfocart(int oid) {
	    	Statement st = null;
			   ResultSet rs = null;
	        ArrayList<Order> al = new ArrayList<Order>();
	        try {
	            st = con.createStatement();
	            String qry = ("select *  from cart where uid=" + se.getAttribute("id") + " and order_id = " + oid + ";");
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Order p = new Order();
	                p.setoid(rs.getInt("order_id"));
                p.setc_cost(rs.getDouble("c_cost"));
	                p.setp_image(rs.getString("c_img"));
	                p.setc_name(rs.getString("c_name"));
	                p.setQuantity(rs.getString("quantity"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
	 
    
	 // sudarhsan
	 public boolean Review(String name,String review,String ratings) {
			PreparedStatement ps = null;
			String query = "INSERT INTO REVIEW VALUES (?,?,?)";
			int res;
			try {
				ps = con.prepareStatement(query);
				ps.setString(1, name);
				ps.setString(2, review);
				ps.setString(3, ratings);
				res = ps.executeUpdate();
				
				if(res>0) {
					return true;
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return false;
			
		}
	 
	 
	 //kavana
	 
	 public String addtocart(int p_id, int qty) {
		    String status = "";
		    try {
		        // Prepare the SQL query to fetch product details based on p_id
		        String fetchProductQuery = "SELECT p_name, p_price, p_img FROM products WHERE p_id = ?";
		        PreparedStatement pstFetch = con.prepareStatement(fetchProductQuery);
		        pstFetch.setInt(1, p_id);

		        ResultSet rs = pstFetch.executeQuery();

		        if (rs.next()) {
		            // Fetch product details
		            String productName = rs.getString("p_name");
		            double productPrice = rs.getDouble("p_price");
		            String productImage = rs.getString("p_img");

		            // Prepare SQL query to insert into the cart
		            String insertCartQuery = "INSERT INTO cart (c_name, c_cost, c_img, uid, status, quantity) VALUES (?, ?, ?, " + se.getAttribute("id") + ", ?, ?)";
		            PreparedStatement pstInsert = con.prepareStatement(insertCartQuery);

		            // Set values for the INSERT query
		            pstInsert.setString(1, productName);
		            pstInsert.setDouble(2, productPrice);
		            pstInsert.setString(3, productImage);
//		            pstInsert.setInt(4, (int) se.getAttribute("uid")); // Assuming session user ID
		            pstInsert.setString(4, "pending");
		            pstInsert.setInt(5, (qty));

		            int rowsAffected = pstInsert.executeUpdate();

		            if (rowsAffected > 0) {
		                status = "success";
		            } else {
		                status = "failed";
		            }
		        } else {
		            status = "product_not_found"; // Handle case where product does not exist
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        status = "error";
		    }
		    return status;
		}

		

	 
		 public int deletecart(int c_id) {
		        int status = 0;
		        try {
		            Statement st = null;
		            st = (Statement) con.createStatement();
		            String qry = "delete from  cart  where c_id='" + c_id + "'";
		            status = st.executeUpdate(qry);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return status;
		    }
		 public ArrayList<Cart> getcartinfo() {
			 Statement st = null;
			 ResultSet rs = null;
		        ArrayList<Cart> al = new ArrayList<Cart>();
		        try {
		            st = con.createStatement();
		            String qry = ("select *  from cart where uid=" + se.getAttribute("id") + " and status='pending';");
		            rs = st.executeQuery(qry);
		            while (rs.next()) {
		                Cart p = new Cart();
		                p.setC_id(rs.getInt("c_id"));
		                p.setC_img(rs.getString("c_img"));
		                p.setC_name(rs.getString("c_name"));
		                p.setC_cost(rs.getInt("c_cost"));
		                p.setQuantity(rs.getInt("quantity"));
		                al.add(p);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return al;
		    }

	 
}

