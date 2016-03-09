package sigma.carimi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sigma.carimi.model.boardDTO;

import sigma.carimi.service.boardDAO;

import sigma.carimi.service.boardService;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	private boardDAO boardDAO;

	@Override
	@Transactional(readOnly=true)
	public List<boardDTO> boardList(String cardvalue) throws Exception {
		return boardDAO.boardList(cardvalue);
	}
	
	@Override
	@Transactional(readOnly=true)
	public boardDTO boardDetail(int bseq) throws Exception {
		return boardDAO.boardDetail(bseq);
	}
	@Override
	@Transactional(readOnly=true)
	public boolean boardwriteAf(boardDTO dto) throws Exception {
		return boardDAO.boardwriteAf(dto);
	}
	@Override
	@Transactional(readOnly=true)
	public boolean boarddelete(int bseq) throws Exception {
		return boardDAO.boarddelete(bseq);
	}
}
