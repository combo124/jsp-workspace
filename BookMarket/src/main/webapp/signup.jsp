<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: radial-gradient(circle at top, #eef2ff 0, #f9fafb 45%, #f3f4f6 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        }

        .signup-card {
            width: 100%;
            max-width: 480px;
            background: #ffffff;
            border-radius: 1.3rem;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.14);
            padding: 2.3rem 2.6rem;
        }

        .signup-title {
            font-weight: 700;
        }

        .signup-subtext {
            font-size: .9rem;
            color: #6b7280;
        }

        .btn-signup {
            width: 100%;
            padding: 0.7rem 1.4rem;
            font-weight: 600;
            border-radius: .9rem;
            background: #22c55e;
            border-color: #22c55e;
        }

        .btn-signup:hover {
            background: #16a34a;
            border-color: #16a34a;
        }

        .logo-badge {
            width: 46px;
            height: 46px;
            border-radius: 16px;
            background: linear-gradient(135deg, #22c55e, #3b82f6);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #f9fafb;
            font-size: 1.5rem;
            margin-bottom: .75rem;
        }
    </style>
</head>
<body>

<div class="signup-card">
    <div class="logo-badge">
        👤
    </div>

    <h2 class="signup-title mb-1">회원가입</h2>
    <p class="signup-subtext mb-4">
        GameMarket 계정을 만들어서, 구매한 게임들을 언제든지 라이브러리에서 확인해 보세요.
    </p>

    <!-- ⭐ 로직 유지: action / name 값 그대로 -->
    <form action="processSignup.jsp" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" id="id" name="id" class="form-control" placeholder="사용할 아이디를 입력하세요">
        </div>

        <div class="mb-3">
            <label for="passwd" class="form-label">비밀번호</label>
            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호를 입력하세요">
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">이름</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">이메일</label>
            <input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요">
        </div>

        <button type="submit" class="btn btn-signup mt-2">
            회원가입 완료
        </button>
    </form>

    <div class="mt-3 text-center" style="font-size:.85rem; color:#6b7280;">
        이미 계정이 있나요?
        <a href="login.jsp" class="text-decoration-none">로그인 하러 가기</a>
    </div>
</div>

</body>
</html>
