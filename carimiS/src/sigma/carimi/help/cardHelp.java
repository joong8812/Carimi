package sigma.carimi.help;

import sigma.carimi.model.CARDDTO;

public class cardHelp {
	
	public double getCardBenefit(CARDDTO cdto, String col){
		if(col.equals("OIL")){
			return cdto.getOIL();
		} else if(col.equals("SHOP")){
			return cdto.getSHOP();
		} else if(col.equals("MART")){
			return cdto.getMART();
		} else if(col.equals("CVS")){
			return cdto.getCVS();
		} else if(col.equals("EOU")){
			return cdto.getEOU();
		} else if(col.equals("CAFE")){
			return cdto.getCAFE();
		} else if(col.equals("MOVIE")){
			return cdto.getMOVIE();
		} else if(col.equals("TRA")){
			return cdto.getTRA();
		} else if(col.equals("TEL")){
			return cdto.getTEL();
		} else if(col.equals("EDU")){
			return cdto.getEDU();
		} else if(col.equals("CUL")){
			return cdto.getCUL();
		} else if(col.equals("LEI")){
			return cdto.getLEI();
		} else if(col.equals("MEDI")){
			return cdto.getMEDI();
		} else if(col.equals("BEA")){
			return cdto.getBEA();
		} else if(col.equals("POI")){
			return cdto.getPOI();
		}
		return 0; 
	}
}
