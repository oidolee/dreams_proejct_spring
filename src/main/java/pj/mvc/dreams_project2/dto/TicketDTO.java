package pj.mvc.dreams_project2.dto;

public class TicketDTO {

	private String ticket_seat;
	private int ticket_grade_normal;
	private int ticket_grade_membership;
	private int ticket_grade_child;
	
	// 디폴트 생성자
	public TicketDTO() {}

	// 매개변수 생성자
	public TicketDTO(String ticket_seat, int ticket_grade_normal, int ticket_grade_membership, int ticket_grade_child) {
		super();
		this.ticket_seat = ticket_seat;
		this.ticket_grade_normal = ticket_grade_normal;
		this.ticket_grade_membership = ticket_grade_membership;
		this.ticket_grade_child = ticket_grade_child;
	}

	// getter setter
	public String getTicket_seat() {
		return ticket_seat;
	}

	public void setTicket_seat(String ticket_seat) {
		this.ticket_seat = ticket_seat;
	}

	public int getTicket_grade_normal() {
		return ticket_grade_normal;
	}

	public void setTicket_grade_normal(int ticket_grade_normal) {
		this.ticket_grade_normal = ticket_grade_normal;
	}

	public int getTicket_grade_membership() {
		return ticket_grade_membership;
	}

	public void setTicket_grade_membership(int ticket_grade_membership) {
		this.ticket_grade_membership = ticket_grade_membership;
	}

	public int getTicket_grade_child() {
		return ticket_grade_child;
	}

	public void setTicket_grade_child(int ticket_grade_child) {
		this.ticket_grade_child = ticket_grade_child;
	}

	// toString 재정의
	@Override
	public String toString() {
		return "TicketDTO [ticket_seat=" + ticket_seat + ", ticket_grade_normal=" + ticket_grade_normal
				+ ", ticket_grade_membership=" + ticket_grade_membership + ", ticket_grade_child=" + ticket_grade_child
				+ "]";
	}
	
	
	
	
}
