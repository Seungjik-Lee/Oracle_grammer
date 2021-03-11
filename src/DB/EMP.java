package DB;

public class EMP {
	private String empno;
	private String ename;
	private int sal;
	private String job;
	private String mgr;
	private String hiredate;
	private String comm;
	private String deptno;
	// 1 setter...
	// 2 생성자로...
	public EMP(String empno,String ename,int sal, String job,String mgr,String hiredate,String comm,String deptno){
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.comm = comm;
		this.deptno = deptno;
	}
	public void print(){
		System.out.println("사원번호 "+empno+"입니다");
		System.out.println("이름은 "+ename+"입니다");
		System.out.println("급여는 "+sal+"입니다");
		System.out.println("업무는"+job+"입니다");
		System.out.println("매니저는 "+mgr+"입니다");
		System.out.println("고용일은"+hiredate+"입니다");
		System.out.println("수수료율은"+comm+"입니다");
		System.out.println("부서번호는"+deptno+"입니다");
		System.out.println();
		System.out.println();
	}
}
