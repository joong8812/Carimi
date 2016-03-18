package sigma.carimi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sigma.carimi.model.expenditureDTO;
import sigma.carimi.model.memberDTO;
import sigma.carimi.model.visitDTO;
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
	public memberDTO loginMember2(String email) throws Exception {
		return memberDAO.loginMember2(email);
	}

	@Override
	public boolean addMember(memberDTO member) throws Exception {
		return memberDAO.addMember(member);
	}
	@Override
	public boolean addVisit(visitDTO visit) throws Exception {
		return memberDAO.addVisit(visit);
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
	@Override
	public List<memberDTO> allList() throws Exception {
		
		return memberDAO.allList();
	}

	@Override
	public int cntPerCardAge(String card1, String card2, int min, int max) throws Exception {
		return memberDAO.cntPerCardAge(card1, card2, min, max);
	}

	@Override
	public int cntBenefitXCard(String card1, String benefit) throws Exception {
		return memberDAO.cntBenefitXCard(card1, benefit);
	}

	@Override
	public int cntHumanXAge(int min, int max) throws Exception {
		return memberDAO.cntHumanXAge(min, max);
	}

	@Override
	public int cntHumanXCard(String card, String sex) throws Exception {
		return memberDAO.cntHumanXCard(card, sex);
	}

	@Override
	public double sumBenefitXCard(String card, String benefit) throws Exception {
		return memberDAO.sumBenefitXCard(card, benefit);
	}

	@Override
	public double sumExpenseXBenefit(String benefit) throws Exception {
		return memberDAO.sumExpenseXBenefit(benefit);
	}

	@Override
	public double sumExpenseXMonth(String wdate, String card) throws Exception {
		return memberDAO.sumExpenseXMonth(wdate, card);
	}
}
