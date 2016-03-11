<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
 <head>
    <meta charset="utf-8">
    <title>Signup - Bootstrap Admin Template</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/signin.css" rel="stylesheet" type="text/css">
<style>

#location1{display:none;float:none;margin:0px 0;line-height:0} 
#location1.open{display:block}
#location1.close{display:none; float:none;margin:0px 0;line-height:0}
#location2{display:none;float:none;margin:0px 0;line-height:0} 
#location2.open{display:block}
#location2.close{display:none; float:none;margin:0px 0;line-height:0}
#location3{display:none;float:none;margin:0px 0;line-height:0} 
#location3.open{display:block}
#location3.close{display:none; float:none;margin:0px 0;line-height:0}
#location4{display:none;float:none;margin:0px 0;line-height:0} 
#location4.open{display:block}
#location4.close{display:none; float:none;margin:0px 0;line-height:0}
#location5{display:none;float:none;margin:0px 0;line-height:0} 
#location5.open{display:block}
#location5.close{display:none; float:none;margin:0px 0;line-height:0}
#location6{display:none;float:none;margin:0px 0;line-height:0} 
#location6.open{display:block}
#location6.close{display:none; float:none;margin:0px 0;line-height:0}
#location7{display:none;float:none;margin:0px 0;line-height:0} 
#location7.open{display:block}
#location7.close{display:none; float:none;margin:0px 0;line-height:0}
#location8{display:none;float:none;margin:0px 0;line-height:0} 
#location8.open{display:block}
#location8.close{display:none; float:none;margin:0px 0;line-height:0}
#location9{display:none;float:none;margin:0px 0;line-height:0} 
#location9.open{display:block}
#location9.close{display:none; float:none;margin:0px 0;line-height:0}
#location10{display:none;float:none;margin:0px 0;line-height:0} 
#location10.open{display:block}
#location10.close{display:none; float:none;margin:0px 0;line-height:0}
#location11{display:none;float:none;margin:0px 0;line-height:0} 
#location11.open{display:block}
#location11.close{display:none; float:none;margin:0px 0;line-height:0}
#location12{display:none;float:none;margin:0px 0;line-height:0} 
#location12.open{display:block}
#location12.close{display:none; float:none;margin:0px 0;line-height:0}
#location13{display:none;float:none;margin:0px 0;line-height:0} 
#location13.open{display:block}
#location13.close{display:none; float:none;margin:0px 0;line-height:0}
#location14{display:none;float:none;margin:0px 0;line-height:0} 
#location14.open{display:block}
#location14.close{display:none; float:none;margin:0px 0;line-height:0}
#location15{display:none;float:none;margin:0px 0;line-height:0} 
#location15.open{display:block}
#location15.close{display:none; float:none;margin:0px 0;line-height:0}
#location16{display:none;float:none;margin:0px 0;line-height:0} 
#location16.open{display:block}
#location16.close{display:none; float:none;margin:0px 0;line-height:0}
</style>
</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="javascript:navClick('nav_main', 'main.do')">
				C A R I M I			
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="">						
						<a href="login.do" class="">
							Already have an account? Login now
						</a>
						
					</li>
					<li class="">						
						<a href="javascript:navClick('nav_main', 'main.do')" class="">
							<i class="icon-chevron-left"></i>
							Back to Homepage
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<<<<<<< .mine
<div class="account-container register" >
=======
<div class="account-container register" style="width:90%">
>>>>>>> .r40
	
	<div class="content clearfix">
		
		<form name="addjoin" action="signAf.do" method="post">
		
			<h1>Signup for Free Account</h1>			
			
			<div class="login-fields">
				
				<p>Create your free account:</p>
				
						
				<div class="field">
					<label for="usr">ID : </label>
    				<input type="text" class="login" id="id" name="id" placeholder="ID">
    			</div>
    			<div class="field">
					<label for="pwd">Password:</label>
					<input type="password" class="login" name="pwd" id="pwd" placeholder="Password">
				</div>
				<div class="field">							
					<label for="name">이름 : </label>
					<input type="text" class="login" id="name" name="name" placeholder="User Name"/>
				</div>
				
				<div class="field">							
					<label for="age">나이 : </label>
					<input type="text" class="login" id="age" name="age" placeholder="Age"/>
				</div>
				<div class="field">
					<label for="email">Email : </label>
    				<input type="text" class="form-control" name="email" id="email" placeholder="E-Mail">
				</div>		
				<div class="field">	
					<p>성별</p>
					<div class="pull-left">
				<span class="login-checkbox">
					<input onclick="chk_only2(this)" id="Field24" name="sex" type="checkbox" class="field login-checkbox" value="man" />
					<label class="choice" for="Field24">남자</label>
				</span>
				</div>
				<div class="pull-right">
				<span class="login-checkbox"  >
					<input onclick="chk_only2(this)" id="Field34" name="sex" type="checkbox" class="field login-checkbox" value="woman"/>
					<label class="choice" for="Field34">여자</label>
				</span>
				</div>
				</div>
				<br>
					<div class="field">
						<p class="pull-left">보유카드1</p>
    							<div class="pull-right">
								<select class="form-control" id="mycard1" name="mycard1" >
									<option>미보유</option>
									<option value="shin1">신한1</option>
									<option value="shin2">신한2</option>
									<option value="guk1">국민1</option>
									<option value="guk2">국민2</option>
									<option value="uri1">우리1</option>
									<option value="uri2">우리2</option>
									<option value="ha1">하나1</option>
									<option value="ha2">하나2</option>
									<option value="lot1">롯데1</option>
									<option value="lot2">롯데2</option>
									<option value="sam1">삼성1</option>
									<option value="sam2">삼성2</option>
									<option value="nong1">농협1</option>
									<option value="nong2">농협2</option>
									<option value="gi1">기업1</option>
									<option value="gi2">기업2</option>
									<option value="ci1">씨티1</option>
									<option value="ci2">씨티2</option>
								</select>
								</div>
							</div>
							<br>
					
							
							<div class="field">
								<p class="pull-left">보유카드2</p>
    							
    							<div class="pull-right">
								<select class="form-control" id="mycard2" name="mycard2" >
									<option>미보유</option>
									<option value="shin1">신한1</option>
									<option value="shin2">신한2</option>
									<option value="guk1">국민1</option>
									<option value="guk2">국민2</option>
									<option value="uri1">우리1</option>
									<option value="uri2">우리2</option>
									<option value="ha1">하나1</option>
									<option value="ha2">하나2</option>
									<option value="lot1">롯데1</option>
									<option value="lot2">롯데2</option>
									<option value="sam1">삼성1</option>
									<option value="sam2">삼성2</option>
									<option value="nong1">농협1</option>
									<option value="nong2">농협2</option>
									<option value="gi1">기업1</option>
									<option value="gi2">기업2</option>
									<option value="ci1">씨티1</option>
									<option value="ci2">씨티2</option>
								</select>
								</div>
								</div>
    							<br>
    							
    							<div class="field">
    							<p class="pull-left">직업</p>
    							<div class="pull-right">
								<select class="form-control" id="job" name="job" >
									<option value="cs">회사원</option>
									<option value="ue">무직</option>
									<option value="svc">서비스</option>
									<option value="std">학생</option>
									<option value="se">자영업</option>
									<option value="sd">군인</option>
									<option value="po">공무원</option>
									<option value="pf">전문직</option>
									<option value="hw">주부</option>
									<option value="etc">기타</option>
								</select>
								</div>
					</div>
					<br>
					
					<div class="field">
						<p class="pull-left">지역</p>
						<div class="pull-right">
					<select  id="local" name="local" >
						<option value="non">지역선택</option>
						<option value="seoul">서울</option>	<option value="incheon">인천</option>	<option value="busan">부산</option>
						<option value="daejeon">대전</option>	<option value="daegu">대구</option>	<option value="ulsan">울산</option>
						<option value="gwangju">광주</option>	<option value="sejong">세종</option>	<option value="gg">경기</option>
						<option value="gangwon">강원</option>		<option value="chungnam">충남</option>	<option value="chungbuk">충북</option>
						<option value="jeonnam">전남</option>		<option value="jeonbuk">전북</option>	<option value="gyeongnam">경남</option>
						<option value="gyeongbuk">경북</option>	<option value="jeju">제주</option>
					</select>
					</div>
				</div>	
				<br>
				
						<div id="location1">
							
									<p class="pull-left">지역구(서울)</p>
    							<div class="pull-right">
    							<select class="form-control" id="loca1" name="location" >
									<option value="gangnam">강남구</option>
									<option value="gangdong">강동구</option>		
									<option value="gangbuk">강북구</option>		
									<option value="gangseo">강서구</option>		
									<option value="gwanak">관악구</option>	
									<option value="guro">구로구</option>		
									<option value="gwangjin">광진구</option>
									<option value="geuncheon">금천구</option>
									<option value="nowon">노원구</option>
									<option value="dobong">도봉구</option>
									<option value="dongjak">동작구</option>
									<option value="ddm">동대문구</option>
									<option value="mapo">마포구</option>
									<option value="sdm">서대문구</option>
									<option value="seocho">서초구</option>	
									<option value="sd">성동구</option>
									<option value="seongbuk">성북구</option>
									<option value="songpa">송파구</option>
									<option value="yangcheon">양천구</option>	
									<option value="yongsan">용산구</option>	
									<option value="ydp">영등포구</option>	
									<option value="ep">은평구</option>	
									<option value="junggu">중구</option>
									<option value="jungrang">중랑구</option>
									<option value="jongro">종로구</option>
								</select>
								</div>
								</div>
								
								
								
									
								<div id="location2">
									<p class="pull-left">지역구(인천)</p>
									<div class="pull-right">
    							<select class="form-control" id="loca2" name="location" >
									<option value="ganghwa">강화군</option>
									<option value="gyeyang">계양군</option>
									<option value="nam">남구</option>
									<option value="namdong">남동구</option>
									<option value="dong">동구</option>
									<option value="bupyeong">부평구</option>
									<option value="seo">서구</option>
									<option value="yeonsu">연수구</option>
									<option value="ongjin">옹진군</option>
									<option value="junggu">중구</option>
								</select>
								</div>
								</div>
								<div id="location3">
								<p class="pull-left">지역구(부산)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca3" name="location" >
									<option value="gangseo">강서구</option>
									<option value="geumjeong">금정구</option>
									<option value="gijang">기장</option>
									<option value="nam">남구</option>
									<option value="dong">동구</option>
									<option value="dongnae">동래구</option>
									<option value="busanjin">부산진구</option>
									<option value="buk">북구</option>
									<option value="sasang">사상구</option>
									<option value="saha">사하구</option>
									<option value="seo">서구</option>
									<option value="suyeong">수영구</option>
									<option value="yeonje">연제구</option>
									<option value="yeongdo">영도구</option>
									<option value="jung">중구</option>
									<option value="haeundae">해운대구</option>
								</select>
								</div>
								</div>
								<div id="location4">
								<p class="pull-left">지역구(대전)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca4" name="location" >
									<option value="dong">동구</option>
									<option value="jung">중구</option>
									<option value="seo">서구</option>
									<option value="yuseong">유성</option>
									<option value="daedeok">대덕구</option>
								</select>
								</div>
								</div>
								<div id="location5">
								<p class="pull-left">지역구(대구)</p>
								
								<div class="pull-right">
    							<select class="form-control"  id="loca5"name="location" >
									<option value="dong">동구</option>
									<option value="jung">중구</option>
									<option value="seo">서구</option>
									<option value="nam">남구</option>
									<option value="buk">북구</option>
									<option value="suseong">수성구</option>
									<option value="dalseo">달서구</option>
									<option value="dalseong">달성군</option>
								</select>
								</div>
								</div>
								<div id="location6">
								<p class="pull-left">지역구(울산)</p>
								<div class="pull-right">
    							<select class="form-control"  id="loca6"name="location" >
									<option value="dong">동구</option>
									<option value="jung">중구</option>
									<option value="nam">남구</option>
									<option value="buk">북구</option>
									<option value="ulju">울주군</option>									
								</select>
								</div>
								</div>
								<div id="location7">
								<p class="pull-left">지역구(광주)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca7" name="location" >
									<option value="dong">동구</option>
									<option value="seo">서구</option>
									<option value="nam">남구</option>
									<option value="buk">북구</option>
									<option value="gwangsan">광산구</option>									
								</select>
								</div>
								</div>
								<div id="location8">
								<p class="pull-left">지역구(경기)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca8" name="location" >
									<option value="gapyeong">가평군</option>
									<option value="goyang">고양시</option>
									<option value="gwacheon">과천시</option>
									<option value="gwangmyeong">광명시</option>
									<option value="gwangju">광주시</option>
									<option value="guri">구리시</option>
									<option value="gunpo">군포시</option>
									<option value="gimpo">김포시</option>
									<option value="namyangju">남양주시</option>
									<option value="dondducheon">동두천시</option>
									<option value="bucheon">부천시</option>
									<option value="seongnam">성남시</option>
									<option value=suwon>수원시</option>
									<option value="siheung">시흥시</option>
									<option value="ansan">안산시</option>
									<option value="ansung">안성시</option>
									<option value="anyang">안양시</option>
									<option value="yangju">양주시</option>
									<option value="yangpyeong">양평시</option>
									<option value="yeoju">여주시</option>
									<option value="yeoncheon">연천시</option>
									<option value="osan">오산시</option>
									<option value="yongin">용인시</option>
									<option value="uiwang">의왕시</option>
									<option value="uijeongbu">의정부시</option>
									<option value="icheon">이천시</option>
									<option value="paju">파주시</option>
									<option value="pyeongtaek">평택시</option>
									<option value="pocheon">포천시</option>
									<option value="hanam">하남시</option>
									<option value="hwaseong">화성시</option>									
								</select>
								</div>
								</div>
								<div id="location9">
								<p class="pull-left">지역구(강원)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca9" name="location" >
									<option value="gangneung">강릉시</option>
									<option value="goseong">고성군</option>
									<option value="donghae">동해시</option>
									<option value="samcheok">삼척시</option>
									<option value="sokcho">속초군</option>
									<option value="yanggu">양구군</option>
									<option value="yangyang">양양군</option>
									<option value="youngwol">영월군</option>
									<option value="wonju">원주시</option>
									<option value="inje">인제군</option>
									<option value="jeongseon">정선군</option>
									<option value="cheorwon">철원군</option>
									<option value="chuncheon">춘천시</option>
									<option value="taebaek">태백시</option>
									<option value="pyeongchang">평창군</option>
									<option value="hoengseong">홍성군</option>
									<option value="hongcheon">홍천군</option>
									<option value="hwacheon">화천군</option>																	
								</select>
								</div>
								</div>
								<div id="location10">
								<p class="pull-left">지역구(충남)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca10" name="location" >
									<option value="gyeryong">계룡시</option>
									<option value="gongju">공주시</option>
									<option value=geumsan>금산군</option>
									<option value="nonsan">논산시</option>
									<option value="dangjin">당진시</option>
									<option value="boryeong">보령시</option>
									<option value="buyeo">부여시</option>
									<option value="seosan">서산시</option>
									<option value="seocheon">서천시</option>
									<option value="asan">아산시</option>
									<option value="yesan">예산시</option>
									<option value="cheonan">천안시</option>
									<option value="cheongyang">청양시</option>
									<option value="taean">태안시</option>
									<option value="hongseong">홍성시</option>																		
								</select>
								</div>
								</div>
								<div id="location11">
								<p class="pull-left">지역구(충북)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca11" name="location" >
									<option value="goesan">괴산군</option>
									<option value="danyang">단양군</option>
									<option value=boeun>보은군</option>
									<option value="yeongdong">영동군</option>
									<option value="okcheon">옥천군</option>
									<option value="eumseong">음성군</option>
									<option value="jecheon">제천시</option>
									<option value="jeungpyeong">증평군</option>
									<option value="jincheon">진천군</option>
									<option value="cheongju">청주시</option>
									<option value="chungju">충주시</option>																											
								</select>
								</div>
								</div>
								<div id="location12">
								<p class="pull-left">지역구(전남)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca12" name="location" >
									<option value="goesan">강진군</option>
									<option value="danyang">고흥군</option>
									<option value=boeun>곡성군</option>
									<option value="yeongdong">광양시</option>
									<option value="okcheon">구례군</option>
									<option value="eumseong">나주시</option>
									<option value="jecheon">담양군</option>
									<option value="jeungpyeong">목포시</option>
									<option value="jincheon">무안군</option>
									<option value="cheongju">보성군</option>
									<option value="chungju">순천시</option>
									<option value="chungju">신안군</option>
									<option value="chungju">여수시</option>
									<option value="chungju">영광군</option>
									<option value="chungju">영암군</option>
									<option value="chungju">완도군</option>
									<option value="chungju">장성군</option>
									<option value="chungju">장흥군</option>
									<option value="chungju">진도군</option>
									<option value="chungju">함평군</option>
									<option value="chungju">해남군</option>
									<option value="chungju">화순군</option>																											
								</select>
								</div>
								</div>
								<div id="location13">
								<p class="pull-left">지역구(전북)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca13" name="location" >
									<option value="gochang">고창군</option>
									<option value="gunsan">군산시</option>
									<option value="gimje">김제시</option>
									<option value="namwon">남원시</option>
									<option value="muju">무주군</option>
									<option value="buan">부안시</option>
									<option value="sunchang">순창군</option>
									<option value="wanju">완주군</option>
									<option value="iksan">익산시</option>
									<option value="imsil">임실군</option>
									<option value="jangsu">장수군</option>
									<option value="jeonju">전주시</option>
									<option value="jeongeup">정읍시</option>
									<option value="jinan">진안군</option>																																				
								</select>
								</div>
								</div>
								<div id="location14">
								<p class="pull-left">지역구(경남)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca14" name="location" >
									<option value="geoje">거제시</option>
									<option value="geochang">거창군</option>
									<option value="goseong">고성군</option>
									<option value="gimhae">김해시</option>
									<option value="namhae">남해군</option>
									<option value="miryang">밀양시</option>
									<option value="sacheon">사천시</option>
									<option value="sancheong">산청군</option>
									<option value="yangsan">양산시</option>
									<option value="uiryeong">의령군</option>
									<option value="jinju">진주시</option>
									<option value="changnyeong">창녕군</option>
									<option value="changwon">창원시</option>
									<option value="tongyeong">통영시</option>
									<option value="hadong">하동군</option>
									<option value="haman">함안군</option>
									<option value="hamyang">함양군</option>
									<option value="hapcheon">합천군</option>																																				
								</select>
								</div>
								</div>
								<div id="location15">
								<p class="pull-left">지역구(경북)</p>
								<div class="pull-right">
    							<select class="form-control" id="loca15" name="location" >
									<option value="geoje">포항시</option>
									<option value="geochang">경주시</option>
									<option value="goseong">김천시</option>
									<option value="gimhae">안동시</option>
									<option value="gumi">구미시</option>
									<option value="miryang">영주시</option>
									<option value="sacheon">영천시</option>
									<option value="sancheong">상주시</option>
									<option value="yangsan">문경시</option>
									<option value="uiryeong">경산시</option>
									<option value="jinju">군위군</option>
									<option value="changnyeong">의성군</option>
									<option value="changwon">청송군</option>
									<option value="tongyeong">영양군</option>
									<option value="hadong">영덕군</option>
									<option value="haman">청도군</option>
									<option value="hamyang">고령군</option>
									<option value="hapcheon">성주군</option>
									<option value="chilgok">칠곡군</option>
									<option value="yecheon">예천군</option>
									<option value="bonghwa">봉화군</option>
									<option value="uljin">울진군</option>
									<option value="ulleung">울릉군</option>																																				
								</select>
								</div>
								</div>
								<div id="location16">
								<p class="pull-left">지역구(제주)</p>
								<div class="pull-right">
    							
    							<select class="form-control" id="loca16" name="location" >
									<option value="jeju">제주시</option>
									<option value="seogwipo">서귀포시</option>																																												
								</select>
								</div>
								</div>
							
								
					
				<br><br>	
				<div class="field">  
    				<p>관심사(최대 6개)</p>
    				<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf1" name="fav" type="checkbox" class="field login-checkbox" value="oil"  />
						<label class="choice" for="favf1">주유&nbsp;</label>
					</span>
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf2" name="fav" type="checkbox" class="field login-checkbox" value="shop"  />
						<label class="choice" for="favf2">쇼핑&nbsp;</label>
					</span>
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf6" name="fav" type="checkbox" class="field login-checkbox" value="movie"  />
						<label class="choice" for="favf6">영화&nbsp;</label>
					</span>	
					
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf5" name="fav" type="checkbox" class="field login-checkbox" value="eou"  />
						<label class="choice" for="favf5">외식&nbsp;</label>
					</span>
    				<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf9" name="fav" type="checkbox" class="field login-checkbox" value="tel"  />
						<label class="choice" for="favf9">통신&nbsp;</label>
					</span>			
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf10" name="fav" type="checkbox" class="field login-checkbox" value="edu"  />
						<label class="choice" for="favf10">교육&nbsp;</label>
					</span>
								
					<span class="login-checkbox" style="display:inline;">
						<input id="favf11" name="fav" type="checkbox" class="field login-checkbox" value="cul"  />
						<label class="choice" for="favf11">문화&nbsp;</label>
					</span>			
					<span class="login-checkbox" style="display:inline;">
						<input id="favf12" name="fav" type="checkbox" class="field login-checkbox" value="lei"  />
						<label class="choice" for="favf12">레져&nbsp;</label>
					</span>			
					<span class="login-checkbox" style="display:inline;">
						<input id="favf13" name="fav" type="checkbox" class="field login-checkbox" value="medi"  />
						<label class="choice" for="favf13">의료&nbsp;</label>
					</span>			
					<span class="login-checkbox" style="display:inline;">
						<input id="favf14" name="fav" type="checkbox" class="field login-checkbox" value="bea"  />
						<label class="choice" for="favf14">뷰티&nbsp;</label>
					</span>			
					<span class="login-checkbox" style="display:inline;">
						<input id="favf15" name="fav" type="checkbox" class="field login-checkbox" value="poi"  />
						<label class="choice" for="favf15">포인트캐시백&nbsp;</label>
					</span>	
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf4" name="fav" type="checkbox" class="field login-checkbox" value="cvs"  />
						<label class="choice" for="favf4">편의점&nbsp;</label>
					</span>
					<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf7" name="fav" type="checkbox" class="field login-checkbox" value="tra"  />
						<label class="choice" for="favf7">대중교통&nbsp;</label>
					</span>			
						<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf3" name="fav" type="checkbox" class="field login-checkbox" value="mart"  />
						<label class="choice" for="favf3">대형마트&nbsp;</label>
					</span>		
								
						<span class="login-checkbox" style="display:inline;">
						<input onclick="chk_six(this)" id="favf8" name="fav" type="checkbox" class="field login-checkbox" value="cafe"  />
						<label class="choice" for="favf8">카페/베이커리&nbsp;</label>
					</span>			 
						</div>	
								
					
							<input type="hidden" id="goo" name="goo" />
 				
				
	
				
			</div> <!-- /login-fields -->
			<div class="login-actions">
				<button style="width:100%" type="button" onclick="checkfield()" class="button btn btn-success btn-large">Sign In</button>				
			</div> 
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->


<!-- Text Under Box -->
<div class="login-extra">
	Already have an account? <a href="login.do">Login to your account</a>
</div> <!-- /login-extra -->
<script>
function chk_only2(chk){								
	var obj = document.getElementsByName("sex");
	for(var i=0; i<obj.length; i++){
		if(obj[i] != chk){
			obj[i].checked = false;
		}
	}
}
function chk_six(chk){
	var obj = document.getElementsByName("fav");
	var count = 0;
	for(var i=0; i<obj.length; i++){
		if(obj[i].checked === true){
			count++;
			if(count > 6){
				alert("관심사를 6개 이상 선택 할 수 없습니다");
				chk.checked = false;
			}
		}
	}
}

</script>

<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

<script src="<%=request.getContextPath()%>/js/signin.js"></script>
<script>
	var lval;

	$(document).ready(function(){
	    $("#regist").click(function(){
	        $("#myModal").modal();
	    });
	});

	
	$('#loca1').change(function(){
		document.getElementsByName("location").value=document.getElementsByName("location")[0].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca2').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[1].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca3').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[2].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca4').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[3].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca5').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[4].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca6').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[5].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca7').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[6].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca8').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[7].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca9').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[8].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca10').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[9].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca11').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[10].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca12').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[11].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca13').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[12].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca14').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[13].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca15').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[14].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	$('#loca16').change(function(){ 
		document.getElementsByName("location").value=document.getElementsByName("location")[15].value;
		lval = document.getElementsByName("location").value;
		document.getElementById("goo").value = lval;
	});
	
	$('#local').change(function(){ 
		var selector = document.getElementById("local");
		
			if(selector[selector.selectedIndex].value=="seoul" ){
				
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location1').addClass('open'); 
				
			};
			if(selector[selector.selectedIndex].value=="incheon" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location2').addClass('open');
				/* var selector2 = document.getElementsByName("location");
				document.getElementById("loca2").value=selector2[1].value;
				alert(selector2[selector2.selectedIndex].value); */
			};
			if(selector[selector.selectedIndex].value=="busan" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location3').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="daejeon" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location4').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="daegu" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location5').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="ulsan" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location6').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="gwangju" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location7').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="sejong" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				 
			};
			
			if(selector[selector.selectedIndex].value=="gg" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location8').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="gangwon" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location9').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="chungnam" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location10').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="chungbuk" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location11').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="jeonnam" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location12').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="jeonbuk" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location13').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="gyeongnam" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location14').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="gyeongbuk" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open');
				}
				$('#location15').addClass('open'); 
			};
			if(selector[selector.selectedIndex].value=="jeju" ){
				for(var i=1; i<22;  i++){
					$('#location'+i).removeClass('close');
					$('#location'+i).removeClass('open'); 
				}
				$('#location16').addClass('open'); 
			};
		
		
		
		}); 
	
	
	</script>
	<script>
function checkfield(){
	
	if(document.addjoin.id.value==""){ //id값이 없을 경우
		alert("아이디를 입력하세요");
		document.addjoin.id.focus();     // id 텍스트박스에 커서를 위치
		exit;
	} else if(document.addjoin.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.addjoin.pwd.focus();
		exit;
	}else if(document.addjoin.name.value==""){
		alert("이름을 입력하세요");
		document.addjoin.name.focus();
		exit;
	}else if(document.addjoin.email.value==""){
		alert("이메일을 입력하세요");
		document.addjoin.email.focus();
		exit;
	}
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(exptext.test(document.addjoin.email.value)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		
		alert("이 메일형식이 올바르지 않습니다.");
		document.addjoin.email.focus();
		exit;
	} 

	document.addjoin.submit();
}
</script>
<script>
function navClick(url, gourl){
 	 window.name = url;
	location.href = gourl;
}
</script>
</body>

 </html>
