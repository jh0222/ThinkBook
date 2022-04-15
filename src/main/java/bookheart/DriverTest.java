package bookheart;

import java.sql.*;

public class DriverTest {

	public static void main(String[] args) {
		Connection con;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1234");
			System.out.println("Success");
		}
		catch(SQLException e) {
			System.out.println("SQLException"+e);
		}
		catch(Exception e) {
			System.out.println("Exception"+e);
		}

	}

}
