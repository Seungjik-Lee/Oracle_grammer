package DB;

import java.util.Scanner;

public class Student_admin {
	public static void main(String[] args) {
		Procedure1 a = new Procedure1();
		Procedure2 b = new Procedure2();
		Procedure3 c = new Procedure3();
		Procedure_del d = new Procedure_del();

		Scanner scan = new Scanner(System.in);

		while (true) {
			System.out.println("번호를 입력하세요.");
			System.out.println("1.학생 조회 2.학생 수정 3.학생 추가 4.학생 삭제 ");
			System.out.println("=============================");
			int i = scan.nextInt();

			switch (i) {
			case 1:{
				a.select();
				break;
			}
			case 2:{
				b.update();
				break;
			}
			case 3:{
				c.add();
				break;
			}
			case 4:{
				d.delete();
				break;
			}
			}
		}

	}
}
