package sigma.carimi.service;

import java.sql.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sigma.carimi.model.*;

@Repository
public class planDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String ns="Plan.";
	
	/* 추가 */
	public boolean addPlan(planDTO pdto) throws Exception{
		System.out.println(pdto.toString());
		sqlSession.insert(ns+"addPlan", pdto);
		return true;
	}
	/* 삭제 */
	public boolean delPlan(planDTO pdto) throws Exception{
		System.out.println("deletePlan");
		sqlSession.delete(ns+"delPlan", pdto);
		return true;
	}
	/* 수정 */
	public boolean updPlan(planDTO pdto) throws Exception{
		sqlSession.update(ns+"updPlan", pdto);
		return true;
	}
	
	/* 전체목록 */
	public List<planDTO> listPlan(planDTO pdto) throws Exception{
		List<planDTO> listplan = new ArrayList<planDTO>();
		listplan=(List<planDTO>)sqlSession.selectList(ns+"listPlan",pdto);
		
		System.out.println("planDAO listplan Success");
		return listplan;
	}
	
	/* 행사목록 */
	public List<planDTO> eventPlan(planDTO pdto) throws Exception{
		List<planDTO> eventplan = new ArrayList<planDTO>();
		return eventplan=(List<planDTO>)sqlSession.selectList(ns+"evepntPlan",pdto);
	}
	
	/*	단일목록 */
	public planDTO selPlan(planDTO pdto) throws Exception{
		System.out.println(pdto.toString());
		
		return (planDTO)sqlSession.selectOne(ns+"selPlan", pdto);
	}
	
	/*	카드목록 */
	public planDTO cardPlan(planDTO pdto) throws Exception{
		System.out.println(pdto.toString());
		return (planDTO)sqlSession.selectOne(ns+"cardPlan", pdto);
	}
	
}