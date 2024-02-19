package pj.mvc.dreams_project2.dto;

public class TeamDTO {
	private int DK_No;
	private String DK_TeamName;
	private String DK_Location;
	public int getDK_No() {
		return DK_No;
	}
	public void setDK_No(int dK_No) {
		DK_No = dK_No;
	}
	public String getDK_TeamName() {
		return DK_TeamName;
	}
	public void setDK_TeamName(String dK_TeamName) {
		DK_TeamName = dK_TeamName;
	}
	public String getDK_Location() {
		return DK_Location;
	}
	public void setDK_Location(String dK_Location) {
		DK_Location = dK_Location;
	}
	@Override
	public String toString() {
		return "TeamDTO [DK_No=" + DK_No + ", DK_TeamName=" + DK_TeamName + ", DK_Location=" + DK_Location + "]";
	}
	
}
