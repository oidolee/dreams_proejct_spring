package pj.mvc.dreams_project2.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class TicketResDTO {

	private int ticket_no;		// 티켓 번호
	private String ticket_seat;	// 좌석
	private String cust_Id;		// 세션에서 받는 아이디
	private Timestamp game_date;// 게임 날짜
	private Date purchase_date;	// 티켓 구매 날짜
	private int ticket_price;	// 티켓 총 금액
	private String show;		// 예약 / 예약 취소 구분
	
	

	// 디폴트 생성자
	public TicketResDTO() {}

	// getter setter
	public int getTicket_no() {
		return ticket_no;
	}

	public void setTicket_no(int ticket_no) {
		this.ticket_no = ticket_no;
	}

	public String getTicket_seat() {
		return ticket_seat;
	}

	public void setTicket_seat(String ticket_seat) {
		this.ticket_seat = ticket_seat;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public Timestamp getGame_date() {
		return game_date;
	}

	public void setGame_date(Timestamp game_date) {
		this.game_date = game_date;
	}

	public Date getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}

	public int getTicket_price() {
		return ticket_price;
	}

	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "TicketResDTO [ticket_no=" + ticket_no + ", ticket_seat=" + ticket_seat + ", cust_Id=" + cust_Id
				+ ", game_date=" + game_date + ", purchase_date=" + purchase_date + ", ticket_price=" + ticket_price
				+ ", show=" + show + "]";
	}

	
	
	
	
	
}
