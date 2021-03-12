package DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CallProcedure4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		try {	
			int count =0;
			BUYTBL[] buytbl = new BUYTBL[50];
//			 Class.forName("oracle.jdbc.driver.OracleDriver");
//			 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ai","1234");
			conn = DBConnection.getConnection();
			 // 프로시저 호출
			 CallableStatement cs = conn.prepareCall("begin del_buytbl(?); end;");
			 // 입력 파라메터
			 cs.setInt(1, 30);
			 int seq= cs.executeUpdate();
//			 ResultSet rs = (ResultSet)cs.getObject(1);
			 
			 if ( seq ==0 )
			 {
				 System.out.println(seq+"값");
			 }
			 else
			 {
				 System.out.println(seq+"값");
			 }
			 
//			 rs.close();
			 cs.close();
			 conn.close();
			 } catch(Exception e){
			 e.printStackTrace();
			 }
	}

}
