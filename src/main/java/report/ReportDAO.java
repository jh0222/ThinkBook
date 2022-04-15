package report;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


public class ReportDAO {
	private Connection conn;
	private ResultSet rs;

	public ReportDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}
	
	public int write(String rTitle, String userID, String rContent) {
		String SQL = "INSERT INTO REPORT VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, rTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, rContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	public int getNext() {
		String SQL = "SELECT rID FROM REPORT ORDER BY rID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public ArrayList<Report> getList(int pageNumber){
		String SQL = "SELECT * FROM REPORT WHERE rID < ? AND rAvailable = 1 ORDER BY rID DESC LIMIT 10";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Report report = new Report();
				report.setrID(rs.getInt(1));
				report.setrTitle(rs.getString(2));
				report.setUserID(rs.getString(3));
				report.setrDate(rs.getString(4));
				report.setrContent(rs.getString(5));
				report.setrAvailable(rs.getString(6));
				list.add(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM REPORT WHERE rID < ? AND rAvailable = 1 ORDER BY rID DESC LIMIT 10";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Report getReport(int rID) {
		String SQL = "SELECT * FROM REPORT WHERE rID = ?";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, rID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Report report = new Report();
				report.setrID(rs.getInt(1));
				report.setrTitle(rs.getString(2));
				report.setUserID(rs.getString(3));
				report.setrDate(rs.getString(4));
				report.setrContent(rs.getString(5));
				report.setrAvailable(rs.getString(6));
				return report;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int reportupdate(int rID, String rTitle, String rContent) {
		String SQL = "UPDATE REPORT SET rTitle = ?, rContent = ? WHERE rID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, rTitle);
			pstmt.setString(2, rContent);
			pstmt.setInt(3, rID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int reportdelete(int rID) {
		String SQL = "DELETE FROM REPORT WHERE rID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, rID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	//���İ� ��ŷ
	public ArrayList<Report> getRankList(int pageNumber){
		String SQL = "select userID, count(*), DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) from report group by userID ORDER BY COUNT(*) desc LIMIT 10";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Report report = new Report();				
				report.setUserID(rs.getString(1));	
				report.setrCount(rs.getInt(2));
				report.setRank(rs.getInt(3));
				list.add(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Report> getmyRankList(int pageNumber){
		String SQL = "select userID, count(*), DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) from report group by userID ORDER BY COUNT(*) desc LIMIT 10";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Report report = new Report();				
				report.setUserID(rs.getString(1));	
				report.setrCount(rs.getInt(2));
				report.setRank(rs.getInt(3));
				list.add(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void getmyrank(HttpServletRequest request) {
		
		
	}
}