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

	@Override
	public boolean addMember(memberDTO member) throws Exception {
		return memberDAO.addMember(member);
	}
	
	@Override
	public memberDTO memberOne(memberDTO member) throws Exception {
		return memberDAO.memberOne(member);
	}
	@Override
	public boolean memUpdate(memberDTO member) throws Exception {
		return memberDAO.memUpdate(member);
	}
	@Override
	public boolean memDelete(String id) throws Exception {
		return memberDAO.memDelete(id);
	}
}
