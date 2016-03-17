<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
video#bgvid {
	position: fixed;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	-ms-transform: translateX(-50%) translateY(-50%);
	-moz-transform: translateX(-50%) translateY(-50%);
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	background: url(polina.jpg) no-repeat;
	background-size: cover;
/* 	opacity: .7; */
}
.intro_text{
	text-align:center;
	float:center; 
	margin-top:150px;
}
.upper{
	border:8px solid #befafb;
	margin:auto;
	width:30%;
	height:30%;
	background-color:#FFF;
	opacity:0.4;
}
.upText{
	color:black;
	font-size:25px;
}
.bottom{
	border:3px solid white;
	margin:auto;
	width:30%;
	height:30%;
	background-color:#FFF;
	opacity:0.4;
}
.botText{
	font-size:24px;
}
</style>
</head>
<body>
<div class="main-inner">
			<div class="container">
				<video autoplay loop
					poster="<%=request.getContextPath()%>/image/62.png" id="bgvid">
					<source src="<%=request.getContextPath()%>/video/maincf.mp4"
						type="video/mp4" >
				</video>
				<div class="row">
				<%-- 	방문자수 : ${count }
					IP : ${ip } --%>
					<div class="intro_text">
						<div class="upper">
							<div class="upText">
								<br><strong style="font-size:45px">카리미</strong><br><br>
								<strong>카드</strong><br><strong>+</strong><br><strong>알리미</strong><br><br>
							</div>
						</div><br><br><br><br>
						<div class="bottom">
							<div class="botText">
								<br>카드 혜택 정보를 한 눈에 비교<br>
								<br>주변 혜택 가맹점 확인<br>
								<br>카드 소비 패턴 분석<br>
								<br>달력으로 카드 이벤트와 일정 관리<br><br>
							</div>
						</div>
					</div>
					<br><br><br><br><br><br><br><br><br><br><br><br>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
</body>
</html>