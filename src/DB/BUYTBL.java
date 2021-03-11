package DB;

public class BUYTBL {
	private int idnum;
	private String userid;
	private String prodname;
	private String groupname;
	private int price;
	private int amount;
	// 1 setter...
	// 2 생성자로...
	public BUYTBL(int idnum,String userid,String prodname, String groupname,int price,int amount){
		this.idnum = idnum;
		this.userid = userid;
		this.prodname = prodname;
		this.groupname = groupname;
		this.price = price;
		this.amount = amount;
	}
	public void print(){
		System.out.println("구매번호는 "+idnum+"입니다");
		System.out.println("아이디는 "+userid+"입니다");
		System.out.println("상품이름은 "+prodname+"입니다");
		System.out.println("상품카테고리는 "+groupname+"입니다");
		System.out.println("가격은 "+price+"입니다");
		System.out.println("구매수량은"+amount+"입니다");
		System.out.println();
		System.out.println();
	}
}
