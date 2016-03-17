package sigma.carimi.service;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sigma.carimi.model.boardDTO;
import sigma.carimi.model.memberDTO;
import sigma.carimi.model.logDTO;

@Repository
public class adminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns="Admin.";
	
	public List<logDTO> loglist( )throws Exception{
		List<logDTO> list=new ArrayList<logDTO>();
		list=(List<logDTO>)
				sqlSession.selectList(ns+"loglist");
		return list;
	}
	public int  logAll() throws Exception{
		
		int count= (int) sqlSession.selectOne(ns+"logAll");	
		return count;
	}
	public int  logToday() throws Exception{
		
		int count= (int) sqlSession.selectOne(ns+"logToday");	
		return count;
	}
	

	
}