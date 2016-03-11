package sigma.carimi.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sigma.carimi.help.cardHelp;
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
		
		List<CARDDTOSltd> CARDinformList= new ArrayList<CARDDTOSltd>();
		//List<CARDDTO> allList = (List<CARDDTO>)sqlsession.selectList(ns + "getCARDinformList", ccond);
		
		List<CARDDTO> allList = (List<CARDDTO>)sqlsession.selectList(ns + "getCARDinformList", ccond);

		System.out.println("전체 카드리스트 사이즈가 얼마나 될까???? : "+ allList.size());
		
		cardHelp ch = new cardHelp();

		for(int i=0; i<allList.size(); i++){
			CARDDTO cddto = allList.get(i);
			CARDDTOSltd cdsltd = new CARDDTOSltd();
			cdsltd.setCARDNAME(cddto.getCARDNAME());
			cdsltd.setIMG(cddto.getIMG());
			cdsltd.setSel3(ch.getCardBenefit(cddto, ccond.getC11()));
			cdsltd.setSel4(ch.getCardBenefit(cddto, ccond.getC12()));
			cdsltd.setSel5(ch.getCardBenefit(cddto, ccond.getC13()));
			cdsltd.setSel6(ch.getCardBenefit(cddto, ccond.getC14()));
			cdsltd.setSel7(ch.getCardBenefit(cddto, ccond.getC15()));
			cdsltd.setSel8(ch.getCardBenefit(cddto, ccond.getC16()));
			cdsltd.setSel1(cddto.getAFEE());
			cdsltd.setSel2(cddto.getCRIT());
			CARDinformList.add(cdsltd);
		}
		for(int i=0; i<CARDinformList.size(); i++){
			System.out.println(CARDinformList.get(i).toString());
		}
		
//		
//		String[][] cols = new String[15][2];
//		cols[0][0] = "OIL";
//		cols[1][0] = "SHOP";
//		cols[2][0] = "MART";
//		cols[3][0] = "CVS";
//		cols[4][0] = "EOU";
//		cols[5][0] = "CAFE";
//		cols[6][0] = "MOVIE";
//		cols[7][0] = "TRA";
//		cols[8][0] = "TEL";
//		cols[9][0] = "EDU";
//		cols[10][0] = "CUL";
//		cols[11][0] = "LEI";
//		cols[12][0] = "MEDI";
//		cols[13][0] = "BEA";
//		cols[14][0] = "POI";
//		for(int i=0;i<15;i++){
//			cols[i][1] = Integer.toString(i); // 0~14번까지 부여
//		}
//		String[][] names = new String[6][2];
//		names[0][0]=ccond.getC11();
//		names[1][0]=ccond.getC12();
//		names[2][0]=ccond.getC13();
//		names[3][0]=ccond.getC14();
//		names[4][0]=ccond.getC15();
//		names[5][0]=ccond.getC16();
//		for(int i=0;i<6;i++){
//			for(int j=0;j<15;j++){
//				if(cols[j][0].equals(names[i][0])){
//					names[i][1]=cols[j][1];
//				}//names에 불러와야 할 혜택들의 번호가 저장됨
//			}
//		}
//		for(int i=0;i<6;i++){
//			System.out.println(names[i][1]);
//		}
//		//CARDNAME IMG Sel1 Sel2 Sel3 Sel4 Sel5 Sel6 Sel7(afee) Sel8(crit)
//		
		return CARDinformList;
	}
}
