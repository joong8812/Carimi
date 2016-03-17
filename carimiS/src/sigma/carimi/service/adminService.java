package sigma.carimi.service;

import java.util.List;

import sigma.carimi.model.boardDTO;
import sigma.carimi.model.logDTO;

public interface adminService {
	
	List<logDTO> loglist()throws Exception;
	int logAll() throws Exception;
	int logToday() throws Exception;
}
