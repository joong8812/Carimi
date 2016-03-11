package sigma.carimi.service;
import java.util.List;

import sigma.carimi.model.CARDDTOSltd;
import sigma.carimi.model.CARDDTOCond;
public interface CARDService {
	
	//List<CARDDTOSltd> getCARDinformList(String a, String b, String c, String d, String e, String f, String g, String h) throws Exception ;
	List<CARDDTOSltd> getCARDinformList(CARDDTOCond ccond) throws Exception ;
}
