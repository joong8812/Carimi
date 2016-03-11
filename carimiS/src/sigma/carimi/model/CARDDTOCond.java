package sigma.carimi.model;

public class CARDDTOCond {
	private int a1;
	private int b1;
	private String c11;
	private String c12;
	private String c13;
	private String c14;
	private String c15;
	private String c16;
	
	public CARDDTOCond(){}
	public CARDDTOCond(int a1, int b1, String c11, String c12, String c13, String c14, String c15, String c16)
	{
		super();
		this.a1 = a1;
		this.b1 = b1;
		this.c11 = c11;
		this.c12 = c12;
		this.c13 = c13;
		this.c14 = c14;
		this.c15 = c15;
		this.c16 = c16;
	}
	public int getA1() {
		return a1;
	}
	public void setA1(int a1) {
		this.a1 = a1;
	}
	public int getB1() {
		return b1;
	}
	public void setB1(int b1) {
		this.b1 = b1;
	}
	public String getC11() {
		return c11;
	}
	public void setC11(String c11) {
		this.c11 = c11;
	}
	public String getC12() {
		return c12;
	}
	public void setC12(String c12) {
		this.c12 = c12;
	}
	public String getC13() {
		return c13;
	}
	public void setC13(String c13) {
		this.c13 = c13;
	}
	public String getC14() {
		return c14;
	}
	public void setC14(String c14) {
		this.c14 = c14;
	}
	public String getC15() {
		return c15;
	}
	public void setC15(String c15) {
		this.c15 = c15;
	}
	public String getC16() {
		return c16;
	}
	public void setC16(String c16) {
		this.c16 = c16;
	}
	@Override
	public String toString() {
		return "CARDDTOCond [a1=" + a1 + ", b1=" + b1 + ", c11=" + c11 + ", c12=" + c12 + ", c13=" + c13 + ", c14="
				+ c14 + ", c15=" + c15 + ", c16=" + c16 + ", getA1()=" + getA1() + ", getB1()=" + getB1()
				+ ", getC11()=" + getC11() + ", getC12()=" + getC12() + ", getC13()=" + getC13() + ", getC14()="
				+ getC14() + ", getC15()=" + getC15() + ", getC16()=" + getC16() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
