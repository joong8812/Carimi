<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Analysis</title>


 <link href="<%=request.getContextPath()%>/js/guidely/guidely.css" rel="stylesheet"> 

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
</head>

<body>
<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
				<div id="target-1">
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
														type="checkbox" name="a1" value="5000" 
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
														type="checkbox" name="a1" value="18001"
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
									</div>
										<div id="target-2">
										<div class="accordion" id="accordion3">
										<div class="accordion-group">
											<div class="accordion-heading">
												<a class="accordion-toggle" data-toggle="collapse"
													data-parent="#accordion3" href="#collapseTwo"> 비교하고 싶은
													혜택 6개를 선택하세요 </a>
											</div>
											<div id="collapseTwo" class="accordion-body collapse in">
												<div class="accordion-inner">
													<p style="text-align: center;">
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="BEA" 
															offsrc="/CarimiS/image/benefits/bea_off.png"
															onsrc="/CarimiS/image/benefits/bea_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="CAFE" 
															offsrc="/CarimiS/image/benefits/cafe_off.png"
															onsrc="/CarimiS/image/benefits/cafe_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="CUL" 
															offsrc="/CarimiS/image/benefits/cul_off.png"
															onsrc="/CarimiS/image/benefits/cul_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="CVS" 
															offsrc="/CarimiS/image/benefits/cvs_off.png"
															onsrc="/CarimiS/image/benefits/cvs_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="EDU" 
															offsrc="/CarimiS/image/benefits/edu_off.png"
															onsrc="/CarimiS/image/benefits/edu_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="EOU" 
															offsrc="/CarimiS/image/benefits/eou_off.png"
															onsrc="/CarimiS/image/benefits/eou_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="LEI"
															offsrc="/CarimiS/image/benefits/lei_off.png"
															onsrc="/CarimiS/image/benefits/lei_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="MART"
															offsrc="/CarimiS/image/benefits/mart_off.png"
															onsrc="/CarimiS/image/benefits/mart_on.png"></span> <br>
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="MEDI"
															offsrc="/CarimiS/image/benefits/medi_off.png"
															onsrc="/CarimiS/image/benefits/medi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="MOVIE"
															offsrc="/CarimiS/image/benefits/movie_off.png"
															onsrc="/CarimiS/image/benefits/movie_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="OIL"
															offsrc="/CarimiS/image/benefits/oil_off.png"
															onsrc="/CarimiS/image/benefits/oil_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="POI"
															offsrc="/CarimiS/image/benefits/poi_off.png"
															onsrc="/CarimiS/image/benefits/poi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="SHOP"
															offsrc="/CarimiS/image/benefits/shop_off.png"
															onsrc="/CarimiS/image/benefits/shop_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="TEL"
															offsrc="/CarimiS/image/benefits/tel_off.png"
															onsrc="/CarimiS/image/benefits/tel_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span><input onclick="chk_six(this)"
															type="checkbox" name="c1" value="TRA"
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
									</div>
									</div>
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
				
				
			</div>
			<div id="target-3">
				
				</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->
</div>
<!-- /main -->
	
	
<script>

function check() {
	
		var obj = document.getElementsByName("a1");
		var count = 0;
		var count1 =0;
		for(var i=0; i<obj.length; i++){
			if(obj[i].checked === false){
				count1++;
				if(count1>5){
				alert("실적이 없습니다!");
				return false;
				}
			}
			if(obj[i].checked === true){
				count++;
			
				if(count > 1){
					alert("실적을 하나 이상 선택 할 수 없습니다!");
					return false;
				}
			}	
		}
		
		var obj1 = document.getElementsByName("b1");
		var count1 = 0;
		var count11 =0;
		for(var i=0; i<obj.length; i++){
			if(obj1[i].checked === false){
				count11++;
				if(count11>6){
				alert("연회비가 없습니다!");
				return false;
				}
			}
			if(obj1[i].checked === true){
				count1++;
			
				if(count1 > 1){
					alert("연회비를 하나 이상 선택 할 수 없습니다!");
					return false;
				}
			}	
		}
		

	
	var obj2 = document.getElementsByName("c1");
		var count2 = 0;
		var count12 =0;
		for(var i=0; i<obj2.length; i++){
			if(obj2[i].checked === false){
				count12++;
				if(count12>9){
				alert("혜택을 6개 선택하세요!");
				return false;
				}
			}
			if(obj2[i].checked === true){
				count2++;
				if(count2 > 6){
					alert("혜택을 6개 이상 선택 할 수 없습니다");
					return false;
				}
				
			}
		} 
		
}
</script>

<script src="<%=request.getContextPath()%>/js/guidely/guidely.min.js"></script>

<script>

$(function () {
	
	guidely.add ({
		attachTo: '#target-1'
		, anchor: 'top-left'
		, title: '연회비, 실적기준'
		, text: '연회비(상)와 실적기준(하)을 선택해주세요.<br> 각 항목은 하나만 선택 가능합니다.<br> <img src="/CarimiS/img/se1.JPG"/>'
	});
	
	guidely.add ({
		attachTo: '#target-2'
		, anchor: 'top-right'
		, title: '혜택 6개'
		, text: '가장 많이 사용하시는 혜택 6개를 선택해주세요.<br> 무조건 6개 선택하셔야합니다. <br><img src="/CarimiS/img/se2.JPG"/>'
	});
	
	guidely.add ({
		attachTo: '#target-3'
		, anchor: 'bottom-middle'
		, title: '결과 딱!'
		, text: '이렇게 결과가 차트형식으로 보여집니다.<br>이제 시작하세요.!!! <br> <img src="/CarimiS/img/se3.JPG"/>'
		
	});
	

	
	guidely.init ({ welcome: true, startTrigger: false });

});

</script>

</body>
</html>