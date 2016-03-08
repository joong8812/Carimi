package sigma.carimi.service;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sigma.carimi.model.boardDTO;
import sigma.carimi.model.memberDTO;

@Repository
public class boardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns="Board.";
	
	public List<boardDTO> boardList(String cardvalue)throws Exception{
		List<boardDTO> list=new ArrayList<boardDTO>();
		list=(List<boardDTO>)
				sqlSession.selectList(ns+"boardList", cardvalue);
		return list;
	}

	
}