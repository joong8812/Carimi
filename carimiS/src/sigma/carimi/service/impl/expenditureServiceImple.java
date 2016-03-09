package sigma.carimi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sigma.carimi.model.expenditureDTO;
import sigma.carimi.service.expenditureDAO;
import sigma.carimi.service.expenditureService;

@Service
public class expenditureServiceImple implements expenditureService{

		@Autowired
		private expenditureDAO expenditureDAO;

		@Override
		public List<expenditureDTO> getexpList(expenditureDTO edto) throws Exception {
			System.out.println(edto.getId());
			System.out.println(edto.getWdates());
			
			return expenditureDAO.getexpList(edto);
		}

		@Override
		public boolean addexp(expenditureDTO edto) throws Exception {
			return expenditureDAO.addexp(edto);
		}
		
		@Override
		public boolean deleteexp(int seq) throws Exception {
			return expenditureDAO.deleteexp(seq);
		}

		@Override
		public expenditureDTO expall(int seq) throws Exception {
			return expenditureDAO.expall(seq);
		}
		
		@Override
		public boolean updexp(expenditureDTO edto) throws Exception {
			return expenditureDAO.updexp(edto);
		}
		
		@Override
		public List<expenditureDTO> searchList(String stext) throws Exception {

			return expenditureDAO.searchList(stext);
		}
		
		@Override
		public List<expenditureDTO> e1List(expenditureDTO edto) throws Exception {
			
			return expenditureDAO.e1List(edto);
		}

		@Override
		public List<expenditureDTO> yearList(expenditureDTO edto) throws Exception {
			return expenditureDAO.yearList(edto);
		}
}
