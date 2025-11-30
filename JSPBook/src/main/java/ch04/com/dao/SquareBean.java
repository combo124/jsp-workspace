package ch04.com.dao;


import java.io.Serializable;

public class SquareBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private double number;   // 입력값
    private double result;   // 결과값

    public SquareBean() {}   // 기본 생성자 꼭 필요!

    // Setter / Getter
    public void setNumber(double number) {
        this.number = number;
    }

    public double getNumber() {
        return number;
    }

    public double getResult() {
        return result;
    }

    // 계산 메서드
    public void calculate() {
        result = number * number;
    }
}