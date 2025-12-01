<%@ page contentType="text/html; charset=utf-8" %>

<%
    // 로그인 상태 확인
    String memberId = (String) session.getAttribute("id");
%>

<html>
<head>
    <title>GameMarket 홈</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f5f7;
        }

        .hero-wrapper {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
        }

        .hero-card {
            border-radius: 1.5rem;
            background: linear-gradient(135deg, #ffffff 0%, #f5f7ff 40%, #eef4ff 100%);
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: .5rem;
            padding: .35rem .9rem;
            border-radius: 999px;
            font-size: .9rem;
            background: rgba(59,130,246,.08);
            color: #2563eb;
            font-weight: 600;
        }

        .hero-emoji-bubble {
            width: 120px;
            height: 120px;
            border-radius: 32px;
            background: radial-gradient(circle at 20% 20%, #4f46e5, #1e293b);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #f9fafb;
            box-shadow: 0 18px 40px rgba(15,23,42,0.5);
        }

        .hero-subtext {
            color: #6b7280;
        }

        .hero-time {
            font-size: .9rem;
            color: #9ca3af;
        }

        .btn-main {
            padding: .7rem 1.4rem;
            font-weight: 600;
            border-radius: .9rem;
        }

        .btn-main-primary {
            background: #2563eb;
            border-color: #2563eb;
        }

        .btn-main-primary:hover {
            background: #1d4ed8;
            border-color: #1d4ed8;
        }

        .btn-main-secondary {
            background: #f3f4f6;
            border-color: #e5e7eb;
            color: #111827;
        }

        .btn-main-secondary:hover {
            background: #e5e7eb;
            border-color: #d1d5db;
            color: #111827;
        }
    </style>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="container hero-wrapper py-4">
    <div class="row justify-content-center w-100">
        <div class="col-xl-9 col-lg-10">
            <div class="hero-card p-4 p-md-5">

                <!-- 🔸 여기: 카드 상단 왼쪽 환영 문구 / 로그인 버튼 -->
                <div class="d-flex justify-content-between align-items-center mb-3 mb-md-4">
                    <div class="small text-muted">
                        <% if (memberId != null) { %>
                            <span class="fw-semibold"><%= memberId %></span> 님, 오늘도 좋은 게임 하루 되세요 🎮
                        <% } else { %>
                            내 게임 라이브러리를 사용하려면 로그인이 필요해요.
                        <% } %>
                    </div>

                    <% if (memberId == null) { %>
                        <a href="login.jsp" class="btn btn-sm btn-outline-dark">
                            로그인하기
                        </a>
                    <% } %>
                </div>

                <div class="row align-items-center g-4 g-lg-5">
                    <!-- 왼쪽 텍스트 영역 -->
                    <div class="col-lg-7">
                        <div class="hero-badge mb-3">
                            <span>🎮 GameMarket</span>
                            <span class="text-secondary" style="font-size: .8rem;">인디 & 웹 게임 스토어</span>
                        </div>

                        <h1 class="display-5 fw-bold mb-3">
                            게임 쇼핑몰에 오신 것을<br/>
                            환영합니다
                        </h1>

                        <p class="hero-subtext mb-4">
                            원하는 게임을 둘러보고, 구매한 게임은 나만의 라이브러리에서 바로 실행해 보세요.
                        </p>

                        <div class="d-flex flex-wrap gap-2 gap-md-3">
                            <!-- 항상 보이는 상점 버튼 -->
                            <a href="books.jsp" class="btn btn-main btn-main-primary">
                                🎮 게임 상점 둘러보기
                            </a>

                            <% if (memberId != null) { %>
                                <!-- 로그인 상태 → 내 라이브러리 -->
                                <a href="myLibrary.jsp" class="btn btn-main btn-main-secondary">
                                    📚 내 게임 라이브러리
                                </a>
                            <% } else { %>
                                <!-- 비로그인 상태 → (아래 큰 버튼 대신, 위에 작은 로그인 버튼이 이미 있음)
                                     여긴 굳이 또 안 넣어도 됨. 필요하면 로그인 버튼 하나 더 추가 가능 -->
                            <% } %>
                        </div>
                    </div>

                    <!-- 오른쪽 데코 박스 -->
                    <div class="col-lg-5 d-flex justify-content-center justify-content-lg-end">
                        <div class="d-flex flex-column align-items-center gap-3">
                            <div class="hero-emoji-bubble">
                                🎲
                            </div>
                            <div class="text-center hero-subtext" style="font-size: .9rem;">
                                오늘은 어떤 게임을<br/>라이브러리에 채워볼까요?
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-3 text-end hero-time">
                © GameMarket
            </div>
        </div>
    </div>
</div>

</body>
</html>
