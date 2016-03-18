<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>이메일 인증</title>
<style type="text/css">
body {
	margin:0;
	padding:0;
}
.headerbg {
	background:#cfcfcf;
	padding-top:3px;
	padding-bottom:3px;
	padding-left:10px;
}

.headerbg h2 {
	color:#000000;
}

.contents {
	padding-left:10px;
	padding-right:10px;
}

.title {
	background-image:url('/jsp/sso/img/email_title_background.png')
}

.title h2 {
	padding:10px;

}
</style>
<SCRIPT LANGUAGE="JavaScript" SRC="https://www.ionnuri.org/ks20/js/jquery/jquery.js"></SCRIPT>
<script type="text/javascript">


//	blocking();


function blocking() {
	alert("잘못된 접근입니다.");
	window.close();
}



var num=1234;

$(document).ready( function() {
	
	$("#btnPnumber").click(function() {
		
		if($("#receive").val() == '') {
			alert("이메일을 입력해주세요.");
			return;
		}

		$("#emailFrame").fadeIn(350);
		$("#btnPnumber").attr("disabled",true);
		
	//	alert("receive :: " + $("#receive").val());
		
		http = jQuery.ajax({
	   		url		: "./mailCodeSend.do",
	   		type	: "POST",
			data 	: 'email='+$("#email").val(),
			dataType: 'html',
	   		async	: true,
			success : function(msg) {

//				alert(msg);
				alert("인증번호가 메일로 발송되었습니다.");
				
				if(!f.receive.value) {
					alert("이메일주소를 입력해주세요.");
					return;
				} 
				
				
				num = msg;
				
			}
	  	});
		

//		document.getElementById("emailFrame").style.display = 'block';
//	    document.getElementById("btnPnumber").disabled = true;
//	    document.getElementById("btnPnumber").value = "이메일 발송완료";
	});

});


function lf_process() {
	
	if(num == $("#userNum").val()) {
		alert("인증 성공! 임시로 로그인 합니다.");
		
		location.href="./loginAf2.do?email="+$("#email").val();
	} else {
		alert("인증번호가 맞지 않습니다.");
		return;
	}
	
}

</script>

</head>
<body>





<div class="contents">
<div class="title">
	<h2>이메일 인증하기</h2>
</div>

<table border='0' style='width:100%;' cellpadding="5">
	<colgroup>
		<col style='width:27%'></col>
		<col style='width:73%'></col>
	</colgroup>
	
	<tr>
		<td valign="top">이메일 <font color='red'>*</font></td>
		<td>
			<div>
				<input type="text" size="" name="email" id="email" value=""/>
			</div>
			<div style="padding-top:3px;">
				인증번호를 이메일로 보내드립니다. <br> 
				이메일 확인하셔서 입력란에 넣어주세요.
			</div>
		</td>
	</tr>
</table>
</div>

<div class="contents">
<br/>
<input type="checkbox" name="agreecheck" value="1">
<input type="hidden" name="agreecheck" value="2">
개인정보의 수집 및 이용목적에 동의 합니다.
<span style="padding-left:100px;"/>
<input type="button" name="btnPnumber" value="메일보내기" id="btnPnumber" style="cursor:pointer;"/>


</div>

<div class="contents">
	<div style='display:none;' id="emailFrame">
	<table border='0' style='width:100%;'>
		<colgroup>
			<col style='width:27%'></col>
			<col style='width:73%'></col>
		</colgroup>
		<tr>
			<td style='width:27%;padding-left:10px;'>이메일 인증번호 <font color='red'>*</font></td>
			<td style='padding:5px;'>
				<input type='text' name='userNum' id="userNum" value='' style='width:50px' maxlength="6">
				<input type='button' name='btnConfirm' value='확인' onclick="javascript:lf_process();">
			</td>
		</tr>
	</table>
	
	</div>
</div>


</body>
</html>