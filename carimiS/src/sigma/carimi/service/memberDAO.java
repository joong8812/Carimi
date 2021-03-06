package sigma.carimi.service;


import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sigma.carimi.model.expenditureDTO;
import sigma.carimi.model.memberDTO;
import sigma.carimi.model.visitDTO;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns="Member.";
	
	public memberDTO loginMember(memberDTO member) throws Exception{
		return (memberDTO)sqlSession.selectOne(ns+"loginMember", member);
	}
	public memberDTO loginMember2(String email) throws Exception{
		return (memberDTO)sqlSession.selectOne(ns+"loginMember2", email);
	}
	public boolean addMember(memberDTO member) throws Exception{
		sqlSession.insert(ns+"addMember",member);
		return true;
	}
	public boolean addVisit(visitDTO visit) throws Exception{
		sqlSession.insert(ns+"addVisit",visit);
		return true;
	}
	
	public memberDTO memberOne(memberDTO member) throws Exception{
		memberDTO mdto = null;
		mdto = (memberDTO)sqlSession.selectOne(ns+"memberOne", member);
		return mdto;
	}
	public boolean memUpdate(memberDTO member) throws Exception{
		sqlSession.update(ns+"memUpdate", member);
		return true;
	}
	public boolean memDelete(String id) throws Exception{
		sqlSession.delete(ns+"memDelete", id);
		return true;
	}

	/*@SuppressWarnings("unchecked")
	public HashMap<Integer,Integer> allMap(int age) throws Exception{
		HashMap<Integer,Integer> allmap = new HashMap<Integer,Integer>();
		allmap = sqlSession.select(ns+"allMap", age);
		
		return allmap;
	}*/
	
	@SuppressWarnings("unchecked")
	public List<memberDTO> allList() throws Exception{
		List<memberDTO> allmap = new ArrayList<memberDTO>();
		allmap = sqlSession.selectList(ns+"allList");
		
		return allmap;
	}
	
	public int cntPerCardAge(String card1, String card2, int min, int max) throws Exception{
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("card1", card1);
		hm.put("card2", card2);
		hm.put("min", min);
		hm.put("max", max);
		
		int result = (int)sqlSession.selectOne(ns+"cntPerCardAge", hm);
		
		return result;
	}
	
	public int cntBenefitXCard(String card, String benefit) throws Exception {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("card", card);
		hm.put("benefit", benefit);
		
		int result = (int)sqlSession.selectOne(ns+"cntBenefitXCard", hm);
		return result;
	}	
	
	public int cntHumanXAge(int min, int max) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("min", min);
		hm.put("max", max);
		int result = (int)sqlSession.selectOne(ns+"cntHumanXAge", hm);
		
		return result;
	}
	
	public int cntHumanXCard(String card, String sex) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("card", card);
		hm.put("sex", sex);
		int result = (int)sqlSession.selectOne(ns+"cntHumanXCard", hm);
		return result;
	}
	
	public double sumBenefitXCard(String card, String benefit) throws Exception {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("card", card);
		hm.put("benefit", benefit);
		Object result = sqlSession.selectOne(ns+"sumBenefitXCard", hm);
		if(result == null){
			result = 0;
		}
		return (double)result;
	}
	
	public double sumExpenseXBenefit(String benefit) throws Exception {
		Object result = sqlSession.selectOne(ns+"sumExpenseXBenefit", benefit);
		if(result == null){
			result = 0;
		}
		return (double)result;
	}
	
	public double sumExpenseXMonth(String wdate, String card) throws Exception {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("card", card);
		hm.put("wdate", wdate);
		Object result = sqlSession.selectOne(ns+"sumExpenseXMonth", hm);
		if(result == null){
			result = 0.0;
		}
		return (double)result;
	}
}