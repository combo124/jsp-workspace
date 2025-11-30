<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function checkForm(){
	
	var reExpId= /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName= /^[가-힣]*$/;
	var regExpPasswd = /^[0-9]*$/;
	var regExpPhone= /^\d{3}-d{3,4}-\d{4}$/;
	var regExpEmail =^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$;
	
	var form= document.loginForm;
	
	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
	var email = form.email.value;

	if(!regExpId.test(id)){
		alert("아이디 문자로 시작 바람");
		form.id.select();
		return;
	}
	if(!regExpName.test(name)){
		alert("이름은 한글로만 ");
		form.name.select();
		return;
	}
	if(!regExPasswd.test(passwd)){
		alert("비번은 숫자로만");
		form.passwd.select();
		return;
	}
	if(!regExpPhone.test(phone)){
		alert("연락처 입력 바람");
		form.phone.select();
		return;
	}
	if(!regExpEmail.test(email)){
		alert("이메일 입력 바람");
		form.email.select();
		return;
	}
	
	form.sunmit();
	

}

</script>



<body>
<h3>회원가입</h3>
<form name="loginForm" action="val2.jsp" method="post">
<p> 아이디 : <input type="text" name="id">
<p> 비밀번호 : <input type="password" name="passwd">
<p> 이름 : <input type="text" name="name">
<p> 연락처 : <select name= "phone1">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="019">019</option>

</select>
<p> 이메일 : <input type="text" name="email">

<p> <input type="submit" value="전송" onclick="checkForm()">



</form>




</body>
</html>