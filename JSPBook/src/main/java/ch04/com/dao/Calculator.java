package ch04.com.dao;
import java.io.Serializable;

public class Calculator implements Serializable {
    private static final long serialVersionUID = 1L;

    private double num1, num2;
    private String op;
    private String result;

    public Calculator() {}

    public void setNum1(String s) {
        try { this.num1 = Double.parseDouble(s); }
        catch (Exception e) { this.num1 = 0; }
    }

    public void setNum2(String s) {
        try { this.num2 = Double.parseDouble(s); }
        catch (Exception e) { this.num2 = 0; }
    }

    public void setNum1(double v) { this.num1 = v; }
    public void setNum2(double v) { this.num2 = v; }

    public void setOp(String o) { this.op = (o == null) ? "" : o; }
    public String getOp() { return op; }

    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }

    public double getNum1() { return num1; }
    public double getNum2() { return num2; }

    public void calculate() {
        try {
            double r;
            switch (op) {
                case "add": r = num1 + num2; break;
                case "sub": r = num1 - num2; break;
                case "mul": r = num1 * num2; break;
                case "div": if (num2 == 0) { result = "Error"; return; } r = num1 / num2; break;
                default: result = "Invalid"; return;
            }
            result = String.valueOf(r);
            if (result.endsWith(".0")) result = result.substring(0, result.length()-2);
        } catch(Exception e) { result = "Error"; }
    }
}

