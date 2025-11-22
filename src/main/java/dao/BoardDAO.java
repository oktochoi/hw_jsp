package dao;

import model.BoardVO;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // ▶ 목록 조회
    public List<BoardVO> getList() {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT * FROM board ORDER BY id DESC";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setEmail(rs.getString("email"));
                vo.setCategory(rs.getString("category"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getString("regdate"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ▶ 글 저장
    public void insert(BoardVO vo) {
        String sql = "INSERT INTO board (title, writer, email, category, content) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getWriter());
            ps.setString(3, vo.getEmail());
            ps.setString(4, vo.getCategory());
            ps.setString(5, vo.getContent());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ▶ 글 삭제
    public void delete(int id) {
        String sql = "DELETE FROM board WHERE id=?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
