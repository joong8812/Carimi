package sigma.carimi.service;

import java.util.List;
import java.util.Map;

import sigma.carimi.model.benefitDTO;

public interface benefitService {
	
	List<benefitDTO> getCBFList(benefitDTO bnfdto) throws Exception;
	List<benefitDTO> getCBFList(benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception;	// For making all list from two cards which are selected
	benefitDTO getCBF(benefitDTO bnfdto) throws Exception;
	
	List<benefitDTO> getAllCBFList(String x1, String x2) throws Exception;
	boolean addCBF(benefitDTO bnfdto) throws Exception;
	boolean deleteCBF(benefitDTO bnfdto) throws Exception;
	boolean updateCBF(benefitDTO bnfdto) throws Exception;
	List<benefitDTO> getCBFtenList(int start, int end, String x1, String x2) throws Exception;
	List<benefitDTO> getCBFtenList(int start, int end, benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception;	// ten of two cards
}
