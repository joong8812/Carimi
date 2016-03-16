package sigma.carimi.service;

import java.util.HashMap;
import java.util.List;

import sigma.carimi.model.memberDTO;

public interface memberService {
	
	memberDTO loginMember(memberDTO member) throws Exception ;
	boolean addMember(memberDTO member) throws Exception;
	memberDTO memberOne(memberDTO member) throws Exception;
	boolean memUpdate(memberDTO member) throws Exception;
	boolean memDelete(String id) throws Exception;
	List<memberDTO> allList()throws Exception;
	
}
