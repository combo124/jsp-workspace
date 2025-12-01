package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LibraryDao {

    // 🔹 싱글톤
    private static final LibraryDao instance = new LibraryDao();

    public static LibraryDao getInstance() {
        return instance;
    }

    private LibraryDao() {}

    private Connection getConnection() throws Exception {
        return DBUtil.getConnection();
    }

    // 1) 해당 회원이 가진 게임 ID 리스트 가져오기
    public List<String> getBookIdsByMember(String mId) {
        String sql = "SELECT b_id FROM library WHERE m_id = ? ORDER BY purchased_at DESC";

        List<String> list = new ArrayList<>();

        System.out.println("[LibraryDao] getBookIdsByMember 호출, mId = " + mId);

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, mId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String bId = rs.getString("b_id");
                    list.add(bId);
                }
            }

            System.out.println("[LibraryDao] -> " + list.size() + "개 게임 조회됨");

        } catch (Exception e) {
            System.out.println("[LibraryDao] ❌ getBookIdsByMember 예외 발생");
            e.printStackTrace();
        }

        return list;
    }

    // 2) 라이브러리에 게임 추가 (구매 시 호출)
    public int addToLibrary(String mId, String bId) {
        // PK가 (m_id, b_id)라서 이미 있으면 에러 나니까 IGNORE 사용
        String sql = "INSERT IGNORE INTO library(m_id, b_id) VALUES(?, ?)";

        System.out.println("[LibraryDao] addToLibrary 호출, mId = " + mId + ", bId = " + bId);

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, mId);
            pstmt.setString(2, bId);

            int result = pstmt.executeUpdate();  // 1이면 새로 추가, 0이면 이미 있었음
            System.out.println("[LibraryDao] -> executeUpdate 결과 = " + result);
            return result;

        } catch (Exception e) {
            System.out.println("[LibraryDao] ❌ addToLibrary 예외 발생");
            e.printStackTrace();
        }
        return 0;
    }

    // 🔸 JSP에서 예전에 addGame() 이름으로 썼다면, 이거 호출해도 동작하게 래퍼 추가
    public int addGame(String mId, String bId) {
        return addToLibrary(mId, bId);
    }
}
