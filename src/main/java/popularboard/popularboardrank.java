package popularboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class popularboardrank {
	private Connection conn;
	private ResultSet rs;

	public popularboardrank() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mydb";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getborrowBoardRank(){
		String SQL = "SELECT name from borrowboard WHERE count=(select max(count) FROM borrowboard)";		
		String name=null;
		try {			
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			rs = pstmt.executeQuery();
			if(rs.next()) {			
				name = rs.getString("name");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	public String getdiscussionBoardRank(){
		String SQL = "SELECT name from discussionboard WHERE count=(select max(count) FROM discussionboard)";		
		String name=null;
		try {			
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			rs = pstmt.executeQuery();
			if(rs.next()) {			
				name = rs.getString("name");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	public String getfreeBoardRank(){
		String SQL = "SELECT name from freeboard WHERE count=(select max(count) FROM freeboard)";		
		String name=null;
		try {			
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			rs = pstmt.executeQuery();
			if(rs.next()) {			
				name = rs.getString("name");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
}
