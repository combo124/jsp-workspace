package ch04.com.dao;

public class GuGuDan {

private int dan;

public GuGuDan() {
	super();
	// TODO Auto-generated constructor stub
}

public int getDan() {
	return dan;
}

public void setDan(int dan) {
	this.dan = dan;
}
public String process() {
    String result = "";
    for (int i = 1; i <= 9; i++) {
        result += dan + " × " + i + " = " + (dan * i) + "<br>";
    }
    return result.toString();
}

	
}
