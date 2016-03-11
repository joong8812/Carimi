<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="sigma.carimi.service.*" %>
<%@page import="sigma.carimi.model.*" %>
<%@page import="sigma.carimi.controller.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분석제안</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/signin.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/dashboard.css" rel="stylesheet">

<!-- ##### ##### ##### ##### ##### Select Menu FROM Analysis.jsp ##### ##### ##### ##### ##### -->
<script>
	function imgCbox(N, tabstop) {
		var objs, cboxes, Img, Span, A;
		objs = document.getElementsByTagName("INPUT"); //인풋 이름 달린 애들
		if (N == undefined)
			return false;
		if (tabstop == undefined)
			tabstop = true;

		for (var i = 0; i < objs.length; i++) {
			if (objs[i].type != "checkbox" || objs[i].name != N)
				continue;
			if (imgCbox.Objs[N] == undefined) {
				imgCbox.Objs[N] = [];
				imgCbox.Imgs[N] = [];
				imgCbox.ImgObjs[N] = [];
			}

			var len = imgCbox.Objs[N].length;
			imgCbox.Objs[N][len] = objs[i];
			imgCbox.Imgs[N][len] = {};

			// for image cache
			(Img = new Image()).src = objs[i].getAttribute("onsrc");
			imgCbox.Imgs[N][len]["on"] = Img;

			(Img = new Image()).src = objs[i].getAttribute("offsrc");
			imgCbox.Imgs[N][len]["off"] = Img;

			// image element
			Img = document.createElement("IMG");
			Img.src = objs[i].checked ? objs[i].getAttribute("onsrc") : objs[i]
					.getAttribute("offsrc");
			Img.style.borderWidth = "0px";
			Img.onclick = new Function("imgCbox.onclick('" + N + "','" + len
					+ "')");
			imgCbox.ImgObjs[N][len] = Img;

			// anchor element for tab stop
			A = document.createElement("A");
			if (tabstop) {
				A.href = "javascript:;";
				A.onkeypress = new Function("evt",
						"if(evt==undefined)evt=event;if(evt.keyCode==13){ imgCbox.onclick('"
								+ N + "','" + len + "'); }");
			}
			A.style.borderWidth = "0px";
			A.appendChild(Img);

			// insert object
			Span = objs[i].parentNode;
			Span.style.display = "none";
			Span.parentNode.insertBefore(A, Span);
		}
	}
	imgCbox.onclick = function(N, idx) {
		var C = imgCbox.Objs[N][idx];
		var I = imgCbox.ImgObjs[N][idx];

		C.checked = !C.checked;
		I.src = imgCbox.Imgs[N][idx][C.checked ? "on" : "off"].src;
		if (C.checked) {
			divOpen('popup');

		} else
			divClose('popup');
		// fire event
		if (C.onclick != undefined || C.onclick != null)
			C.onclick();
	}
	imgCbox.Objs = {};
	imgCbox.Imgs = {};
	imgCbox.ImgObjs = {};
</script>
<!-- ##### ##### ##### ##### ##### Select Menu FROM Analysis.jsp ##### ##### ##### ##### ##### -->

</head>

<body bgcolor="white">
	


	<!-- ##### ##### ##### ##### ##### analysisAF FROM CARIMI2 ##### ##### ##### ##### ##### -->
	<%!
		String[] stra1;
		String[] strb1;
		String[] strc1;
		CARDDAO dao;
		List<CARDDTOSltd> CARDinformList;
	%>
	<%
		stra1 = request.getParameterValues("a1");		// 연회비 0
		strb1 = request.getParameterValues("b1");		// 전월 실적 0
		strc1 = request.getParameterValues("c1");		// 혜택들 6가지 0~5
		
	%>
		<H2>집중분석</H2>
		<div id="analysis">
    	</div>
    	<%
    		// 여기에서 dao의 정보들을 받아온다. 이러한 형태로 컨트롤러의 자료를 받아오면 된다.
	    	//dao = CARDDAO.getInstance();	// dao의 메소드를 불러오기 위해 인스턴스 형성
	    	//CARDinformList = dao.getCARDinformlist(strc1[0],strc1[1],strc1[2],strc1[3],strc1[4],strc1[5],stra1[0],strb1[0]);
	    	// 위의 조건을 불러 일으킨 녀석을 그냥 불러와서 쓰면 될 것 같은데 ...
    	%>
		총 <%= CARDinformList.size() %> 개의 카드가 검색되었습니다.
		<br><br>
		<!-- 전역 변수 생성 -->
		<%!int informsize;
		   CARDDTOSltd cards;			// 카드 혜택 정보 뿌릴때 사용
		   String[][] newcard = null;	// 배열로 받아서 실험을 하는데 사용
		   String[][] bnames = null;	// 혜택명 한글로 바꿀때 사용
		   Double[][] sort1 = null;
		   Double[][] sort2 = null;
		   Double[][] sort3 = null;
		   Double[][] sort4 = null;
		   Double[][] sort5 = null;
		   Double[][] sort6 = null;
		   String[][] sortname = null;
		 %>
		
		<!-- 변수에 필요한 정보들 저장 -->
		<% informsize = CARDinformList.size();
		   newcard = new String[informsize][10];
		   sort1 = new Double[informsize][3];
		   sort2 = new Double[informsize][3];
		   sort3 = new Double[informsize][3];
		   sort4 = new Double[informsize][3];
		   sort5 = new Double[informsize][3];
		   sort6 = new Double[informsize][3];
		   sortname = new String[informsize][2];
		%>
		
    	<!-- ########### making table ########### -->
		<%
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
		
		// 출력할 때 써먹을 카드이름 제대로 집어 넣기 얘도 전역변수 해놨다.
		// strc1 위에서 필요한 곳에서 이미 다 써서 아래 처럼 한글로 고쳐도 괜찬다.
		// strc1의 혜택 종류들 중에  bnames의 column[i][0]에 같은 이름이 있다면 column[i][1]즉 한글이름으로 바꿔준다.
		bnames = new String[][] {{"OIL","주유"},{"SHOP","쇼핑"},{"MART","대형마트"},{"CVS","편의점"},{"EOU","외식"},
					  {"CAFE","카페/베이커리"},{"MOVIE","영화관"},{"TRA","대중교통"},{"TEL","통신"},{"EDU","교육"},
					  {"CUL","문화"},{"LEI","레져"},{"MEDI","의료"},{"BEA","뷰티"},{"POI","포인트캐시백"}};
		for(int i=0;i<bnames.length;i++){
			for(int j=0;j<strc1.length;j++){
				if(strc1[j].equals(bnames[i][0])){
					strc1[j]=bnames[i][1];
				}
			}
		}
   		%>
		<%
		if(strc1.length==6){
			out.print("선택한 혜택 : ");
		    for(int i=0; i<strc1.length; i++){
		    	out.print(i+1+". "+ strc1[i] + "  ");
		    }
		    out.println("<br><br>");
	  	}
		%>
	<!-- ##### ##### ##### ##### ##### analysisAF FROM CARIMI2 ##### ##### ##### ##### ##### -->

	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span12">
						<div class="widget">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>혜택 정보 팡팡!</h3>
							</div>
							<div class="control-group">
								<FORM ACTION="analysisAF.do" METHOD="POST"
									onsubmit="return check()">
									<div class="controls">
										<div class="accordion" id="accordion2">
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion2" href="#collapseOne"> 연회비와
														실적기준을 선택해주세요 </a>
												</div>
												<div id="collapseOne" class="accordion-body collapse in">
													<div class="accordion-inner" style="text-align: center;">

														<span><input type="checkbox" name="a1" value="0"
															offsrc="/CarimiS/image/analysis/an_1.png"
															onsrc="/CarimiS/image/analysis/an_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only1(this)"
															type="checkbox" name="a1" value="5000" checked="checked"
															offsrc="/CarimiS/image/analysis/an_2.png"
															onsrc="/CarimiS/image/analysis/an_2_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only1(this)"
															type="checkbox" name="a1" value="10000"
															offsrc="/CarimiS/image/analysis/an_3.png"
															onsrc="/CarimiS/image/analysis/an_3_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only1(this)"
															type="checkbox" name="a1" value="15000"
															offsrc="/CarimiS/image/analysis/an_4.png"
															onsrc="/CarimiS/image/analysis/an_4_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only1(this)"
															type="checkbox" name="a1" value="20000"
															offsrc="/CarimiS/image/analysis/an_5.png"
															onsrc="/CarimiS/image/analysis/an_5_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only1(this)"
															type="checkbox" name="a1" value="1"
															offsrc="/CarimiS/image/analysis/an_6.png"
															onsrc="/CarimiS/image/analysis/an_6_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<script>
															imgCbox("a1");
														</script>
														<script>
															chk_only1("a1")
														</script>
														<br> <br> <span><input
															onclick="chk_only2(this)" type="checkbox" name="b1"
															value="0" offsrc="/CarimiS/image/analysis/an_1.png"
															onsrc="/CarimiS/image/analysis/an_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="100000"
															offsrc="/CarimiS/image/analysis/an_s_1.png"
															onsrc="/CarimiS/image/analysis/an_s_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="200000"
															offsrc="/CarimiS/image/analysis/an_s_2.png"
															onsrc="/CarimiS/image/analysis/an_s_2_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="300000"
															offsrc="/CarimiS/image/analysis/an_s_3.png"
															onsrc="/CarimiS/image/analysis/an_s_3_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="400000"
															offsrc="/CarimiS/image/analysis/an_s_4.png"
															onsrc="/CarimiS/image/analysis/an_s_4_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="500000"
															checked="checked"
															offsrc="/CarimiS/image/analysis/an_s_5.png"
															onsrc="/CarimiS/image/analysis/an_s_5_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_only2(this)"
															type="checkbox" name="b1" value="1"
															offsrc="/CarimiS/image/analysis/an_6.png"
															onsrc="/CarimiS/image/analysis/an_6_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<script>
															imgCbox("b1");
														</script>

													</div>
												</div>
											</div>
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion2" href="#collapseTwo"> 비교하고 싶은
														혜택 6개를 선택하세요 </a>
												</div>
												<div id="collapseTwo" class="accordion-body collapse in">
													<div class="accordion-inner">
														<p style="text-align: center;">
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="bea" checked="checked"
																offsrc="/CarimiS/image/benefits/bea_off.png"
																onsrc="/CarimiS/image/benefits/bea_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="cafe" checked="checked"
																offsrc="/CarimiS/image/benefits/cafe_off.png"
																onsrc="/CarimiS/image/benefits/cafe_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="cul" checked="checked"
																offsrc="/CarimiS/image/benefits/cul_off.png"
																onsrc="/CarimiS/image/benefits/cul_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="cvs" checked="checked"
																offsrc="/CarimiS/image/benefits/cvs_off.png"
																onsrc="/CarimiS/image/benefits/cvs_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="edu" checked="checked"
																offsrc="/CarimiS/image/benefits/edu_off.png"
																onsrc="/CarimiS/image/benefits/edu_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="eou" checked="checked"
																offsrc="/CarimiS/image/benefits/eou_off.png"
																onsrc="/CarimiS/image/benefits/eou_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="lei"
																offsrc="/CarimiS/image/benefits/lei_off.png"
																onsrc="/CarimiS/image/benefits/lei_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="mart"
																offsrc="/CarimiS/image/benefits/mart_off.png"
																onsrc="/CarimiS/image/benefits/mart_on.png"></span> <br>
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="medi"
																offsrc="/CarimiS/image/benefits/medi_off.png"
																onsrc="/CarimiS/image/benefits/medi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="movie"
																offsrc="/CarimiS/image/benefits/movie_off.png"
																onsrc="/CarimiS/image/benefits/movie_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="oil"
																offsrc="/CarimiS/image/benefits/oil_off.png"
																onsrc="/CarimiS/image/benefits/oil_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="poi"
																offsrc="/CarimiS/image/benefits/poi_off.png"
																onsrc="/CarimiS/image/benefits/poi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="shop"
																offsrc="/CarimiS/image/benefits/shop_off.png"
																onsrc="/CarimiS/image/benefits/shop_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="tel"
																offsrc="/CarimiS/image/benefits/tel_off.png"
																onsrc="/CarimiS/image/benefits/tel_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span><input onclick="chk_six(this)"
																type="checkbox" name="c1" value="tra"
																offsrc="/CarimiS/image/benefits/tra_off.png"
																onsrc="/CarimiS/image/benefits/tra_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<script>
																imgCbox("c1");
															</script>
															<input type="submit" class="btn" value="분석!">
														</p>
													</div>
													
												</div>
												
											</div>
											<!-- ##### ##### ##### Drawing GRAPHS HERE ##### ##### ##### -->
											
											<script type="text/javascript">
			$(function () {
				// ############################################# 1번 혜택 #############################################
				$('#container1').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[0]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort1[i][0] = cards.getSel3();						//혜택정보:sort1[0][0]
											sort1[i][1] = 1000*cards.getSel3()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort1[i][1]+",");
						      				}else{
						      					out.print(" "+sort1[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[0]%>',
			            data: [
								<%	
									for(int i=0;i<sort1.length;i++){
										if(i!=sort1.length-1){
	                      					out.print(" {y:"+sort1[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort1[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                      	   }
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort1[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort1[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너1 닫는 곳 
				
				//############################################# 2번째 혜택 #############################################
				$('#container2').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[1]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort2[i][0] = cards.getSel4();						//혜택정보:sort1[0][0]
											sort2[i][1] = 1000*cards.getSel4()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort2[i][1]+",");
						      				}else{
						      					out.print(" "+sort2[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[1]%>',
			            data: [
								<%	
									for(int i=0;i<sort2.length;i++){
										if(i!=sort2.length-1){
	                      					out.print(" {y:"+sort2[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort2[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                       		}
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort2[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort2[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너2 닫는 곳 
				//############################################# 3번째 혜택 #############################################
				$('#container3').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[2]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort3[i][0] = cards.getSel5();						//혜택정보:sort1[0][0]
											sort3[i][1] = 1000*cards.getSel5()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort3[i][1]+",");
						      				}else{
						      					out.print(" "+sort3[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[2]%>',
			            data: [
								<%	
									for(int i=0;i<sort3.length;i++){
										if(i!=sort3.length-1){
	                      					out.print(" {y:"+sort3[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort3[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                       		}
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort3[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort3[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너3 닫는 곳 
				//############################################# 4번째 혜택 #############################################
				$('#container4').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[3]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort4[i][0] = cards.getSel6();						//혜택정보:sort1[0][0]
											sort4[i][1] = 1000*cards.getSel6()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort4[i][1]+",");
						      				}else{
						      					out.print(" "+sort4[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[3]%>',
			            data: [
								<%	
									for(int i=0;i<sort4.length;i++){
										if(i!=sort4.length-1){
	                      					out.print(" {y:"+sort4[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort4[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                      	   }
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort4[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort4[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너4 닫는 곳 
				//############################################# 5번째 혜택 #############################################
				$('#container5').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[4]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort5[i][0] = (double)cards.getSel7();						//혜택정보:sort1[0][0]
											sort5[i][1] = 1000*cards.getSel7()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort5[i][1]+",");
						      				}else{
						      					out.print(" "+sort5[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[4]%>',
			            data: [
								<%	
									for(int i=0;i<sort5.length;i++){
										if(i!=sort5.length-1){
	                      					out.print(" {y:"+sort5[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort5[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	//배열에 이름과 숫자를 집어 넣는다. [0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                      	   }
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort5[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort5[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너5 닫는 곳 
				//############################################# 6번째 혜택 #############################################
				$('#container6').highcharts({
					chart: {
			            type: 'column',
			            margin: 120,
			            options3d: {
			                enabled: true,
			                alpha: 15,
			                beta: 15,
			                viewDistance: 25,
			                depth: 40
			            },
						marginTop: 80,
			            marginRight: 50,
			            marginLeft: 50,
			            colorByPoint: true
			        },
			        title: {
			            text: '<b><%=strc1[5]%> 혜택</b>'// 이거도 자동으로 들어가도록				
			        },
			        subtitle: {
			            text: ' --- 텍스트 입력 ---'
			        },
			        
			        tooltip: {
			            headerFormat: '<b>{point.key}</b><br>',
			            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
			            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
			        },
			        
			        plotOptions: {
			            column: {
			            	stacking: 'normal',
			            	depth: 25
			            }
			        }
			        ,
			        
			        yAxis: {
			            title: {
			                text: null
			            }
			        },
			        series: [
						//#################### 원본값/연회비 자료 ####################
		                 {
							colorByPoint:'true',
						    name: '연회비 1000원 당 혜택',
						    data: [
									<%
										// ############################## 정렬부 ##############################
										//sort1[0][0] 혜택정보:sort1[0][0] 혜택정보를 연회비로 나눈 값:sort1[0][1] 인덱스:sort1[0][2]  
										
												// 얘를 전역변수로 넣을 수 있지
												//Double[][] sort1 = new Double[CARDinformList.size()][3];
										
										for(int i=0;i<CARDinformList.size();i++){
											CARDDTOSltd cards = CARDinformList.get(i);
											sort6[i][0] = (double)cards.getSel8();						//혜택정보:sort1[0][0]
											sort6[i][1] = 1000*cards.getSel8()/cards.getSel1();	//혜택정보를 연회비로 나눈 값:sort1[0][1]
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
										
										// #################################################################
							            
										// ##############################정렬 된것을 여기서 플롯 ##############################
										for(int i=0;i<CARDinformList.size();i++){
						           			if(i!=CARDinformList.size()-1){
						      					out.print(" "+sort6[i][1]+",");
						      				}else{
						      					out.print(" "+sort6[i][1]+" ");
						      				}
						  				}
										// ##########################################################################
										
									%>
								  ],
							stack:'secondary'
						},
						// #################### 원본값 자료 ####################    
			            {
			        	colorByPoint:'true',
			            name: '<%=strc1[5]%>',
			            data: [
								<%	
									for(int i=0;i<sort6.length;i++){
										if(i!=sort6.length-1){
	                      					out.print(" {y:"+sort6[i][0]+",color:'#DDDCFE'},");
	                      				}else{
	                      					out.print(" {y:"+sort6[i][0]+"} ");
	                      				}
	                  				}
								
								%>
							  ],
			        	stack:'primary',
			        	}
					], //여기가 시리즈 닫는 곳
					xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
			        	categories: [//문자열, 반드시 작은 따옴표로 안아라
 			                        <%	
 			                        	//배열에 이름과 숫자를 집어 넣는다. sortname[0][0]:카드이름, [0][1]:인덱스번호
	 			                       for(int i=0;i<CARDinformList.size();i++){
			                       			CARDDTOSltd cards = CARDinformList.get(i);
			                       			sortname[i][0]= cards.getCARDNAME();
			                       			sortname[i][1]= Integer.toString(i);
			                      	   }
 			                       	   
 			                           for(int i=0;i<CARDinformList.size();i++){
 			                       			if(i!=CARDinformList.size()-1){
			                      				out.print(" '"+sortname[sort6[i][2].intValue()][0]+"',");
			                      			}else{
			                      				out.print(" '"+sortname[sort6[i][2].intValue()][0]+"'");
			                      			}
			                      	   }
 			                      	%>
 			                       	]
			        }
			    });	// 컨테이너6 닫는 곳 
			});// 여까가 제일 최종 껍데기인 function의 괄호를 닫는 부분. 이 바로 윗줄까지만 긁어서 복사해라
				
	</script>
	<div class="main">
	<div class="main-inner">
	
	      <div class="row">
	      <div class="span12">      		
	   	  <div class="widget widget-table action-table">
     
            <!-- /widget-header -->
            <div class="widget-content">
            <table class="table table-striped table-bordered">
	      	<table border="1" style="width:100%">
	<tr align="center" style="font-size:12px;">
	<td><b><%=strc1[0]%>&nbsp 1위</b></td>
	<td><b><%=strc1[1]%>&nbsp 1위</b></td>
	<td><b><%=strc1[2]%>&nbsp 1위</b></td>
	<td><b><%=strc1[3]%>&nbsp 1위</b></td>
	<td><b><%=strc1[4]%>&nbsp 1위</b></td>
	<td><b><%=strc1[5]%>&nbsp 1위</b></td>
	</tr>
	<tr align="center" style="font-size:12px;">
	<td><font color=red><b><%out.println(sortname[sort1[0][2].intValue()][0]);%></b></font></td>
	<td><font color=orange><b><%out.println(sortname[sort2[0][2].intValue()][0]);%></b></font></td>
	<td><font color=lightbrown><b><%out.println(sortname[sort3[0][2].intValue()][0]);%></b></font></td>
	<td><font color=green><b><%out.println(sortname[sort4[0][2].intValue()][0]);%></b></font></td>
	<td><font color=blue><b><%out.println(sortname[sort5[0][2].intValue()][0]);%></b></font></td>
	<td><font color=purple><b><%out.println(sortname[sort6[0][2].intValue()][0]);%></b></font></td>
	</tr>
	<tr>
	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort1[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort2[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort3[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort4[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort5[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	<%for(int i=0;i<CARDinformList.size();i++){
 		if(newcard[i][0].equals(sortname[sort6[0][2].intValue()][0])){
 	%><td><img src="<%=newcard[i][1]%>" style="width:120px"></td><%
 		}
 	}%>
 	
	</tr>
	</table>
	      </div>
	      </div>
	      </div>
	      
	 	  <div class="span6">      		
	   <div class="widget widget-table action-table">
     
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
	
	<!-- ########## 혜택 1 ########## -->
			<tr>
				<th width="150"><%out.println(" "+strc1[0]+"혜택 1위!! : <br>"+sortname[sort1[0][2].intValue()][0]);%></th>
				<th width="200">
		 		<%for(int i=0;i<CARDinformList.size();i++){
		 			if(newcard[i][0].equals(sortname[sort1[0][2].intValue()][0])){
		 		%><img src="<%=newcard[i][1]%>" style="width:190px"><%
		 				}
		 		}%>
				</th>
				<th width="380">
				<%for(int i=0;i<CARDinformList.size();i++){
		 			if(newcard[i][0].equals(sortname[sort1[0][2].intValue()][0])){
		 		%>
				연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
				기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
				대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
				연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
				<%}}%>
		 		</th>
			</tr>
			<tr>
				<td colspan="3">
				<div id="container1" style="height:400px"></div>
				</td>
			</tr>
	
	<!-- ########## 혜택 2 ########## -->
			<tr>
				<th width="150"><%out.println(" "+strc1[1]+"혜택 1위!! : <br>"+sortname[sort2[0][2].intValue()][0]);%></th>
				<th width="200">
		 		<%for(int i=0;i<CARDinformList.size();i++){
		 			if(newcard[i][0].equals(sortname[sort2[0][2].intValue()][0])){
		 		%> <img src="<%=newcard[i][1]%>" style="width:190px" ><%
		 				}
		 		}%>
				</th>
				<th width="380">
				<%for(int i=0;i<CARDinformList.size();i++){
		 			if(newcard[i][0].equals(sortname[sort2[0][2].intValue()][0])){
		 		%>
				연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
				기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
				대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
				연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
				<%}}%>
		 		</th>
			</tr>
			<tr>
				<td colspan="3">
				<div id="container3" style="height:400px"></div>
				</td>
			</tr>
	
	<!-- ########## 혜택 3 ########## -->
		<tr>
			<th width="150"><%out.println(" "+strc1[2]+"혜택 1위!! : <br>"+sortname[sort3[0][2].intValue()][0]);%></th>
			<th width="200">
	 		<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort3[0][2].intValue()][0])){
	 		%> <img src="<%=newcard[i][1]%>" style="width:190px" ><%
	 				}
	 		}%>
			</th>
			<th width="380">
			<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort3[0][2].intValue()][0])){
	 		%>
			연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
			기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
			대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
			연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
			<%}}%>
	 		</th>
		</tr>
		<tr>
			<td colspan="3">
			<div id="container4" style="height:400px"></div>
			</td>
		</tr>
		</table>
			</div>
		<!--/widget content  -->
		</div>
		<!--/widget -->
		</div>
		<!--span  -->
		<div class="span6">      		
		           	<div class="widget widget-table action-table">
	     
	            <!-- /widget-header -->
	            <div class="widget-content">
	              <table class="table table-striped table-bordered">
		
	<!-- ########## 혜택 4 ########## -->
		<tr>
			<th width="150"><%out.println(" "+strc1[3]+"혜택 1위!! : <br>"+sortname[sort4[0][2].intValue()][0]);%></th>
			<th width="200">
	 		<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort4[0][2].intValue()][0])){
	 		%> <img src="<%=newcard[i][1]%>" style="width:190px" ><%
	 				}
	 		}%>
			</th>
			<th width="380">
			<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort4[0][2].intValue()][0])){
	 		%>
			연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
			기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
			대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
			연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
			<%}}%>
	 		</th>
		</tr>
		<tr>
			<td colspan="3">
			<div id="container2" style="height:400px"></div>
			</td>
		</tr>
	
	<!-- ########## 혜택 5 ########## -->
		<tr>
			<th width="150"><%out.println(" "+strc1[4]+"혜택 1위!! : <br>"+sortname[sort5[0][2].intValue()][0]);%></th>
			<th width="200">
	 		<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort5[0][2].intValue()][0])){
	 		%> <img src="<%=newcard[i][1]%>" style="width:190px" ><%
	 				}
	 		}%>
			</th>
			<th width="380">
			<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort5[0][2].intValue()][0])){
	 		%>
			연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
			기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
			대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
			연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
			<%}}%>
	 		</th>
		</tr>
		<tr>
			<td colspan="3">
			<div id="container5" style="height:400px"></div>
			</td>
		</tr>
	<!-- ########## 혜택 6 ########## -->
		<tr>
			<th width="150"><%out.println(" "+strc1[5]+"혜택 1위!! : <br>"+sortname[sort6[0][2].intValue()][0]);%></th>
			<th width="200">
	 		<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort6[0][2].intValue()][0])){
	 		%> <img src="<%=newcard[i][1]%>" style="width:190px" ><%
	 				}
	 		}%>
			</th>
			<th width="380">
			<%for(int i=0;i<CARDinformList.size();i++){
	 			if(newcard[i][0].equals(sortname[sort6[0][2].intValue()][0])){
	 		%>
			연회비 : <%=(int)Double.parseDouble(newcard[i][2])%> <br>
			기준실적 : <%=(int)Double.parseDouble(newcard[i][3])%><br>
			대중교통혜택 : <%=(int)Double.parseDouble(newcard[i][4])%><br>
			연회비 1000원당 혜택 : <%=1000*Double.parseDouble(newcard[i][4])/Double.parseDouble(newcard[i][2])%>
			<%}}%>
	 		</th>
		</tr>
		<tr>
			<td colspan="3">
			<div id="container6" style="height:400px"></div>
			</td>
		</tr>
	</table>
									<!-- ##### ##### ##### Drawing GRAPHS HERE ##### ##### ##### -->
									
									
									
										</div>
										
									</div>
									
									<!-- /controls -->
								</FORM>
								
							</div>
							
							<!-- /control-group -->
						</div>
						
						<!--/span5  -->
					</div>
					
				</div>
				
				<!-- /row -->
			</div>
			
			<!-- /container -->
		</div>
		
		<!-- /main-inner -->
	</div>
	
	<!-- /main -->

	<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/signin.js"></script>
</body>
</html>

