package sigma.carimi.service;

import java.util.List;

import sigma.carimi.model.boardDTO;

public interface boardService {
	
	List<boardDTO> boardList(String cardvalue)throws Exception;
	boardDTO boardDetail(int bseq)throws Exception;
	boolean boardwriteAf(boardDTO dto)throws Exception;
	boolean boarddelete(int bseq)throws Exception;
}
