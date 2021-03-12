package DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Procedure2 {

	public void update() {
		
		Scanner scan = new Scanner(System.in);
		
		// TODO Auto-generated method stub
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		try {
			int count =0;
			STUDENT[] student = new STUDENT[50];
//			 Class.forName("oracle.jdbc.driver.OracleDriver");
//			 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ai","1234");
			conn = DBConnection.getConnection();
			 // 프로시저 호출
			 CallableStatement cs = conn.prepareCall("begin update_STUDENT(?,?,?,?,?); end;");
			 // 입력 파라메터
				System.out.println("수정할 학생의 학번 : ");
				int studentno = scan.nextInt();
				cs.setInt(1, studentno);
				System.out.println("수정할 학생의 이름 : ");
				String name = scan.next();
				cs.setString(2, name);
				System.out.println("수정할 학생의 번호 : ");
				String phonenumber = scan.next();
				cs.setString(3, phonenumber);
				System.out.println("수정할 학생의 도시 : ");
				String city = scan.next();
				cs.setString(4, city);
				System.out.println("수정할 학생의 학과 : ");
				String department = scan.next();
				cs.setString(5, department);
			 int seq= cs.executeUpdate();
//			 ResultSet rs = (ResultSet)cs.getObject(1);

//			 rs.close();
			 cs.close();
			 conn.close();
			 } catch(Exception e){
			 e.printStackTrace();
			 }
	}

}
