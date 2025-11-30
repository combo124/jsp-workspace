<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form id="frm" action="validation_process.jsp" method="post" onsubmit="return validateForm();">
    <label for="uid">아이디</label>
    <input type="text" id="uid" name="uid"/>

    <label for="pw">비밀번호</label>
    <input type="password" id="pw" name="pw"/>

    <div><button class="btn" type="submit">전송</button></div>
  </form>

<script>
function validateForm(){
  const id = document.getElementById('uid').value.trim();
  const pw = document.getElementById('pw').value;

  if(!id){
    alert('아이디를 입력해주세요');
    return false;
  }
  if(!pw){
    alert('비밀번호를 입력해주세요');
    return false;
  }

  if (pw.toLowerCase().includes(id.toLowerCase())){
     alert('비밀번호는 ID를 포함할 수 없습니다.');
     return false;
  }

  return true; 
}
</script>

</body>
</html>