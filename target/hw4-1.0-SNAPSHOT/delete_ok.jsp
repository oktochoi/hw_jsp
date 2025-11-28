<%@ page import="dao.BoardDAO, model.BoardVO, util.FileUpload" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDAO dao = new BoardDAO();
    
    // 삭제 전 파일 정보 조회
    BoardVO vo = dao.getFileInfo(id);
    
    // 게시글 삭제
    dao.delete(id);
    
    // 첨부 파일 삭제
    if (vo != null && vo.getFilepath() != null && !vo.getFilepath().isEmpty()) {
        String filePath = application.getRealPath("/") + vo.getFilepath();
        FileUpload.deleteFile(filePath);
    }
%>

<script>
    alert("삭제 완료");
    location.href="list.jsp";
</script>