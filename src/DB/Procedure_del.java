package DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Procedure_del {

	public void delete() {
		
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
			 CallableStatement cs = conn.prepareCall("begin del_student(?); end;");
			 // 입력 파라메터
			 System.out.println("삭제할 학번 : ");
			 int studentno = scan.nextInt();
			 cs.setInt(1, studentno);
			 
			 int seq= cs.executeUpdate();
//			 ResultSet rs = (ResultSet)cs.getObject(1);
			 
//			 if ( seq ==0 )
//			 {
//				 System.out.println(seq+"값");
//			 }
//			 else
//			 {
//				 System.out.println(seq+"값");
//			 }
			 
//			 rs.close();
			 cs.close();
			 conn.close();
			 } catch(Exception e){
			 e.printStackTrace();
			 }
	}

}
