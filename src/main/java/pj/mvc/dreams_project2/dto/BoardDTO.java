package pj.mvc.dreams_project2.dto;

import java.sql.Date;

public class BoardDTO {
	
	// 멤버변수
	private int board_No;
	private String cust_Id;
	private String board_Title;
	private String board_Content;
	private Date board_Date;
	private String show;
	
	// 디폴트 생성자
	public BoardDTO() {
		super();
	}

	// 매개변수 생성자
	public BoardDTO(int board_No, String cust_Id, String board_Title, String board_Content, Date board_Date,
			String show) {
		super();
		this.board_No = board_No;
		this.cust_Id = cust_Id;
		this.board_Title = board_Title;
		this.board_Content = board_Content;
		this.board_Date = board_Date;
		this.show = show;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public Date getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(Date board_Date) {
		this.board_Date = board_Date;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_No=" + board_No + ", cust_Id=" + cust_Id + ", board_Title=" + board_Title
				+ ", board_Content=" + board_Content + ", board_Date=" + board_Date + ", show=" + show + "]";
	}

	
	
}
