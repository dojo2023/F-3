package model;
import java.io.Serializable;
public class Roulette implements Serializable {
  private int number;
  private String name;

public Roulette(int number, String name) {
	super();
	this.number = number;
	this.name = name;

}

public Roulette() {
	super();
	this.number = 0;
	this.name = "";

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

}

