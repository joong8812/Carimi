package sigma.carimi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sigma.carimi.model.memberDTO;
import sigma.carimi.service.memberDAO;
import sigma.carimi.service.memberService;

@Service
public class memberServiceImpl implements memberService{
	
	@Autowired
	private memberDAO memberDAO;

	@Override
	public memberDTO loginMember(memberDTO member) throws Exception {
		return memberDAO.loginMember(member);
	}
}
