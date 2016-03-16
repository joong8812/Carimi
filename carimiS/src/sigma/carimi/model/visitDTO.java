package sigma.carimi.model;

public class visitDTO {
	private String ip;
	private String vdate;
	public visitDTO(){
		
	}
	public visitDTO(String ip, String vdate) {
		super();
		this.ip = ip;
		this.vdate = vdate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	
	
	
	
}
