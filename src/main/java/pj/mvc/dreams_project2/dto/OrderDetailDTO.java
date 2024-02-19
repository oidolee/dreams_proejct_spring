package pj.mvc.dreams_project2.dto;

public class OrderDetailDTO {
	private int 	orderDetail_No;      	// 주문상세번호
	private int 	order_No;           	// 주문번호
	private int 	product_No;          	// 상품번호
	private String 	product_Name;        	// 상품명
    private int 	orderDetail_qty;     	// 주문수량
    private int 	orderDetail_price;   	// 개당가격
    
    // 디폴트 생성자
	public OrderDetailDTO() {
		super();
	}
	
	// getter, setter
	public int getOrderDetail_No() {
		return orderDetail_No;
	}
	public void setOrderDetail_No(int orderDetail_No) {
		this.orderDetail_No = orderDetail_No;
	}
	public int getOrder_No() {
		return order_No;
	}
	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}
	public int getProduct_No() {
		return product_No;
	}
	public void setProduct_No(int product_No) {
		this.product_No = product_No;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public int getOrderDetail_qty() {
		return orderDetail_qty;
	}
	public void setOrderDetail_qty(int orderDetail_qty) {
		this.orderDetail_qty = orderDetail_qty;
	}
	public int getOrderDetail_price() {
		return orderDetail_price;
	}
	public void setOrderDetail_price(int orderDetail_price) {
		this.orderDetail_price = orderDetail_price;
	}
	
	// toString
	@Override
	public String toString() {
		return "OrderDetailDTO [orderDetail_No=" + orderDetail_No + ", order_No=" + order_No + ", product_No="
				+ product_No + ", product_Name=" + product_Name + ", orderDetail_qty=" + orderDetail_qty
				+ ", orderDetail_price=" + orderDetail_price + "]";
	}
	
    
	
}
