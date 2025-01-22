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

    
 
    
}

