package sigma.carimi.model;

public class CARDDTO {
	private String CARDNAME;	
	private int OIL;
	private int SHOP;
	private int MART;
	private int CVS;
	private int EOU;
	private int CAFE;
	private int MOVIE;
	private int TRA;
	private int TEL;
	private int EDU;
	private int CUL;
	private int LEI;
	private int MEDI;
	private int BEA;
	private double POI;
	private int AFEE;
	private int CRIT;
	private String IMG;
	
	public CARDDTO(){}
	public CARDDTO(String CARDNAME, int OIL, int SHOP, int MART, int CVS, int EOU,
				int CAFE, int MOVIE, int TRA, int TEL, int EDU, int CUL,
				int LEI, int MEDI, int BEA, double POI, int AFEE, int CRIT, String IMG){
		super();
		
		this.CARDNAME = CARDNAME;
		this.OIL = OIL;
		this.SHOP = SHOP;
		this.MART = MART;
		this.CVS = CVS;
		this.EOU = EOU;
		this.CAFE = CAFE;
		this.MOVIE = MOVIE;
		this.TRA = TRA;
		this.TEL = TEL;
		this.EDU = EDU;
		this.CUL = CUL;
		this.LEI = LEI;
		this.MEDI = MEDI;
		this.BEA = BEA;
		this.POI = POI;
		this.AFEE = AFEE;
		this.CRIT = CRIT;
		this.IMG = IMG;
	}

	public String getCARDNAME() {
		return CARDNAME;
	}

	public void setCARDNAME(String cARDNAME) {
		CARDNAME = cARDNAME;
	}

	public int getOIL() {
		return OIL;
	}

	public void setOIL(int oIL) {
		OIL = oIL;
	}

	public int getSHOP() {
		return SHOP;
	}

	public void setSHOP(int sHOP) {
		SHOP = sHOP;
	}

	public int getMART() {
		return MART;
	}

	public void setMART(int mART) {
		MART = mART;
	}

	public int getCVS() {
		return CVS;
	}

	public void setCVS(int cVS) {
		CVS = cVS;
	}

	public int getEOU() {
		return EOU;
	}

	public void setEOU(int eOU) {
		EOU = eOU;
	}

	public int getCAFE() {
		return CAFE;
	}

	public void setCAFE(int cAFE) {
		CAFE = cAFE;
	}

	public int getMOVIE() {
		return MOVIE;
	}

	public void setMOVIE(int mOVIE) {
		MOVIE = mOVIE;
	}

	public int getTRA() {
		return TRA;
	}

	public void setTRA(int tRA) {
		TRA = tRA;
	}

	public int getTEL() {
		return TEL;
	}

	public void setTEL(int tEL) {
		TEL = tEL;
	}

	public int getEDU() {
		return EDU;
	}

	public void setEDU(int eDU) {
		EDU = eDU;
	}

	public int getCUL() {
		return CUL;
	}

	public void setCUL(int cUL) {
		CUL = cUL;
	}

	public int getLEI() {
		return LEI;
	}

	public void setLEI(int lEI) {
		LEI = lEI;
	}

	public int getMEDI() {
		return MEDI;
	}

	public void setMEDI(int mEDI) {
		MEDI = mEDI;
	}

	public int getBEA() {
		return BEA;
	}

	public void setBEA(int bEA) {
		BEA = bEA;
	}

	public double getPOI() {
		return POI;
	}

	public void setPOI(double pOI) {
		POI = pOI;
	}

	public int getAFEE() {
		return AFEE;
	}

	public void setAFEE(int afee) {
		this.AFEE = afee;
	}

	public int getCRIT() {
		return CRIT;
	}

	public void setCRIT(int crit) {
		this.CRIT = crit;
	}
	
	public String getIMG() {
		return IMG;
	}
	public void setIMG(String img) {
		this.IMG = img;
	}

	@Override
	public String toString() {
		return "CARDDTO [CARDNAME=" + CARDNAME + ", OIL=" + OIL + ", SHOP=" + SHOP + ", MART=" + MART + ", CVS=" + CVS
				+ ", EOU=" + EOU + ", CAFE=" + CAFE + ", MOVIE=" + MOVIE + ", TRA=" + TRA + ", TEL=" + TEL + ", EDU="
				+ EDU + ", CUL=" + CUL + ", LEI=" + LEI + ", MEDI=" + MEDI + ", BEA=" + BEA + ", POI=" + POI + ", afee="
				+ AFEE + ", crit=" + CRIT + ", img=" + IMG + "]";
	}
	
}
