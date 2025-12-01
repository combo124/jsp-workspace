# JSP Workspace (BookMarket / JSPBook)

## 1. 프로젝트 소개

레거시 게임들을 합법적으로 살 수 있는 GameMarket을 만들었습니다!

GitHub Repository: https://github.com/combo124/jsp-workspace

---

## 2. 프로젝트 구조

- `BookMarket/`
  - 주요 기능
    - 상품 목록 / 상세 페이지
    - 회원가입 / 로그인
    - 장바구니, 주문
    - 게임 데모 플레이 / 게임 구매 플레이
    - 각 db에 연결



- `Servers/`
  - Eclipse에서 생성한 Tomcat 서버 설정 폴더
  - 필요시 Eclipse에서 자동으로 재생성 가능

---

## 3. 개발 환경

- OS: macOS 
- IDE: Eclipse IDE for Enterprise Java and Web Developers
- JDK: 20.0.1
- WAS: Apache Tomcat 10.1
- DB: MySQL 5.1
- 빌드/실행: Eclipse 내에서 `Run on Server`

---

## 4. 데이터베이스 설정
데이터베이스 커넥션은 Market_Conn입니다
Market_Conn의 비밀번호는 1234 입니다 

사용하는 데이터베이스 이름은 BookMarketDB 입니다 
비밀번호 또한 1234 입니다 

Gamemarket에 있는 테스트 유저는 총 3명입니다 
ADMIN 유저
id: root
pw: root1234

테스트 유저 
id: test
pw: 1234

일반 유저 
id: combo124
pw: 5678

## 5. 프로젝트 사용법 
welcome.jsp를 서버에서 실행시키시면 됩니다 

만약 어떤 페이지라도 welcome.jsp로 돌아가고 싶으시면 좌측 상단에 홈버튼을 누르시면 됩니다 

welcome에서 로그인 , 게임 목록 , 마이 라이브러리로 접근 가능합니다 

로그인에서는 회원가입 페이지로 이동이 가능하며 db와 연결되어 있습니다 

게임 목록에서는 원하시는 게임의 상세정보와 장바구니에 접근가능합니다 

상세 정보에서는 데모 플레이 접근이 가능하며 계정당 30초에 한번씩 게임에 접속 가능합니다 

장바구니에서는 게임 결제가 가능합니다

결제후 마이 라이브러리에 구매한 게임 목록이 추가됩니다 

마이 라이브러리에서는 구매한 게임에 무제한 접근이 가능합니다 

관리자시 마이 라이브러리에서 게임을 추가 할 수 있습니다 
