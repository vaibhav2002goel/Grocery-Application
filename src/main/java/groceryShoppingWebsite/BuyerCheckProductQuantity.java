package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.mysql.cj.conf.ConnectionUrlParser.Pair;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BuyerCheckProductQuantity")
public class BuyerCheckProductQuantity extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Check Quantity");
		
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
	        
	        
	        
	        boolean flag = true;
	        String proName = "";
	        String proCategory = "";
	        int productAvailable = 0;
	        int userEnterProduct = 0;
	        
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
	        	
	        	
	        	
	        	if(userQuantity>repositoryQuantity) {
	        		proName = e.getKey();
	        		proCategory = e.getValue();
	        		productAvailable = repositoryQuantity; 
	        		userEnterProduct = userQuantity;
	        		flag = false;
	        		break;
	        	}
	        	
	        	
	        }
	        
	        
	        
	        
	        if(flag) {
	        	RequestDispatcher rd = req.getRequestDispatcher("BuyerPaymentPage.jsp");
	        	rd.forward(req, resp);
	        }
	        else {
	        	req.setAttribute("page", "BuyerCart.jsp");
				req.setAttribute("message", "The Product "+proName+" under category "+proCategory+" have stock "+productAvailable+" available. "
						+ "The Quantity you entered which is "+userEnterProduct+" is greater than the available stock.");
				
				req.setAttribute("pageName", "Cart Page");
				
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
	        }
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}
}
