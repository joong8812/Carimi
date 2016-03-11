package sigma.carimi.model;

public class CARDDTOSltd {
	private String CARDNAME;
	private String IMG;
	private int sel1;
	private int  sel2;
	private int sel3;
	private int sel4;
	private int sel5;
	private int sel6;
	private int sel7;
	private int sel8;
	
	public CARDDTOSltd(){}
	public CARDDTOSltd(String CARDNAME, String IMG, int sel1, int sel2, int sel3, int sel4, int sel5,int sel6,int sel7, int sel8)
	{
		super();
		
		this.CARDNAME = CARDNAME;
		this.IMG = IMG;
		this.sel1 = sel1;
		this.sel2 = sel2;
		this.sel3 = sel3;
		this.sel4 = sel4;
		this.sel5 = sel5;
		this.sel6 = sel6;
		this.sel7 = sel7;
		this.sel8 = sel8;
	}
	public String getCARDNAME() {
		return CARDNAME;
	}
	public void setCARDNAME(String CARDNAME) {
		this.CARDNAME = CARDNAME;
	}
	public String getIMG() {
		return IMG;
	}
	public void setIMG(String IMG) {
		this.IMG = IMG;
	}
	public int getSel1() {
		return sel1;
	}
	public void setSel1(int sel1) {
		this.sel1 = sel1;
	}
	public int getSel2() {
		return sel2;
	}
	public void setSel2(int sel2) {
		this.sel2 = sel2;
	}
	public int getSel3() {
		return sel3;
	}
	public void setSel3(int sel3) {
		this.sel3 = sel3;
	}
	public int getSel4() {
		return sel4;
	}
	public void setSel4(int sel4) {
		this.sel4 = sel4;
	}
	public int getSel5() {
		return sel5;
	}
	public void setSel5(int sel5) {
		this.sel5 = sel5;
	}
	public int getSel6() {
		return sel6;
	}
	public void setSel6(int sel6) {
		this.sel6 = sel6;
	}
	public int getSel7() {
		return sel7;
	}
	public void setSel7(int sel7) {
		this.sel7 = sel7;
	}
	public int getSel8() {
		return sel8;
	}
	public void setSel8(int sel8) {
		this.sel8 = sel8;
	}
	@Override
	public String toString() {
		return "CARDDTOSltd [CARDNAME=" + CARDNAME + ", IMG=" + IMG + ", sel1=" + sel1 + ", sel2=" + sel2 + ", sel3="
				+ sel3 + ", sel4=" + sel4 + ", sel5=" + sel5 + ", sel6=" + sel6 + ", sel7=" + sel7 + ", sel8=" + sel8
				+ "]";
	}
	
	
}
