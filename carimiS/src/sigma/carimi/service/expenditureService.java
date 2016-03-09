package sigma.carimi.service;

import java.util.List;

import sigma.carimi.model.expenditureDTO;


public interface expenditureService {
	
	List<expenditureDTO> getexpList(expenditureDTO edto) throws Exception ;
	boolean addexp(expenditureDTO edto) throws Exception;
	boolean deleteexp(int seq) throws Exception;
	expenditureDTO expall(int seq) throws Exception ;
	boolean updexp(expenditureDTO edto) throws Exception;
	List<expenditureDTO> searchList(String stext) throws Exception;
	List<expenditureDTO> e1List(expenditureDTO edto) throws Exception;

}
