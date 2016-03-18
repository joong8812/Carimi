package sigma.carimi.service;

import java.util.HashMap;
import java.util.List;

import sigma.carimi.model.memberDTO;
import sigma.carimi.model.visitDTO;

public interface memberService {
	
	memberDTO loginMember(memberDTO member) throws Exception ;
	boolean addMember(memberDTO member) throws Exception;
	boolean addVisit(visitDTO visit) throws Exception;
	memberDTO memberOne(memberDTO member) throws Exception;
	boolean memUpdate(memberDTO member) throws Exception;
	boolean memDelete(String id) throws Exception;
	List<memberDTO> allList()throws Exception;
	int cntPerCardAge(String card1, String card2, int min, int max) throws Exception;
	int cntBenefitXCard(String card, String benefit) throws Exception;
	int cntHumanXAge(int min, int max) throws Exception;
	int cntHumanXCard(String card, String sex) throws Exception;
	double sumBenefitXCard(String card, String benefit) throws Exception;
	double sumExpenseXBenefit(String benefit) throws Exception;
	double sumExpenseXMonth(String wdate, String card) throws Exception;
}
