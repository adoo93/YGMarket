<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function pValue(){
			document.getElementById("userId").value = opener.document.userInfo.ID.value;
		}
	function idCheck(){
			var id = document.getElementById("userId").value;
//alert("아이디췤:"+ id)
			if(!id){
				alert("아이디를 입력하지 않았습니다.");
				return false;
			}
			else {
				httpRequest = new XMLHttpRequest();
				httpRequest.onreadystatechange = callback;
				httpRequest.open("GET", "Controller?command=MemberIdCheck&id="+id, true);
				httpRequest.setRequestHeader("Content-Type", "application/x-www-form-rulencoded");
				httpRequest.send();
			}
		}
	function callback() {
		console.log("callback func. 호출됨.");
			if(httpRequest.readyState == 4) {			
				var resultText = httpRequest.responseText;
//				alert("서버로부터 받아온 결과값:"+resultText.trim()+"!!");	

				if(resultText.trim()=="중복임") {
					alert("사용할 수 없는 아이디입니다~");
					document.getElementById("cancelBtn").style.visibility='visible';
					document.getElementById("useBtn").style.visibility='hidden';
					document.getElementById("msg").innerHTML = "";
				} else if(resultText.trim()=="중복아님") {
					document.getElementById("cancelBtn").style.visibility='hidden';
					document.getElementById("useBtn").style.visibility='visible';
					document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
				} 
			}
		}
	function sendCheckValue() {
			opener.document.userInfo.idDuplication.value = "idCheck";
			opener.document.userInfo.ID.value = document.getElementById("userId").value;
			if(opener != null) {
				opener.chkForm = null;	// OK? (나를 위한 메모.)
				self.close();
			}
		}
</script>
<style>
	b{margin-left:15px;}
	input.idinput {	
		margin-left: 15px;
		width: 160px;
		height: 30px;
		font-size: 15px;
	}
</style>
<body onload="pValue()">
<div class="check">
	<br/>
	<b><font size="4" color="gray" >아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br/>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="idinput" id="userId" style="margin-left: 15px; width: 160px; height: 23px;	font-size: 15px;"/>
			<input type="button" value="중복확인" onclick="idCheck()" style="background-color:#fff; border:1px solid #6c9414; width:70px; height:28px; margin-left:5px; color:#6c9414; font-weight:bold; font-size:14px;"/>
		</form>
		<div id="msg" style="margin-top:3px; margin-left:17px;"></div>
			<br/>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()" style="background-color:#fff; border:1px solid #6c9414; width:43px; height:28px; margin-left:15px; color:#6c9414; font-weight:bold; font-size:14px;"/><br/>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()" style="background-color:#6c9414; border:1px solid #fff; width:70px; height:28px; margin-left:15px; margin-top:5px; color:#fff; font-weight:bold; font-size:14px;"/>
		</div>
</div>
</body>
</html>