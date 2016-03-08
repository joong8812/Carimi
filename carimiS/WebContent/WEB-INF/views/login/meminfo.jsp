<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>



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
<body>
<div class="main">
	
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>User Info</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
				
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form name="profile" class="form-horizontal" action="meminfoAf.do" method="post">
							
									<fieldset>
									
										<div class="control-group">											
											<label class="control-label" for="id">ID</label>
											<div class="controls">
												<input type="text" id="id" class="span2 " name="bbb"  value="${sessionScope.login.id}" disabled="disabled"/>
												<input type="hidden"  name="id"  value="${sessionScope.login.id}" />
											</div> <!-- /controls -->	
										</div>	
										
										
										<div class="control-group">											
											<label class="control-label" for="pwd">Password</label>
											<div class="controls">
												<input type="password" class="span2" id="pwd" name="pwd" value="${mdto.pwd}"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										<div class="control-group">											
											<label class="control-label" for="username">Name</label>
											<div class="controls">
												<input type="text" class="span2" id="name" name="name" value="${mdto.name }"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->							
										<div class="control-group">											
											<label class="control-label" for="username">Age</label>
											<div class="controls">
												<input type="text" class="span2" id="age" name="age" value="${mdto.age }"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->							
										<div class="control-group">											
											<label class="control-label" for="username">Email</label>
											<div class="controls">
												<input type="text" class="span2" id="email" name="email" value="${mdto.email }"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->		
										 <div class="control-group">											
											<label class="control-label">Sex</label>
											
                                            
                                            <div class="controls">
                                            <label class="checkbox-inline">
                                              <input onclick="chk_only2(this)" name="sex" value="man" type="checkbox"> 남자
                                            </label>
                                            
                                            <label class="checkbox-inline">
                                              <input onclick="chk_only2(this)"  name="sex" value="woman" type="checkbox"> 여자
                                            </label>
                                          </div>		<!-- /controls -->		
										</div> <!-- /control-group -->

								
										 <div class="control-group">
										 	<label class="control-label">지역</label>
										 	   <div class="controls">
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
									
										
								<div id="location1">
									<div class="control-group">
										 	<label class="control-label">지역구(서울)</label>
    											 	   <div class="controls">
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
								</div>
								
								<div id="location2">
									<div class="control-group">
										 	<label class="control-label">지역구(인천)</label>
    											 	   <div class="controls">
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
								</div>
								
								<div id="location3">
								<div class="control-group">
										 	<label class="control-label">지역구(부산)</label>
    											 	   <div class="controls">
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
								
								</div>
								
								<div id="location4">
								<div class="control-group">
										 	<label class="control-label">지역구(대전)</label>
    											 	   <div class="controls">
    							<select class="form-control" id="loca4" name="location" >
									<option value="dong">동구</option>
									<option value="jung">중구</option>
									<option value="seo">서구</option>
									<option value="yuseong">유성</option>
									<option value="daedeok">대덕구</option>
								</select>
								</div>
								</div>
								</div>
								
								<div id="location5">
								<div class="control-group">
										 	<label class="control-label">지역구(대구)</label>
    											 	   <div class="controls">
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
								</div>
								
								<div id="location6">
								<div class="control-group">
										 	<label class="control-label">지역구(울산)</label>
    											 	   <div class="controls">
    							
    							<select class="form-control"  id="loca6"name="location" >
									<option value="dong">동구</option>
									<option value="jung">중구</option>
									<option value="nam">남구</option>
									<option value="buk">북구</option>
									<option value="ulju">울주군</option>									
								</select>
								</div>
								</div>
								</div>
								<div id="location7">
								<div class="control-group">
										 	<label class="control-label">지역구(광주)</label>
    											 	   <div class="controls">
    							<select class="form-control" id="loca7" name="location" >
									<option value="dong">동구</option>
									<option value="seo">서구</option>
									<option value="nam">남구</option>
									<option value="buk">북구</option>
									<option value="gwangsan">광산구</option>									
								</select>
								</div>
								</div>
								</div>
								<div id="location8">
								<div class="control-group">
										 	<label class="control-label">지역구(경기)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location9">
								<div class="control-group">
										 	<label class="control-label">지역구(강원)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location10">
								<div class="control-group">
										 	<label class="control-label">지역구(충남)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location11">
								<div class="control-group">
										 	<label class="control-label">지역구(충북)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location12">
								<div class="control-group">
										 	<label class="control-label">지역구(전남)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location13">
								<div class="control-group">
										 	<label class="control-label">지역구(전북)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location14">
								<div class="control-group">
										 	<label class="control-label">지역구(경남)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location15">
								<div class="control-group">
										 	<label class="control-label">지역구(경북)</label>
    											 	   <div class="controls">
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
								</div>
								<div id="location16">
								<div class="control-group">
										 	<label class="control-label">지역구(제주)</label>
    											 	   <div class="controls">
    							
    							<select class="form-control" id="loca16" name="location" >
									<option value="jeju">제주시</option>
									<option value="seogwipo">서귀포시</option>																																												
								</select>
								</div>
								</div>
								</div>
								<div class="control-group">
										 	<label class="control-label">보유카드1</label>
    											 	   <div class="controls">
    							
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
								<div class="control-group">
										 	<label class="control-label">보유카드2</label>
    											 	   <div class="controls">
    							
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
								</div></div>
								
    							
    							<div class="control-group">
										 	<label class="control-label">직업</label>
    											 	   <div class="controls">
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
								
								
								
    							<div class="control-group">
							 		<label class="control-label">관심사(최대6개)</label>											 	   
									 <div class="controls">
                                      <label class="checkbox-inline">
                                        <input onclick="chk_six(this)" id="favf1" name="fav" type="checkbox"value="oil"  /> 주유
                                      </label>
    			
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf2" name="fav" type="checkbox"  value="shop"  />쇼핑
										</label>
					
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf6" name="fav" type="checkbox"  value="movie"  /> 영화
											
										</label>
					
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf5" name="fav" type="checkbox" value="eou"  /> 외식
											
										</label>
					    				<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf9" name="fav" type="checkbox" value="tel"  /> 통신
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf10" name="fav" type="checkbox"  value="edu"  /> 교육
											
										</label>
								
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf11" name="fav" type="checkbox" value="cul"  /> 문화
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf12" name="fav" type="checkbox" value="lei"  /> 레져
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf13" name="fav" type="checkbox"  value="medi"  /> 의료
											
										</label>
										<br>
										<br>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf14" name="fav" type="checkbox" value="bea"  /> 뷰티
											
											
										</label>
													
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf15" name="fav" type="checkbox" value="poi"  /> 포인트캐시백
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf4" name="fav" type="checkbox"  value="cvs"  /> 편의점
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf7" name="fav" type="checkbox"  value="tra"  /> 대중교통
											
										</label>
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf3" name="fav" type="checkbox" value="mart"  /> 대형마트
											
										</label>
								
										<label class="checkbox-inline">
											<input onclick="chk_six(this)"  id="favf8" name="fav" type="checkbox" value="cafe"  /> 카페/베이커리
										</label>
										</div>
										</div>
								
								
							
								
					
							<input type="hidden" id="goo" name="goo" />
							<div class="form-actions">
							  <div class="control-group">											
											<label class="control-label" for="radiobtns">Update/Delete</label>
											
                                            <div class="controls">
                                              <div class="btn-group">                                            
                                         	<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                            	<i class="icon-user icon-white"></i> ${mdto.id }
                                              <span class="caret"></span></a>
                                              <ul class="dropdown-menu" id="probtn">
                                                <li>
                                                	<button class="btn" type="submit" value="update" name="mode"><i class="icon-pencil" ></i>Update</button>
                                                </li>
                                              	
                                                <li>
                                                	<button class="btn" type="submit" value="delete" name="mode"><i class="icon-trash"></i>Delete</button>
                                                </li>
                                              
                                            
                                              </ul>
                                            </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
									</div> 
									
									
									</fieldset>
								</form>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
	
	
	
								
<script>

	var lval;

	$(document).ready(function(){
	    $("#regist").click(function(){
	        $("#myModal").modal();
	    });
	}); 
	$('#local').ready(function(){ 
		var selector = document.getElementById("local");
		selector.value='${mdto.local}';
		var selector2 = document.getElementsByName("location"); 
		selector2.value='${mdto.location}';
		document.getElementById("goo").value ='${mdto.location}';
		if(selector[selector.selectedIndex].value=="seoul" ){
		
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location1').addClass('open'); 
			document.profile.loca1.value="${mdto.location }";
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
			document.profile.loca2.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="busan" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location3').addClass('open'); 
			document.profile.loca3.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="daejeon" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location4').addClass('open');
			document.profile.loca4.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="daegu" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location5').addClass('open');
			document.profile.loca5.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="ulsan" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location6').addClass('open');
			document.profile.loca6.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="gwangju" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location7').addClass('open');
			document.profile.loca7.value="${mdto.location }";
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
			document.profile.loca8.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="gangwon" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location9').addClass('open');
			document.profile.loca9.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="chungnam" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location10').addClass('open');
			document.profile.loca10.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="chungbuk" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location11').addClass('open');
			document.profile.loca11.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="jeonnam" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location12').addClass('open');
			document.profile.loca12.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="jeonbuk" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location13').addClass('open');
			document.profile.loca13.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="gyeongnam" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location14').addClass('open');
			document.profile.loca14.value="${mdto.location }"
		};
		if(selector[selector.selectedIndex].value=="gyeongbuk" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open');
			}
			$('#location15').addClass('open');
			document.profile.loca15.value="${mdto.location }";
		};
		if(selector[selector.selectedIndex].value=="jeju" ){
			for(var i=1; i<22;  i++){
				$('#location'+i).removeClass('close');
				$('#location'+i).removeClass('open'); 
			}
			$('#location16').addClass('open');
			document.profile.loca16.value="${mdto.location }";
		};



	}); 
	
	document.profile.mycard1.value='${mdto.mycard1 }';
	document.profile.mycard2.value='${mdto.mycard2 }';

	document.profile.job.value='${mdto.job }'; 
	
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

var chk = document.getElementsByName("sex");
var chkboxLen = chk.length;




for(var i=0;i < chkboxLen ; i++){ 

if(chk[i].value =='${mdto.sex }'){

	chk[i].checked = true;
}
}
window.onload;


</script>
<script>

var chk = document.getElementsByName("fav");
var chkboxLen = chk.length;




for(var i=0;i < chkboxLen ; i++){ 

if(chk[i].value =='${mdto.fav1 }'){

	chk[i].checked = true;
}
if(chk[i].value =='${mdto.fav2 }'){

	chk[i].checked = true;
}
if(chk[i].value =='${mdto.fav3 }'){

	chk[i].checked = true;
}
if(chk[i].value =='${mdto.fav4 }'){

	chk[i].checked = true;
}
if(chk[i].value =='${mdto.fav5 }'){

	chk[i].checked = true;
}
if(chk[i].value =='${mdto.fav6 }'){

	chk[i].checked = true;
}
}
window.onload;


</script>
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
</body>
</html>
