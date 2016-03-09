package sigma.carimi.model;

public class planDTO {
	private int pseq;
	private String id, padate, patime, ptitle, pcontent, plocal, pwdate, plocation_x, plocation_y, pedate, petime, mycard1, mycard2;
	private String bsdate, bedate, btitle, mc, bseq;

	public planDTO(){}
	
	public planDTO(String id) {
		this.id = id;
	}
	
	public planDTO(int pseq) {
		this.pseq = pseq;
	}
	
	public planDTO(String mycard1, String mycard2) {
		this.mycard1 = mycard1;
		this.mycard2 = mycard2;
	}
		
	
	public planDTO(String btitle, String bsdate, String bedate, String bseq) {
		this.btitle = btitle;
		this.bsdate = bsdate;
		this.bedate = bedate;
		this.bseq = bseq;
	}
	
	public planDTO(int pseq, String id, String padate, String patime, String ptitle, String pcontent, String plocal, String plocation_x, String plocation_y, String pedate, String petime) {
		super();
		this.id = id;
		this.pseq = pseq;
		this.padate = padate;
		this.pedate = pedate;
		this.patime = patime;
		this.petime = petime;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.plocal = plocal;
		this.plocation_x = plocation_x;
		this.plocation_y = plocation_y;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getBseq() {
		return bseq;
	}

	public void setBseq(String bseq) {
		this.bseq = bseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPadate() {
		return padate;
	}

	public void setPadate(String padate) {
		this.padate = padate;
	}

	public String getPatime() {
		return patime;
	}

	public void setPatime(String patime) {
		this.patime = patime;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPlocal() {
		return plocal;
	}

	public void setPlocal(String plocal) {
		this.plocal = plocal;
	}

	public String getPwdate() {
		return pwdate;
	}

	public void setPwdate(String pwdate) {
		this.pwdate = pwdate;
	}


	public String getPlocation_x() {
		return plocation_x;
	}

	public void setPlocation_x(String plocation_x) {
		this.plocation_x = plocation_x;
	}

	public String getPlocation_y() {
		return plocation_y;
	}

	public void setPlocation_y(String plocation_y) {
		this.plocation_y = plocation_y;
	}

	public String getPedate() {
		return pedate;
	}

	public void setPedate(String pedate) {
		this.pedate = pedate;
	}

	public String getPetime() {
		return petime;
	}

	public void setPetime(String petime) {
		this.petime = petime;
	}

	public String getMycard1() {
		return mycard1;
	}

	public void setMycard1(String mycard1) {
		this.mycard1 = mycard1;
	}

	public String getMycard2() {
		return mycard2;
	}

	public void setMycard2(String mycard2) {
		this.mycard2 = mycard2;
	}
	
	public String getBsdate() {
		return bsdate;
	}

	public void setBsdate(String bsdate) {
		this.bsdate = bsdate;
	}

	public String getBedate() {
		return bedate;
	}

	public void setBedate(String bedate) {
		this.bedate = bedate;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	@Override
	public String toString() {
		return "planDTO [bsdate=" + bsdate + ", bedate=" + bedate + ", btitle=" + btitle + ", bseq=" + bseq + "]";
	}

	
}
