package sigma.carimi.model;

public class CARDDTOSltd {
	private String CARDNAME;
	private String IMG;
	private Double sel1;
	private Double sel2;
	private Double sel3;
	private Double sel4;
	private Double sel5;
	private Double sel6;
	private Double sel7;
	private Double sel8;
	
	public CARDDTOSltd(){}
	public CARDDTOSltd(String CARDNAME, String IMG, Double sel1, Double sel2, Double sel3, Double sel4, Double sel5,Double sel6,Double sel7, Double sel8)
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
	public Double getSel1() {
		return sel1;
	}
	public void setSel1(Double sel1) {
		this.sel1 = sel1;
	}
	public Double getSel2() {
		return sel2;
	}
	public void setSel2(Double sel2) {
		this.sel2 = sel2;
	}
	public Double getSel3() {
		return sel3;
	}
	public void setSel3(Double sel3) {
		this.sel3 = sel3;
	}
	public Double getSel4() {
		return sel4;
	}
	public void setSel4(Double sel4) {
		this.sel4 = sel4;
	}
	public Double getSel5() {
		return sel5;
	}
	public void setSel5(Double sel5) {
		this.sel5 = sel5;
	}
	public Double getSel6() {
		return sel6;
	}
	public void setSel6(Double sel6) {
		this.sel6 = sel6;
	}
	public Double getSel7() {
		return sel7;
	}
	public void setSel7(Double sel7) {
		this.sel7 = sel7;
	}
	public Double getSel8() {
		return sel8;
	}
	public void setSel8(Double sel8) {
		this.sel8 = sel8;
	}
	@Override
	public String toString() {
		return "CARDDTOSltd [CARDNAME=" + CARDNAME + ", IMG=" + IMG + ", sel1=" + sel1 + ", sel2=" + sel2 + ", sel3="
				+ sel3 + ", sel4=" + sel4 + ", sel5=" + sel5 + ", sel6=" + sel6 + ", sel7=" + sel7 + ", sel8=" + sel8
				+ "]";
	}
	
	
}
