package sigma.carimi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sigma.carimi.model.CARDDTO;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.CARDDTOSltd;

@Repository
public class CARDDAO {
	@Autowired 
	private SqlSession sqlsession;
	
	private String ns = "card."; 
	
	@SuppressWarnings("unchecked")
	public List<CARDDTOSltd> getCARDinformList(CARDDTOCond ccond) throws Exception{
		System.out.println("DAO : " +ccond.getA1());
		System.out.println("DAO : " +ccond.getB1());
		System.out.println("DAO : " +ccond.getC11());
		System.out.println("DAO : " +ccond.getC12());
		System.out.println("DAO : " +ccond.getC13());
		System.out.println("DAO : " +ccond.getC14());
		System.out.println("DAO : " +ccond.getC15());
		System.out.println("DAO : " +ccond.getC16());
		//여기에서 SQL때린다. sql 때릴 때 어짜피 조건들은 문자열로 넣어도 되니까 그냥 이대로 이용하자
//		String a1 = a;
//		String b1 = b;
//		String c1 = c;
//		String d1 = d;
//		String e1 = e;
//		String f1 = f;
//		int g1 = Integer.parseInt(g);
//		int h1 = Integer.parseInt(h);
		// 여기까지 잘 넘어옴
		
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//		hm.put("a1", a1);
//		hm.put("b1", b1);
//		hm.put("c1", c1);
//		hm.put("d1", d1);
//		hm.put("e1", e1);
//		hm.put("f1", f1);
//		hm.put("g1", g1);
//		hm.put("h1", h1);
		//List<CARDDTOSltd> CARDinformList = new ArrayList<CARDDTOSltd>();
		//List<CARDDTOSltd> CARDinformList;
		//CARDinformList = (List<CARDDTOSltd>)sqlsession.selectList(ns + "getCARDinformList", hm);
		//CARDinformList = (List<CARDDTOSltd>)sqlsession.selectList(ns + "getCARDinformList", ccond);
		List<CARDDTOSltd> CARDinformList = sqlsession.selectList(ns + "getCARDinformList", ccond);
		System.out.println("카드리스트 사이즈가 얼마나 될까???? : "+CARDinformList.size());
	
		
		return CARDinformList;
	}

}
