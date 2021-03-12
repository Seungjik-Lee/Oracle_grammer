package DB;

public class STUDENT {
	private int studentno;
	private String name;
	private String phonenumber;
	private String city;
	private String department;
	// 1 setter...
	// 2 생성자로...
	public STUDENT(int studentno, String name, String phonenumber, String city, String department){
		this.studentno = studentno;
		this.name = name;
		this.phonenumber = phonenumber;
		this.city = city;
		this.department = department;
	}
	public void print(){
		System.out.println("학번 : "+studentno);
		System.out.println("이름 : "+name);
		System.out.println("번호 : "+phonenumber);
		System.out.println("도시 : "+city);
		System.out.println("학과 : "+department);
		System.out.println();
	}
}
