package sigma.carimi.service;

import java.util.ArrayList;
import java.util.List;

import sigma.carimi.model.expenditureDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class expenditureDAO {

		
		@Autowired /*ÀÚµ¿»ý¼º ÈÄ ¿¬°á*/
		private SqlSession sqlsession;
		
		private String ns = "Expenditure."; //DB Table ÀÌ¸§
		
		public List<expenditureDTO> getexpList(expenditureDTO edto) throws Exception{
			System.out.println("¹ä¸Ô"+edto.getId());
			System.out.println("¹ä¸Ô"+edto.getWdates());
			
			List<expenditureDTO> list = new ArrayList<expenditureDTO>();
			list = sqlsession.selectList(ns + "getexpList", edto);
			System.out.println("getexpList="+list.size());
			System.out.println("getexpList id="+list.get(0).getId());
			System.out.println("getexpList Moneytype="+list.get(0).getMoneytype());
			System.out.println("getexpList Price="+list.get(0).getPrice());
			System.out.println("getexpList Bcategory="+list.get(0).getBcategory());
			System.out.println("getexpList Scategory="+list.get(0).getScategory());
			System.out.println("getexpList Seq="+list.get(0).getSeq());
			System.out.println("getexpList Shopname="+list.get(0).getShopname());
			System.out.println("getexpList getWdate="+list.get(0).getWdate());
			
			return list;
		}
		
		public List<expenditureDTO> e1list() throws Exception{
			List<expenditureDTO> e1list = new ArrayList<expenditureDTO>();
			e1list = (List)sqlsession.selectList(ns + "e1list");
			return e1list;
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
			System.out.println("µ¹·Á¹ÞÀ½");
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


}
