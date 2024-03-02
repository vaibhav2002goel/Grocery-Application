package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import com.mysql.cj.conf.ConnectionUrlParser.Pair;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DoPayment")
public class BuyerProductPayment extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Payment Buyer Page****************");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			String username = req.getParameter("username");
			
			String query1 = "select * from CART where BuyerUsername=?";
			
			PreparedStatement st1 = con.prepareStatement(query1);
			st1.setString(1, username);
			
			ResultSet rs1 = st1.executeQuery();
			
	        HashMap<Pair<String, String>, Integer> map1 = new HashMap<>();
	        HashMap<String,String> map1_temp = new HashMap<>();
	        
	        while(rs1.next()) {
	        	Pair<String,String> p1 = new Pair<String,String>(rs1.getString("ProductName"),rs1.getString("ProductCategory"));
	        	
	        	map1_temp.put(rs1.getString("ProductName"), rs1.getString("ProductCategory"));
	        	map1.put(p1, rs1.getInt("ProductQuantity"));
	        }
	        
	        
	        
	        String query2 = "select * from REPOSITORY where ProductName=? AND ProductCategory=?";
	        PreparedStatement st2 = con.prepareStatement(query2);
	        HashMap<Pair<String, String>, Integer> map2 = new HashMap<>();
	        
	        for(Map.Entry<String,String> e : map1_temp.entrySet()) {
	        	st2.setString(1,e.getKey());
	        	st2.setString(2,e.getValue());
	        	
	        	Pair<String,String> p2 = new Pair<String,String>(e.getKey(),e.getValue());
	        	
	        	ResultSet rs2 = st2.executeQuery();
	        	
	        	rs2.next();
	        	
	        	map2.put(p2, rs2.getInt("ProductQuantity"));
	        }
	        
	        
	        
	        
	        
	        System.out.println("There");
	        
	        for(Map.Entry<String,String> e : map1_temp.entrySet()) {
	        	System.out.println("KEY : "+e.getKey()+" VALUE : "+e.getValue());
	        }
	        System.out.println();
	        
	        
	        for(Map.Entry<Pair<String,String>,Integer> e : map1.entrySet()) {
	        	System.out.println("KEY : "+e.getKey()+" VALUE : "+e.getValue());
	        }
	        System.out.println();
	        
	        
	        for(Map.Entry<Pair<String,String>,Integer> e : map2.entrySet()) {
	        	System.out.println("KEY : "+e.getKey()+" VALUE : "+e.getValue());
	        }
	        
	        String query3 = "update REPOSITORY set ProductQuantity=? where ProductName=? AND ProductCategory=?";
	        PreparedStatement st3 = con.prepareStatement(query3);
	        
	        for(Map.Entry<String,String> e : map1_temp.entrySet()) {
	        	
	        	int userQuantity = 0;
	        	int repositoryQuantity = 0;
	        	
	        	String str1 = e.getKey();
	        	String str2 = e.getValue();
	        	
	        	for(Map.Entry<Pair<String,String>,Integer> a : map1.entrySet()) {
	        		if( a.getKey().left.equals(str1) && a.getKey().right.equals(str2) ) {
	        			userQuantity = a.getValue();
	        		}
	        	}
	        	
	        	for(Map.Entry<Pair<String,String>,Integer> b : map2.entrySet()) {
	        		if( b.getKey().left.equals(str1) && b.getKey().right.equals(str2) ) {
	        			repositoryQuantity = b.getValue();
	        		}
	        	}
	        	
	        	int newQuantity = repositoryQuantity - userQuantity;
	        	
	        	st3.setInt(1,newQuantity);
	        	st3.setString(2, str1);
	        	st3.setString(3, str2);
	        	
	        	st3.executeUpdate();	        		        	
	        		        	
	        }
	        
	        String query4 = "insert into TRANSACTION values(?,?,?,?,?,?,?	)";
	        PreparedStatement st4 = con.prepareStatement(query4);
	        
	    	java.util.Date now = new java.util.Date();
	        String pattern = "yyyy-MM-dd";
	        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
	        String mysqlDateString = formatter.format(now);
	        
	        
        	for(Map.Entry<String,String> e : map1_temp.entrySet()) {
        	
	        	int userQuantity = 0;
	        	int repositoryQuantity = 0;
	        	
	        	String str1 = e.getKey();
	        	String str2 = e.getValue();
	        	
	        	for(Map.Entry<Pair<String,String>,Integer> a : map1.entrySet()) {
	        		if( a.getKey().left.equals(str1) && a.getKey().right.equals(str2) ) {
	        			userQuantity = a.getValue();
	        		}
	        	}
	        	
	        	for(Map.Entry<Pair<String,String>,Integer> b : map2.entrySet()) {
	        		if( b.getKey().left.equals(str1) && b.getKey().right.equals(str2) ) {
	        			repositoryQuantity = b.getValue();
	        		}
	        	}
	        	
	        	PreparedStatement st5 = con.prepareStatement(query2);
	        	st5.setString(1, str1);
	        	st5.setString(2, str2);
	 	        ResultSet rs5 = st5.executeQuery();
	 	        
	 	        rs5.next();
	 	        
	 	        String seller = rs5.getString("SellerUsername");
	 	        double price = rs5.getDouble("ProductPrice");
	 	        
	 	        st4.setString(1,str1);
	 	        st4.setString(2,str2);
	 	        st4.setDouble(3, price);
	 	        st4.setInt(4, userQuantity);
	 	        st4.setString(5, username);
	 	        st4.setString(6, seller);
	 	        st4.setString(7, mysqlDateString);
	 	        
	 	        st4.executeUpdate();
	        }
	        
	        
	        RequestDispatcher rd = req.getRequestDispatcher("BuyerPaymentSuccessful.jsp");
	        rd.forward(req, resp);
	        
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}
}
