package sigma.carimi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sigma.carimi.model.benefitDTO;
import sigma.carimi.service.benefitDAO;
import sigma.carimi.service.benefitService;

@Service
public class benefitServiceImpl implements benefitService{

	@Autowired
	private benefitDAO benefitDAO;
	
	@Override
	public List<benefitDTO> getCBFList(benefitDTO bnfdto) throws Exception {
		return benefitDAO.getCBFList(bnfdto);
	}

	@Override
	public List<benefitDTO> getCBFList(benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception {
		return benefitDAO.getCBFList(bnfdto, bnfdto2);
	}

	@Override
	public benefitDTO getCBF(benefitDTO bnfdto) throws Exception {
		return benefitDAO.getCBF(bnfdto);
	}

	@Override
	public List<benefitDTO> getAllCBFList(String x1, String x2) throws Exception {
		return benefitDAO.getAllCBFList(x1, x2);
	}

	@Override
	public boolean addCBF(benefitDTO bnfdto) throws Exception {
		return benefitDAO.addCBF(bnfdto);
	}

	@Override
	public boolean deleteCBF(benefitDTO bnfdto) throws Exception {
		return benefitDAO.deleteCBF(bnfdto);
	}

	@Override
	public boolean updateCBF(benefitDTO bnfdto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<benefitDTO> getCBFtenList(int start, int end, String x1, String x2) throws Exception {
		// TODO Auto-generated method stub
		return benefitDAO.getCBFtenList(start, end, x1, x2);
	}

	@Override
	public List<benefitDTO> getCBFtenList(int start, int end, benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception {
		return benefitDAO.getCBFtenList(start, end, bnfdto, bnfdto2);
	}

}
