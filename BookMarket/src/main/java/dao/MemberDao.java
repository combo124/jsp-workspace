package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

    private static MemberDao instance = new MemberDao();
    private static final String DEFAULT_ROLE = "USER";   // 기본 권한

    public static MemberDao getInstance() {
        return instance;
    }

    private MemberDao() {}

    private Connection getConnection() throws Exception {
        return DBUtil.getConnection();
    }

    // ===================== 회원가입 =====================
    // 성공하면 1, 실패/예외면 0
    public int insertMember(String id, String passwd, String name, String email) {
        // role 컬럼까지 포함해서 INSERT
        String sql =
            "INSERT INTO member(m_id, m_password, m_name, m_email, role) " +
            "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);          // m_id
            pstmt.setString(2, passwd);      // m_password
            pstmt.setString(3, name);        // m_name
            pstmt.setString(4, email);       // m_email
            pstmt.setString(5, DEFAULT_ROLE); // 항상 일반회원으로 가입 → 'USER'

            return pstmt.executeUpdate();    // 1 기대
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ===================== 로그인 =====================
    // 1=성공, 0=비번틀림, -1=아이디 없음, -2=오류
    public int login(String id, String passwd) {
        String sql = "SELECT m_password FROM member WHERE m_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (!rs.next()) {
                    return -1;  // 아이디 없음
                }

                String dbPass = rs.getString("m_password");

                if (dbPass.equals(passwd)) {
                    return 1;   // 로그인 성공
                } else {
                    return 0;   // 비밀번호 틀림
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2;  // 기타 오류
    }

    // ===================== role 조회 =====================
    // 로그인 성공 후, 해당 회원의 role 가져오기
    public String getRoleById(String id) {
        String sql = "SELECT role FROM member WHERE m_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role");  // ADMIN / USER
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 혹시 못 찾으면 기본은 USER 취급
        return DEFAULT_ROLE;
    }
}
