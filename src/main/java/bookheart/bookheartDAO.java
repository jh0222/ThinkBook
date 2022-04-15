package bookheart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Book;

import report.Report;

public class bookheartDAO {
	

	public static void calc(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException {				
		Connection conn;
		String[] books = request.getParameterValues("bookheartcheck");
		request.setAttribute("heart", books);
		response.setCharacterEncoding("utf-8");
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mydb";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			String sql = "insert into bookheart values (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			String userID = request.getParameter("userID");
			for(int i=0; i>books.length; i++) {								
				pstmt.setString(1, userID);
				pstmt.setString(2, books[i]);
			}		
			
			if(pstmt.executeUpdate()==1) {
				request.setAttribute("r", "등록성공");
			}else {
				request.setAttribute("r", "등록실패");
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
			request.setAttribute("r", "db서버 문제");
		}
		
	}

	public static void showAll(HttpServletRequest request) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select booktitle from bookheart where userID=?";
		ArrayList<Bookheartlist> list = new ArrayList<Bookheartlist>();
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mydb";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String userID = request.getParameter("userID");
			pstmt.setString(1, userID); 
			while(rs.next()) {
				Bookheartlist bh = new Bookheartlist();
				bh.setBooktitle(rs.getString(1));				
				list.add(bh);
			}
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
	}
}
