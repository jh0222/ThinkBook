package bookheart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {

	public static Connection connect() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/mydb";
		return DriverManager.getConnection(url,"root","1234");
	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			if(rs!=null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(rs!=null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(rs!=null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
