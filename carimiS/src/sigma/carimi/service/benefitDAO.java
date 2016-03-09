package sigma.carimi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import sigma.carimi.model.benefitDTO;

@Repository
public class benefitDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns="Benefit.";
	
	public List<benefitDTO> getCBFList(benefitDTO bnfdto) throws Exception{
		List<benefitDTO> list = new ArrayList<benefitDTO>();
		list=(List<benefitDTO>)
				sqlSession.selectList(ns+"getCBFList", bnfdto);
		return list;
	}
	
	public List<benefitDTO> getCBFList(benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception{
	
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("cardname1", bnfdto.getCardname());
		hm.put("cardname2", bnfdto2.getCardname());
		hm.put("bcategory", bnfdto.getBcategory());
		
		List<benefitDTO> list = new ArrayList<benefitDTO>();
		list=(List<benefitDTO>)
				sqlSession.selectList(ns+"getCBFList2", hm);
		return list;
	}	// For making all list from two cards which are selected
	
	public benefitDTO getCBF(benefitDTO bnfdto) throws Exception{
		benefitDTO benefitDTO = (benefitDTO)sqlSession.selectOne(ns + "getCBF", bnfdto ); 
		return benefitDTO;
	}

	public List<benefitDTO> getAllCBFList(String x1, String x2) throws Exception{
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("x1", x1);
		hm.put("x2", x2);
		System.out.println("x1 = " + x1);
		System.out.println("x2 = " + x2);
		
		List<benefitDTO> list = new ArrayList<benefitDTO>();
		list=(List<benefitDTO>)
				sqlSession.selectList(ns+"getAllCBFList", hm);
		return list;
	}
	
	public boolean addCBF(benefitDTO bnfdto) throws Exception{
		sqlSession.insert(ns+"addCBF",bnfdto);
		return true;
	};
	
	public boolean deleteCBF(benefitDTO bnfdto) throws Exception{
		sqlSession.delete(ns+"delCBF", bnfdto);
		return true;
	}
//	boolean updateCBF(benefitDTO bnfdto) throws Exception;
	public List<benefitDTO> getCBFtenList(int start, int end, String x1, String x2) throws Exception{
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("start", start);
		hm.put("end", end);
		hm.put("x1", x1);
		hm.put("x2", x2);
		
		List<benefitDTO> list = new ArrayList<benefitDTO>();
		list=(List<benefitDTO>)
				sqlSession.selectList(ns+"getCBFtenListA", hm);
		
		return list;
	}
//	List<benefitDTO> getCBFtenList(int start, int end, benefitDTO bnfdto) throws Exception; // ten of one card
	public List<benefitDTO> getCBFtenList(int start, int end, benefitDTO bnfdto, benefitDTO bnfdto2) throws Exception{
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("cardname1", bnfdto.getCardname());
		hm.put("cardname2", bnfdto2.getCardname());
		hm.put("bcategory", bnfdto.getBcategory());
		hm.put("start", start);
		hm.put("end", end);

		List<benefitDTO> list = new ArrayList<benefitDTO>();
		list=(List<benefitDTO>)
				sqlSession.selectList(ns+"getCBFtenList", hm);
		return list;
	}	// ten of two cards
}
