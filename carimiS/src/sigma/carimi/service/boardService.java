package sigma.carimi.service;

import java.util.List;

import sigma.carimi.model.boardDTO;

public interface boardService {
	
	List<boardDTO> boardList(String cardvalue)throws Exception;
}
