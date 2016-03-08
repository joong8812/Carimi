package sigma.carimi.model;

public class benefitDTO {
	int bseq;				// sequence
	String cardname;		
	String shopname;
	String bcategory;		// benefit category
	int brate;				// benefit rate
	String opentime;
	String closetime;
	String phone;
	String address;
	String filename;
	String locationx;
	String locationy;
	
	public benefitDTO(){}
	
	public benefitDTO(int bseq){
		this.bseq = bseq;
	}
	
	public benefitDTO(String cardname, String bcategory){
		this.cardname = cardname;
		this.bcategory = bcategory;
	}
	
	public benefitDTO(int bseq, String cardname, String shopname, String bcategory, int brate, String opentime,
			String closetime, String phone, String address, String filename, String location_x, String location_y) {
		super();
		this.bseq = bseq;
		this.cardname = cardname;
		this.shopname = shopname;
		this.bcategory = bcategory;
		this.brate = brate;
		this.opentime = opentime;
		this.closetime = closetime;
		this.phone = phone;
		this.address = address;
		this.filename = filename;
		this.locationx = locationx;
		this.locationy = locationy;
	}
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getCardname() {
		return cardname;
	}
	public void setCardname(String cardname) {
		this.cardname = cardname;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public int getBrate() {
		return brate;
	}
	public void setBrate(int brate) {
		this.brate = brate;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getLocationx() {
		return locationx;
	}
	public void setLocationx(String locationx) {
		this.locationx = locationx;
	}
	public String getLocationy() {
		return locationy;
	}
	public void setLocationy(String locationy) {
		this.locationy = locationy;
	}

	@Override
	public String toString() {
		return "benefitDTO [bseq=" + bseq + ", cardname=" + cardname + ", shopname=" + shopname + ", bcategory="
				+ bcategory + ", brate=" + brate + ", opentime=" + opentime + ", closetime=" + closetime + ", phone="
				+ phone + ", address=" + address + ", filename=" + filename + ", locationx=" + locationx
				+ ", locationy=" + locationy + "]";
	}
	
}
