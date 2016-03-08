package sigma.carimi.service;

import sigma.carimi.model.memberDTO;

public interface AnalysisService {

	memberDTO loginMember(memberDTO member) throws Exception ;
	boolean addMember(memberDTO member) throws Exception;
	memberDTO memberOne(memberDTO member) throws Exception;
	boolean memUpdate(memberDTO member) throws Exception;
	boolean memDelete(String id) throws Exception;

}