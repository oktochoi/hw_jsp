package dao;

import model.BoardVO;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // ▶ 목록 조회 (정렬 옵션 포함)
    public List<BoardVO> getList(String sortBy) {
        List<BoardVO> list = new ArrayList<>();
        String orderBy = "id DESC"; // 기본값
        
        if (sortBy != null && !sortBy.isEmpty()) {
            switch (sortBy) {
                case "title_asc":
                    orderBy = "title ASC";
                    break;
                case "title_desc":
                    orderBy = "title DESC";
                    break;
                case "date_asc":
                    orderBy = "regdate ASC";
                    break;
                case "date_desc":
                    orderBy = "regdate DESC";
                    break;
                case "viewcount_desc":
                    orderBy = "viewcount DESC";
                    break;
                default:
                    orderBy = "id DESC";
            }
        }
        
        String sql = "SELECT * FROM board ORDER BY " + orderBy;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BoardVO vo = mapResultSetToVO(rs);
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // ▶ 기본 목록 조회 (기존 호환성 유지)
    public List<BoardVO> getList() {
        return getList(null);
    }
    
    // ▶ 검색 기능
    public List<BoardVO> search(String keyword) {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT * FROM board WHERE title LIKE ? OR content LIKE ? ORDER BY id DESC";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BoardVO vo = mapResultSetToVO(rs);
                    list.add(vo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // ▶ 상세 조회 (1건)
    public BoardVO getOne(int id) {
        String sql = "SELECT * FROM board WHERE id=?";
        BoardVO vo = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    vo = mapResultSetToVO(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }
    
    // ▶ 조회수 증가
    public void incrementViewCount(int id) {
        String sql = "UPDATE board SET viewcount = COALESCE(viewcount, 0) + 1 WHERE id=?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // ▶ ResultSet을 BoardVO로 매핑하는 헬퍼 메서드
    private BoardVO mapResultSetToVO(ResultSet rs) throws SQLException {
        BoardVO vo = new BoardVO();
        vo.setId(rs.getInt("id"));
        vo.setTitle(rs.getString("title"));
        vo.setWriter(rs.getString("writer"));
        vo.setEmail(rs.getString("email"));
        vo.setCategory(rs.getString("category"));
        vo.setContent(rs.getString("content"));
        vo.setRegdate(rs.getString("regdate"));
        
        // 파일 필드 (null일 수 있음)
        try {
            vo.setFilename(rs.getString("filename"));
            vo.setFilepath(rs.getString("filepath"));
        } catch (SQLException e) {
            // 컬럼이 없을 수 있으므로 무시
        }
        
        // 조회수 필드 (null일 수 있음)
        try {
            vo.setViewcount(rs.getInt("viewcount"));
        } catch (SQLException e) {
            vo.setViewcount(0);
        }
        
        return vo;
    }

    // ▶ 글 저장 (파일 포함)
    public void insert(BoardVO vo) {
        String sql = "INSERT INTO board (title, writer, email, category, content, filename, filepath, viewcount) VALUES (?, ?, ?, ?, ?, ?, ?, 0)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getWriter());
            ps.setString(3, vo.getEmail());
            ps.setString(4, vo.getCategory());
            ps.setString(5, vo.getContent());
            ps.setString(6, vo.getFilename());
            ps.setString(7, vo.getFilepath());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // ▶ 글 수정
    public void update(BoardVO vo) {
        String sql;
        if (vo.getFilename() != null && !vo.getFilename().isEmpty()) {
            // 파일이 있는 경우 파일도 업데이트
            sql = "UPDATE board SET title=?, writer=?, content=?, filename=?, filepath=? WHERE id=?";
        } else {
            // 파일이 없는 경우 파일 필드는 업데이트하지 않음
            sql = "UPDATE board SET title=?, writer=?, content=? WHERE id=?";
        }

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getWriter());
            ps.setString(3, vo.getContent());
            
            if (vo.getFilename() != null && !vo.getFilename().isEmpty()) {
                ps.setString(4, vo.getFilename());
                ps.setString(5, vo.getFilepath());
                ps.setInt(6, vo.getId());
            } else {
                ps.setInt(4, vo.getId());
            }
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // ▶ 파일 정보 조회 (삭제 시 사용)
    public BoardVO getFileInfo(int id) {
        String sql = "SELECT filename, filepath FROM board WHERE id=?";
        BoardVO vo = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    vo = new BoardVO();
                    vo.setFilename(rs.getString("filename"));
                    vo.setFilepath(rs.getString("filepath"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
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
