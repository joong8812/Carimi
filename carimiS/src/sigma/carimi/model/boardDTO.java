package sigma.carimi.model;

import java.io.Serializable;

public class boardDTO implements Serializable{
	private int bseq;
	private String bwdate;
	private String id;
	private String btitle;
	private String bcontent;
	private String bfilename;
	private String bsdate;
	private String bedate;
	private int bread;
	private String bselect;
	private int readrank;
	
	public int getReadrank() {
		return readrank;
	}
	public void setReadrank(int readrank) {
		this.readrank = readrank;
	}
	public boardDTO(){}
	public boardDTO(int bseq, String bwdate, String id,
			String btitle, String bcontent, String bfilename,
			String bsdate, String bedate){
		super();
		
		this.bseq = bseq;
		this.bwdate = bwdate;
		this.id = id;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfilename=bfilename;
		this.bsdate=bsdate;
		this.bedate=bedate;
	}
	public boardDTO( int readrank, String bselect) {
		super();
		this.readrank = readrank;
		this.bselect = bselect;
		
	}
	public int getBread() {
		return bread;
	}
	public void setBread(int bread) {
		this.bread = bread;
	}
	public String getBselect() {
		return bselect;
	}
	public void setBselect(String bselect) {
		this.bselect = bselect;
	}
	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getBwdate() {
		return bwdate;
	}

	public void setBwdate(String bwdate) {
		this.bwdate = bwdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBfilename() {
		return bfilename;
	}

	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
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
	
	

}
