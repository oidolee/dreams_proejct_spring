package pj.mvc.dreams_project2.dto;

import java.util.Date;

public class RefundDTO {
	
	private int REF_No;        			// 환불번호
    private int order_No;		 		// 주문번호(구매당시)
    private String REF_cust_Id;   		// 구매자 아이디
    private String REF_Name;       		// 구매자이름
    private String REF_Phone;       	// 연락처
    private String REF_Address;     	// 주소
    
    private int REF_Prod_No;    		// 상품번호
    private String REF_Prod_Name;   	// 상품명
    private int REF_Prod_qty;    		// 환불/교환 개수
    private String REF_Reason;    		// 환불/교환 사유
    private String REF_Account;   		// 환불 받을 계좌
    private Date REF_Date;       		// 환불/교환 신청일
    
    private String REF_Status;    	// 1: 환불, 2: 교환

	public RefundDTO() {
		super();
	}

	public int getREF_No() {
		return REF_No;
	}

	public void setREF_No(int rEF_No) {
		REF_No = rEF_No;
	}

	public int getOrder_No() {
		return order_No;
	}

	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}

	public String getREF_cust_Id() {
		return REF_cust_Id;
	}

	public void setREF_cust_Id(String rEF_cust_Id) {
		REF_cust_Id = rEF_cust_Id;
	}

	public String getREF_Name() {
		return REF_Name;
	}

	public void setREF_Name(String rEF_Name) {
		REF_Name = rEF_Name;
	}

	public String getREF_Phone() {
		return REF_Phone;
	}

	public void setREF_Phone(String rEF_Phone) {
		REF_Phone = rEF_Phone;
	}

	public String getREF_Address() {
		return REF_Address;
	}

	public void setREF_Address(String rEF_Address) {
		REF_Address = rEF_Address;
	}

	public int getREF_Prod_No() {
		return REF_Prod_No;
	}

	public void setREF_Prod_No(int rEF_Prod_No) {
		REF_Prod_No = rEF_Prod_No;
	}

	public String getREF_Prod_Name() {
		return REF_Prod_Name;
	}

	public void setREF_Prod_Name(String rEF_Prod_Name) {
		REF_Prod_Name = rEF_Prod_Name;
	}

	public int getREF_Prod_qty() {
		return REF_Prod_qty;
	}

	public void setREF_Prod_qty(int rEF_Prod_qty) {
		REF_Prod_qty = rEF_Prod_qty;
	}

	public String getREF_Reason() {
		return REF_Reason;
	}

	public void setREF_Reason(String rEF_Reason) {
		REF_Reason = rEF_Reason;
	}

	public String getREF_Account() {
		return REF_Account;
	}

	public void setREF_Account(String rEF_Account) {
		REF_Account = rEF_Account;
	}

	public Date getREF_Date() {
		return REF_Date;
	}

	public void setREF_Date(Date rEF_Date) {
		REF_Date = rEF_Date;
	}

	public String getREF_Status() {
		return REF_Status;
	}

	public void setREF_Status(String rEF_Status) {
		REF_Status = rEF_Status;
	}

	@Override
	public String toString() {
		return "RefundDTO [REF_No=" + REF_No + ", order_No=" + order_No + ", REF_cust_Id=" + REF_cust_Id + ", REF_Name="
				+ REF_Name + ", REF_Phone=" + REF_Phone + ", REF_Address=" + REF_Address + ", REF_Prod_No="
				+ REF_Prod_No + ", REF_Prod_Name=" + REF_Prod_Name + ", REF_Prod_qty=" + REF_Prod_qty + ", REF_Reason="
				+ REF_Reason + ", REF_Account=" + REF_Account + ", REF_Date=" + REF_Date + ", REF_isExchan="
				+ REF_Status + "]";
	}
    
    
}
