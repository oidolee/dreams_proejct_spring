package pj.mvc.dreams_project2.dto;

public class OrderDTO {
	
	// 멤버변수
	private int order_No;			// 주문번호
	private String cust_Id;			// 고객ID
	private String order_Content;	// 주문내용
	private int order_Amount;	// 총결제금액
	
	private String order_Name;		// 주문자이름
	private String order_Phone;		// 연락처
	private String order_Address;	// 주소
	
	private String order_Date;		// 주문일자
	private String order_Status;	// 주문상태
	
	// 디폴트 생성자
	public OrderDTO() {
		super();
	}
	
	// getter, setter
	public int getOrder_No() {
		return order_No;
	}

	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public String getOrder_Content() {
		return order_Content;
	}

	public void setOrder_Content(String order_Content) {
		this.order_Content = order_Content;
	}

	public int getOrder_Amount() {
		return order_Amount;
	}

	public void setOrder_Amount(int order_Amount) {
		this.order_Amount = order_Amount;
	}

	public String getOrder_Name() {
		return order_Name;
	}

	public void setOrder_Name(String order_Name) {
		this.order_Name = order_Name;
	}

	public String getOrder_Phone() {
		return order_Phone;
	}

	public void setOrder_Phone(String order_Phone) {
		this.order_Phone = order_Phone;
	}

	public String getOrder_Address() {
		return order_Address;
	}

	public void setOrder_Address(String order_Address) {
		this.order_Address = order_Address;
	}

	public String getOrder_Date() {
		return order_Date;
	}

	public void setOrder_Date(String order_Date) {
		this.order_Date = order_Date;
	}

	public String getOrder_Status() {
		return order_Status;
	}

	public void setOrder_Status(String order_Status) {
		this.order_Status = order_Status;
	}
	
	// toString
	@Override
	public String toString() {
		return "OrderDTO [order_No=" + order_No + ", cust_Id=" + cust_Id + ", order_Content=" + order_Content
				+ ", order_Amount=" + order_Amount + ", order_Name=" + order_Name + ", order_Phone=" + order_Phone
				+ ", order_Address=" + order_Address + ", order_Date=" + order_Date + ", order_Status=" + order_Status
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
