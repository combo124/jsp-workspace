<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" onsubmit="return validateForm();">
    <label for="uid">아이디</label>
    <input type="text" id="uid" name="uid" />

    <label for="pw">비밀번호</label>
    <input type="password" id="pw" name="pw" />

    <label for="pw2">비밀번호 확인</label>
    <input type="password" id="pw2" name="pw2" />

    <div><button class="btn" type="submit">전송</button></div>
  </form>

<script>
function validateForm(){
  const id  = document.getElementById('uid').value.trim();
  const pw  = document.getElementById('pw').value;
  const pw2 = document.getElementById('pw2').value;

  if (!id){ alert('아이디를 입력하세요.'); return false; }
  if (!pw){ alert('비밀번호를 입력하세요.'); return false; }
  if (pw !== pw2){ alert('비밀번호 확인이 일치하지 않습니다.'); return false; }

  const hasLetter = /[a-zA-Z]/.test(pw);
  const hasNumber = /[0-9]/.test(pw);
  const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(pw);

  if (pw.length < 8 || !hasLetter || !hasNumber || !hasSpecial){
    alert('영문+숫자+특수기호를 포함하여 8자 이상으로 구성해야 합니다.');
    return false;
  }

  alert('검사 통과!');
  return false; 
}
</script>

</body>
</html>