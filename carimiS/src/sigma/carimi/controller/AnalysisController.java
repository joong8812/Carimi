package sigma.carimi.controller;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.memberDTO;
import sigma.carimi.model.CARDDTO;
import sigma.carimi.model.CARDDTOSltd;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.expenditureDTO;
import sigma.carimi.service.CARDService;


@Controller
public class AnalysisController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private CARDService CARDService;
	
	@RequestMapping(value = "analysis.do", 
			method = RequestMethod.GET)
	public String analysis(Model model) {		
		logger.info("Welcome AnalysisController! "+ new Date());
		return "analysis.tiles";
	}
	

	@RequestMapping(value = "analysisAF1.do", 
			method = RequestMethod.POST)
	public String analysisAF(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome AnalysisAFController! "+ new Date());
		int a1 = Integer.parseInt(request.getParameter("a1"));
		int b1 = Integer.parseInt(request.getParameter("b1"));
		String[] c1ready = request.getParameterValues("c1");
		
		String c11= c1ready[0];
		String c12= c1ready[1];
		String c13= c1ready[2];
		String c14= c1ready[3];
		String c15= c1ready[4];
		String c16= c1ready[5];
		
		CARDDTOCond ccond = new CARDDTOCond();
		ccond.setA1(a1);
		ccond.setB1(b1);
		ccond.setC11(c11);
		ccond.setC12(c12);
		ccond.setC13(c13);
		ccond.setC14(c14);
		ccond.setC15(c15);
		ccond.setC16(c16);
		
		List<CARDDTOSltd> CARDinformList = CARDService.getCARDinformList(ccond);
		
		model.addAttribute("CARDinformList", CARDinformList);
		model.addAttribute("CARDinformListSize", CARDinformList.size());
		
		// 전역 변수 생성 
		   String[][] newcard = null;	// 배열로 받아서 실험을 하는데 사용
		   String[][] bnames = null;	// 혜택명 한글로 바꿀때 사용
		   Double[][] sort1 = null;
		   Double[][] sort2 = null;
		   Double[][] sort3 = null;
		   Double[][] sort4 = null;
		   Double[][] sort5 = null;
		   Double[][] sort6 = null;
		   String[][] sortname = null;
		
		
		//변수에 필요한 정보들 저장 
		 int informsize = CARDinformList.size();
		   newcard = new String[informsize][10];
		   sort1 = new Double[informsize][3];
		   sort2 = new Double[informsize][3];
		   sort3 = new Double[informsize][3];
		   sort4 = new Double[informsize][3];
		   sort5 = new Double[informsize][3];
		   sort6 = new Double[informsize][3];
		   sortname = new String[informsize][2];
	
		
    	// ########### making table ########### 
		
   		// 카드이름, 이미지주소, 연회비, 실적, 선택1, 선택2, 선택3, 선택4, 선택5, 선택6  얘네 다들 더블로 되어있다.
   		for(int i=0; i<CARDinformList.size(); i++){
    		// 인폼리스트에 있는 자료 가져오기
   			CARDDTOSltd cards = CARDinformList.get(i);
    		// newcard에 입력하는 파트  모두 문자열로 되어 있는 것을 카드이름과 이미지path만 제외하고 더블로 변환하여 저장
			newcard[i][0]=cards.getCARDNAME();
			newcard[i][1]=cards.getIMG();
			newcard[i][2]=Double.toString(cards.getSel1()); 
			newcard[i][3]=Double.toString(cards.getSel2());
			newcard[i][4]=Double.toString(cards.getSel3());
			newcard[i][5]=Double.toString(cards.getSel4());
			newcard[i][6]=Double.toString(cards.getSel5());
			newcard[i][7]=Double.toString(cards.getSel6());
			newcard[i][8]=Double.toString(cards.getSel7());
			newcard[i][9]=Double.toString(cards.getSel8());
		}
   		model.addAttribute("newcard", newcard);
		
		// 출력할 때 써먹을 카드이름 제대로 집어 넣기 얘도 전역변수 해놨다.
		// strc1 위에서 필요한 곳에서 이미 다 써서 아래 처럼 한글로 고쳐도 괜찬다.
		// strc1의 혜택 종류들 중에  bnames의 column[i][0]에 같은 이름이 있다면 column[i][1]즉 한글이름으로 바꿔준다.
		bnames = new String[][] {{"OIL","주유"},{"SHOP","쇼핑"},{"MART","대형마트"},{"CVS","편의점"},{"EOU","외식"},
					  {"CAFE","카페/베이커리"},{"MOVIE","영화관"},{"TRA","대중교통"},{"TEL","통신"},{"EDU","교육"},
					  {"CUL","문화"},{"LEI","레져"},{"MEDI","의료"},{"BEA","뷰티"},{"POI","포인트캐시백"}};
		for(int i=0;i<bnames.length;i++){
			for(int j=0;j<c1ready.length;j++){
				if(c1ready[j].equals(bnames[i][0])){
					c1ready[j]=bnames[i][1];
				}
			}
		}
		model.addAttribute("strc1", c1ready);
		model.addAttribute("strc1Length", c1ready.length);
		
		// ############################## 정렬부 ##############################
		//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
		
				// 얘를 전역변수로 넣을 수 있지
				//Double[][] sort1 = new Double[CARDinformList.size()][3];
		
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort1[i][0] = cards.getSel3();						//혜택정보:sort1[0][0]
			sort1[i][1] = 50000*1000*(cards.getSel3()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort1[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort1, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort2[i][0] = cards.getSel4();						//혜택정보:sort1[0][0]
			sort2[i][1] = 50000*1000*(cards.getSel4()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort2[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort2, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort3[i][0] = cards.getSel5();						//혜택정보:sort1[0][0]
			sort3[i][1] = 50000*1000*(cards.getSel5()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort3[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort3, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort4[i][0] = cards.getSel6();						//혜택정보:sort1[0][0]
			sort4[i][1] = 50000*1000*(cards.getSel6()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort4[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort4, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort5[i][0] = cards.getSel7();						//혜택정보:sort1[0][0]
			sort5[i][1] = 50000*1000*(cards.getSel7()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort5[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort5, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sort6[i][0] = cards.getSel8();						//혜택정보:sort1[0][0]
			sort6[i][1] = 50000*1000*(cards.getSel8()/cards.getSel1())/cards.getSel2();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
			sort6[i][2] = i+0.0;									//인덱스:sort1[0][2]
		}
		// 자바스택에서 찾아온 정렬 해보자
		Arrays.sort(sort6, new Comparator<Double[]>() {
	           public int compare(final Double[] entry1, final Double[] entry2){
	               final Double time1 = entry1[1];		//괄호에 있는 숫자로 컬럼을 설정할 수 있다. 0이면 날짜다!
	               final Double time2 = entry2[1];
	               return (-1)*time1.compareTo(time2);	//(-1) 없애주면 다시 원시정렬이 된다.
	           }
    		}
   		);
		
		for(int i=0; i<sort1.length; i++){
			System.out.println(sort1[i][1]);
		}
		model.addAttribute("sort1", sort1);
		model.addAttribute("sort1Length", sort1.length);
		model.addAttribute("sort2", sort2);
		model.addAttribute("sort2Length", sort2.length);
		model.addAttribute("sort3", sort3);
		model.addAttribute("sort3Length", sort3.length);
		model.addAttribute("sort4", sort4);
		model.addAttribute("sort4Length", sort4.length);
		model.addAttribute("sort5", sort5);
		model.addAttribute("sort5Length", sort5.length);
		model.addAttribute("sort6", sort6);
		model.addAttribute("sort6Length", sort6.length);
		
		// #################################################################
		
		//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
        for(int i=0;i<CARDinformList.size();i++){
			CARDDTOSltd cards = CARDinformList.get(i);
			sortname[i][0]= cards.getCARDNAME();
			sortname[i][1]= Integer.toString(i);
        }
        model.addAttribute("sortname", sortname);
		
		return "analysisAF.tiles";
	}
}

