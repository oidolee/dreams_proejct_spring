package pj.mvc.dreams_project2.dto;

import java.sql.Timestamp;

public class gamesDTO {
	private int DG_No;
	private String DG_Home;
	private String DG_Away;
	private String DG_Location;
	private Timestamp DG_Time;
	public int getDG_No() {
		return DG_No;
	}
	public void setDG_No(int dG_No) {
		DG_No = dG_No;
	}
	public String getDG_Home() {
		return DG_Home;
	}
	public void setDG_Home(String dG_Home) {
		DG_Home = dG_Home;
	}
	public String getDG_Away() {
		return DG_Away;
	}
	public void setDG_Away(String dG_Away) {
		DG_Away = dG_Away;
	}
	public String getDG_Location() {
		return DG_Location;
	}
	public void setDG_Location(String dG_Location) {
		DG_Location = dG_Location;
	}
	public Timestamp getDG_Time() {
		return DG_Time;
	}
	public void setDG_Time(Timestamp dG_Time) {
		DG_Time = dG_Time;
	}
	@Override
	public String toString() {
		return "gamesDTO [DG_No=" + DG_No + ", DG_Home=" + DG_Home + ", DG_Away=" + DG_Away + ", DG_Location="
				+ DG_Location + ", DG_Time=" + DG_Time + "]";
	}
	
	
}
/*mysql
create table DR_Gemes(
		DG_No int primary key auto_increment,
	    DG_Home varchar(100) comment '홈팀',
    DG_Away varchar(100) comment '원정팀',
    DG_Time datetime default current_timestamp comment '경기시간'
);*/