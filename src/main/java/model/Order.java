package model;

public class Order {
	 int oid;
	    String c_id;
	    String status;
	    String p_image;
	    String c_name;
	    double c_cost;
	    String quantity;
	    String address;
	    String state;
	    String city;
	    


		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getp_image() {
	        return p_image;
	    }

	    public String getQuantity() {
			return quantity;
		}

		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}

		public String getstatus() {
	        return status;
	    }

	    public double getc_cost() {
	        return c_cost;
	    }

	    public int getoid() {
	        return oid;
	    }
	        public String getc_id() {
	        return c_id;
	    }
	         public String getc_name() {
	        return c_name;
	    }

	    public void setoid(int oid) {
	        this.oid = oid;
	    }
	        public void setc_id(String c_id) {
	        this.c_id = c_id;
	    }
	         public void setstatus(String status) {
	        this.status = status;
	    }

	    public void setp_image(String p_image) {
	        this.p_image = p_image;
	    }

	    public void setc_name(String c_name) {
	        this.c_name = c_name;
	    }

	    public void setc_cost(double c_cost) {
	        this.c_cost = c_cost;
	    }
}
