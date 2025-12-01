<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>로그인</title>
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

        .login-card {
            width: 100%;
            max-width: 420px;
            background: #ffffff;
            border-radius: 1.3rem;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.14);
            padding: 2.2rem 2.4rem;
        }

        .login-title {
            font-weight: 700;
        }

        .login-subtext {
            font-size: .9rem;
            color: #6b7280;
        }

        .btn-login {
            width: 100%;
            padding: 0.7rem 1.4rem;
            font-weight: 600;
            border-radius: .9rem;
            background: #2563eb;
            border-color: #2563eb;
        }

        .btn-login:hover {
            background: #1d4ed8;
            border-color: #1d4ed8;
        }

        .logo-badge {
            width: 46px;
            height: 46px;
            border-radius: 16px;
            background: linear-gradient(135deg, #4f46e5, #22c55e);
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

<div class="login-card">
    <div class="logo-badge">
        🎮
    </div>

    <h2 class="login-title mb-1">로그인</h2>
    <p class="login-subtext mb-4">
        GameMarket 계정으로 접속해서 내 게임 라이브러리를 확인해 보세요.
    </p>

    <form action="processLogin.jsp" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요">
        </div>

        <div class="mb-3">
            <label for="passwd" class="form-label">비밀번호</label>
            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호를 입력하세요">
        </div>

        <button type="submit" class="btn btn-login mt-2">
            로그인
        </button>
    </form>

    <div class="mt-3 text-center" style="font-size:.85rem; color:#6b7280;">
        아직 계정이 없나요?
        <a href="signup.jsp" class="text-decoration-none">회원가입 하기</a>
    </div>
</div>

</body>
</html>
