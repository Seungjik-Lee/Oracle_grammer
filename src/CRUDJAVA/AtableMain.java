package CRUDJAVA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

//constructor 생성자
public class AtableMain {
	
	public static Scanner scan = new Scanner(System.in);

	public AtableMain() {
		
		ManagerAtable ma = new ManagerAtable();
		
		while(true){
		System.out.println("학생 관리 프로그램 : 1번 insert, 2번 update, 3번 delete, 4번 select, 그 외 종료");
		int select = scan.nextInt();
		if (select == 1)
			ma.insertAtable();
		else if (select == 2)
			ma.updateAtable();
		else if (select == 3)
			ma.updateAtable();
		else if (select == 4)	
			ma.updateAtable();
		else
			System.exit(1);
		}
	}
	public static void main(String[] args) {
		new AtableMain();
	}
}
