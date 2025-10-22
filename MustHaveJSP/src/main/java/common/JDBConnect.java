package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() {
		try {
			// JDBC 드라이버로드
			Class.forName("com.mysql.cj.jdbc.Driver");

			// DB에 연결
			String url = "jdbc:mysql://localhost:3306/musthave";
			String id = "musthave";
			String pwd = "tiger";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결성공(기본생성자)");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버로드
			Class.forName(driver);

			// DB에 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결성공(변수 생성자 1)");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public JDBConnect(ServletContext application) {
		try {
			// JDBC 드라이버로드
			String driver = application.getInitParameter("MySQLDriver");
			Class.forName(driver);
			
			// DB에 연결
			String url = application.getInitParameter("MySQLURL");
			String id = application.getInitParameter("MySQLId");
			String pwd = application.getInitParameter("MySQLPwd");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결성공(인수생성자2)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결해제(자원반납)
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
			System.out.println("JDBC 자원해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
