package model;
import java.io.Serializable;
public class Friends implements Serializable {
	private int number ;
	private String name;
	private int visitTimes;
	private String avatar;

	public Friends(int number, String name, int visitTimes, String avatar) {
		this.number = number;
		this.name = name;
		this.visitTimes = visitTimes;
		this.avatar = avatar;
	}
	public Friends() {
		this.number = 0;
		this.name = "";
		this.visitTimes = 0;
		this.avatar = "";
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getVisitTimes() {
		return visitTimes;
	}
	public void setVisitTimes(int visitTimes) {
		this.visitTimes = visitTimes;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}