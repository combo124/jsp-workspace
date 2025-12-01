package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * 데모 사용 쿨타임 관리 DAO
 */
public class DemoUseDao {

    // 🔧 쿨타임(초) — 여기 숫자만 바꾸면 전체 적용됨
    private static final int DEFAULT_COOLDOWN_SEC = 30;

    // 싱글톤 인스턴스
    private static final DemoUseDao instance = new DemoUseDao();

    public static DemoUseDao getInstance() {
        return instance;
    }

    private DemoUseDao() {}

    private Connection getConnection() throws Exception {
        return DBUtil.getConnection();
    }

    // 결과 DTO
    public static class DemoResult {
        public final boolean canUse;
        public final long remainSec;

        public DemoResult(boolean canUse, long remainSec) {
            this.canUse = canUse;
            this.remainSec = remainSec;
        }
    }

    public DemoResult checkAndUseDemo(String mId, String bId) {
        return checkAndUseDemo(mId, bId, DEFAULT_COOLDOWN_SEC);
    }

    public DemoResult checkAndUseDemo(String mId, String bId, int cooldownSec) {

        System.out.println("\n[DemoUseDao] ===== checkAndUseDemo 호출 =====");
        System.out.println("[DemoUseDao] mId = " + mId + ", bId = " + bId + ", cooldownSec = " + cooldownSec);

        if (mId == null || bId == null) {
            System.out.println("[DemoUseDao] ❌ mId 또는 bId 가 null → 데모 사용 불가");
            return new DemoResult(false, cooldownSec);
        }

        // ✅ 네가 만든 demo_use 테이블 구조에 딱 맞춘 쿼리
        String selectSql =
            "SELECT TIMESTAMPDIFF(SECOND, last_used_at, NOW()) AS diff " +
            "FROM demo_use WHERE m_id = ? AND b_id = ?";

        String insertSql =
            "INSERT INTO demo_use(m_id, b_id, used, last_used_at) " +
            "VALUES (?, ?, 1, NOW())";

        String updateSql =
            "UPDATE demo_use SET used = 1, last_used_at = NOW() " +
            "WHERE m_id = ? AND b_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement selPstmt = conn.prepareStatement(selectSql)) {

            selPstmt.setString(1, mId);
            selPstmt.setString(2, bId);

            try (ResultSet rs = selPstmt.executeQuery()) {

                // 1) 기존 기록 없음 → 첫 사용
                if (!rs.next()) {
                    System.out.println("[DemoUseDao] 기존 demo_use 기록 없음 → 첫 데모 사용");

                    try (PreparedStatement insPstmt = conn.prepareStatement(insertSql)) {
                        insPstmt.setString(1, mId);
                        insPstmt.setString(2, bId);
                        insPstmt.executeUpdate();
                    }

                    System.out.println("[DemoUseDao] first use, canUse=true, remainSec=0");
                    return new DemoResult(true, 0);
                }

                long diff = rs.getLong("diff");    // 마지막 사용 이후 경과시간(초)
                boolean diffWasNull = rs.wasNull();
                System.out.println("[DemoUseDao] diff = " + diff + " (wasNull=" + diffWasNull + ")");

                // last_used_at 이 NULL 이었다면 → 그냥 첫 사용처럼 처리
                if (diffWasNull) {
                    System.out.println("[DemoUseDao] diff NULL → 첫 사용처럼 간주하고 갱신");
                    try (PreparedStatement upPstmt = conn.prepareStatement(updateSql)) {
                        upPstmt.setString(1, mId);
                        upPstmt.setString(2, bId);
                        upPstmt.executeUpdate();
                    }
                    return new DemoResult(true, 0);
                }

                // 2) 쿨타임 지남 → 사용 가능
                if (diff >= cooldownSec) {
                    System.out.println("[DemoUseDao] 쿨타임 지남 → 데모 사용 가능, demo_use 갱신");

                    try (PreparedStatement upPstmt = conn.prepareStatement(updateSql)) {
                        upPstmt.setString(1, mId);
                        upPstmt.setString(2, bId);
                        upPstmt.executeUpdate();
                    }

                    return new DemoResult(true, 0);
                }

                // 3) 아직 쿨타임 남음 → 사용 불가
                long remain = cooldownSec - diff;
                System.out.println("[DemoUseDao] 아직 쿨타임 남음. remainSec = " + remain + "초");
                return new DemoResult(false, remain);
            }

        } catch (Exception e) {
            System.out.println("[DemoUseDao] ❌ 예외 발생! 임시로 사용 허용 (fail-open)");
            e.printStackTrace();
            // 에러 나면 막는 것보다, 과제용이니 일단 사용 가능 처리
            return new DemoResult(true, 0);
        }
    }
}
