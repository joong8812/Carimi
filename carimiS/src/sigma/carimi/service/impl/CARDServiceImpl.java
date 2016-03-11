package sigma.carimi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sigma.carimi.model.CARDDTOSltd;
import sigma.carimi.service.CARDDAO;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.service.CARDService;


@Service
public class CARDServiceImpl implements CARDService{
	@Autowired
	private CARDDAO CARDDAO;
	
	@Override
	//public List<CARDDTOSltd> getCARDinformList(String a, String b, String c, String d, String e, String f, String g, String h) throws Exception {
	public List<CARDDTOSltd> getCARDinformList(CARDDTOCond ccond) throws Exception {
		return CARDDAO.getCARDinformList(ccond);
	}

}
