package sigma.carimi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import sigma.carimi.model.expenditureDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class expenditureDAO {

		
		@Autowired /*�ڵ����� �� ����*/
		private SqlSession sqlsession;
		
		private String ns = "Expenditure."; //DB Table �̸�
		
		@SuppressWarnings("unchecked")
		public List<expenditureDTO> getexpList(expenditureDTO edto) throws Exception{
			System.out.println("���"+edto.getId());
			System.out.println("���"+edto.getWdates());
			
			List<expenditureDTO> list = new ArrayList<expenditureDTO>();
			list = sqlsession.selectList(ns + "getexpList", edto);
//			System.out.println("getexpList="+list.size());
//			System.out.println("getexpList id="+list.get(0).getId());
//			System.out.println("getexpList Moneytype="+list.get(0).getMoneytype());
//			System.out.println("getexpList Price="+list.get(0).getPrice());
//			System.out.println("getexpList Bcategory="+list.get(0).getBcategory());
//			System.out.println("getexpList Scategory="+list.get(0).getScategory());
//			System.out.println("getexpList Seq="+list.get(0).getSeq());
//			System.out.println("getexpList Shopname="+list.get(0).getShopname());
//			System.out.println("getexpList getWdate="+list.get(0).getWdate());
			
			return list;
		}
		
		public expenditureDTO getexp(int seq) throws Exception{
			expenditureDTO edto = null;
			edto = (expenditureDTO)sqlsession.selectOne(ns + "getexp", seq);
			return edto;
		}
		
		public boolean addexp(expenditureDTO edto) throws Exception{
			sqlsession.insert(ns + "addexp", edto);
			return true;
		}
		
		public boolean deleteexp(int seq) throws Exception{
			sqlsession.delete(ns + "deleteexp", seq);
			System.out.println("��������");
			return true;
		}

		public expenditureDTO expall(int seq) throws Exception{
			expenditureDTO  edto = new expenditureDTO();
			edto = (expenditureDTO)sqlsession.selectOne(ns + "expall", seq);
			return edto;
		}

		public boolean updexp(expenditureDTO edto) throws Exception{
			System.out.println("1="+edto.getId());
			System.out.println("1="+edto.getBcategory());
			System.out.println("1="+edto.getPrice());
			System.out.println("1="+edto.getScategory());
			System.out.println("1="+edto.getSeq());
			System.out.println("1="+edto.getShopname());
			System.out.println("1"+edto.getWdate());
			
			sqlsession.update(ns + "updexp", edto);
			return true;
		}

		@SuppressWarnings("unchecked")
		public List<expenditureDTO> searchList(String stext) {
			List<expenditureDTO> slist = new ArrayList<expenditureDTO>();
			slist = sqlsession.selectList(ns + "searchList", stext);
			
			return slist;
		}

		@SuppressWarnings("unchecked")
		public List<expenditureDTO> e1List(expenditureDTO edto) throws Exception{
			List<expenditureDTO> e1list = new ArrayList<expenditureDTO>();
			e1list = sqlsession.selectList(ns + "e1List", edto);
			return e1list;
		}
		
		public List<expenditureDTO> yearList(expenditureDTO edto, int year) throws Exception{
			
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("id", edto.getId());
			hm.put("year", year);
			
			List<expenditureDTO> edtolist = new ArrayList<expenditureDTO>();
			edtolist = (List<expenditureDTO>)
							sqlsession.selectList(ns + "edtolist", hm);
			return edtolist;
		}

		@SuppressWarnings("unchecked")
		public List<expenditureDTO> e2List(expenditureDTO edto) {
			List<expenditureDTO> e2list = new ArrayList<expenditureDTO>();
			e2list = sqlsession.selectList(ns + "e2List", edto);
			return e2list;
		}


}
