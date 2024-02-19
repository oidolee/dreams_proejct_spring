package pj.mvc.dreams_project2.dto;

public class CustomerDTO {
	
	// 멤버변수
	private String cust_Id;			// 고객 아이디
	private String cust_Name;		// 이름
	private String cust_Password;	// 비밀번호
	private String cust_Email;		// 이메일
	private String cust_Birth;		// 생년월일
	private String cust_Phone;		// 연락처
	private String cust_Address;	// 주소
	private int cust_No;			// 넘버링
	private String show;			// Y/N
	
	
	// 디폴트 생성자
	public CustomerDTO() {
		super();
	}
	
	// 매개변수 생성자
	public CustomerDTO(String cust_Id, String cust_Name, String cust_Password, String cust_Email, String cust_Birth,
			String cust_Phone, String cust_Address, int cust_No, String show) {
		super();
		this.cust_Id = cust_Id;
		this.cust_Name = cust_Name;
		this.cust_Password = cust_Password;
		this.cust_Email = cust_Email;
		this.cust_Birth = cust_Birth;
		this.cust_Phone = cust_Phone;
		this.cust_Address = cust_Address;
		this.cust_No = cust_No;
		this.show = show;
	}


	public String getCust_Id() {
		return cust_Id;
	}


	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}


	public String getCust_Name() {
		return cust_Name;
	}


	public void setCust_Name(String cust_Name) {
		this.cust_Name = cust_Name;
	}


	public String getCust_Password() {
		return cust_Password;
	}


	public void setCust_Password(String cust_Password) {
		this.cust_Password = cust_Password;
	}


	public String getCust_Email() {
		return cust_Email;
	}


	public void setCust_Email(String cust_Email) {
		this.cust_Email = cust_Email;
	}


	public String getCust_Birth() {
		return cust_Birth;
	}


	public void setCust_Birth(String cust_Birth) {
		this.cust_Birth = cust_Birth;
	}


	public String getCust_Phone() {
		return cust_Phone;
	}


	public void setCust_Phone(String cust_Phone) {
		this.cust_Phone = cust_Phone;
	}


	public String getCust_Address() {
		return cust_Address;
	}


	public void setCust_Address(String cust_Address) {
		this.cust_Address = cust_Address;
	}


	public int getCust_No() {
		return cust_No;
	}
	
	public void setCust_No(int cust_No) {
		this.cust_No = cust_No;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	// toString
	@Override
	public String toString() {
		return "CustomerDTO [cust_Id=" + cust_Id + ", cust_Name=" + cust_Name + ", cust_Password=" + cust_Password
				+ ", cust_Email=" + cust_Email + ", cust_Birth=" + cust_Birth + ", cust_Phone=" + cust_Phone
				+ ", cust_Address=" + cust_Address + ", cust_No=" + cust_No + ", show=" + show + "]";
	}
}