package DB;

import java.sql.*;
import oracle.jdbc.*;

public class Procedure1 {

	public void select() {
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
			 CallableStatement cs = conn.prepareCall("begin SELECTALLCOLUMN_STUDENT(?); end;");
			 // 입력 파라메터
//			 cs.setInt(1, 1);
			 // 출력 파라메터
			 cs.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
			 // 실행
			 cs.execute();
//			 ResultSet rs = (ResultSet)cs.getObject(1);
			 rs = (ResultSet)cs.getObject(1);
			 
			 while(rs.next()) {
				 student[count]=new STUDENT(rs.getInt("studentno"), rs.getString("name"),rs.getString("phonenumber"),rs.getString("city"),
					 rs.getString("department"));
			 count++;
			 }
			 
			 for (int i=0;student.length>i;i++)
			 {
				if(student[i] != null)
				{
					student[i].print();
				}
			 }
			 
			 rs.close();
			 cs.close();
			 conn.close();
			 } catch(Exception e){
			 e.printStackTrace();
			 }
	}

}
