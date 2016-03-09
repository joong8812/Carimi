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
	public boardDTO boardDetail(int bseq)throws Exception{
		boardDTO bdto=null;
		bdto=(boardDTO)
				sqlSession.selectOne(ns+"boardDetail",bseq);
		return bdto;
	}
	public boolean boardwriteAf(boardDTO dto)throws Exception{

				sqlSession.insert(ns+"boardwriteAf",dto);
		return true;
	}
	
	public boolean boarddelete(int bseq) throws Exception{
		
		sqlSession.delete(ns+"boarddelete", bseq);
		return true;
		
	}

	
}