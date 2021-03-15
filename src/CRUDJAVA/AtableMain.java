package CRUDJAVA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

//constructor 생성자
public class AtableMain {
	
	Scanner scan = new Scanner(System.in);

	public void insertAtable() {
		
		String idx = null;
		String name = null;
		String gender = null;
		String remark = null;
		
		scan.nextLine();
		System.out.println("번호 입력");
		idx = scan.nextLine();
		System.out.println("이름 입력");
		name = scan.nextLine();
		System.out.println("성별 입력");
		gender = scan.nextLine();
		System.out.println("비고 입력");
		remark = scan.nextLine();
		
		// try 구문 안에 있는 내용을 실행하다가 에러가 발생하면 catch로 빠진다.
		/*
		 * 1. jar 파일 추가 확인 2. DB 연결 3. SQL 구문 작성
		 */

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","AI","1234");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.111:1521:xe", "AI", "1234");

			System.out.println("DB 연결 성공");

			pstmt = conn.prepareStatement(
					"INSERT INTO ATABLE " + "(IDX, NAME, GENDER, REMARK) " + "VALUES " + "(?,?,?,?)");
			pstmt.setString(1,  idx);
			pstmt.setString(2,  name);
			pstmt.setString(3,  gender);
			pstmt.setString(4,  remark);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("에러 그 클래스 파일 없음");
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void updateAtable() {

	}

	public AtableMain() {
		
		System.out.println("뭐? 1번 insert, 2번 update, 3번 delete, 4번 select");
		int select = scan.nextInt();
		if (select == 1)
			insertAtable();
		else if (select == 2)
			updateAtable();
	}

	public static void main(String[] args) {
		new AtableMain();
	}
}
