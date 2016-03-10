package sigma.carimi.model;

import java.util.Arrays;

public class CARDDTOCond {
	private String a1;
	private String b1;
	private String[] c1;
	
	
	public CARDDTOCond(){}
	public CARDDTOCond(String a1, String b1, String[] c1)
	{
		super();
		this.a1 = a1;
		this.b1 = b1;
		this.c1 = c1;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getB1() {
		return b1;
	}
	public void setB1(String b1) {
		this.b1 = b1;
	}
	public String[] getC1() {
		return c1;
	}
	public void setC1(String[] c1) {
		this.c1 = c1;
	}
	@Override
	public String toString() {
		return "CARDDTOCond [a1=" + a1 + ", b1=" + b1 + ", c1=" + Arrays.toString(c1) + ", getA1()=" + getA1()
				+ ", getB1()=" + getB1() + ", getC1()=" + Arrays.toString(getC1()) + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
