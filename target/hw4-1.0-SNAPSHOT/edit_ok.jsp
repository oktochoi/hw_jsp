<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BoardDAO, model.BoardVO, util.FileUpload, com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>

<%
    request.setCharacterEncoding("UTF-8");
    
    // 업로드 경로 설정
    String savePath = application.getRealPath("/") + FileUpload.getUploadDir();
    MultipartRequest multi = FileUpload.uploadFile(request, savePath);
    
    if (multi == null) {
%>
        <script>
            alert("파일 업로드 중 오류가 발생했습니다.");
            history.back();
        </script>
<%
        return;
    }
    
    // 기존 게시글 파일 정보 조회 (기존 파일 삭제를 위해)
    int id = Integer.parseInt(multi.getParameter("id"));
    BoardDAO dao = new BoardDAO();
    BoardVO oldVo = dao.getFileInfo(id);
    
    // 새 파일 업로드 확인
    String newFileName = FileUpload.getFileName(multi, "file");
    String filename = null;
    String filepath = null;
    
    if (newFileName != null && !newFileName.isEmpty()) {
        // 새 파일이 업로드된 경우
        filename = newFileName;
        filepath = FileUpload.getUploadDir() + "/" + filename;
        
        // 기존 파일 삭제
        if (oldVo != null && oldVo.getFilename() != null && !oldVo.getFilename().isEmpty()) {
            String oldFilePath = application.getRealPath("/") + oldVo.getFilepath();
            FileUpload.deleteFile(oldFilePath);
        }
    } else {
        // 새 파일이 없는 경우 기존 파일 정보 유지
        if (oldVo != null) {
            filename = oldVo.getFilename();
            filepath = oldVo.getFilepath();
        }
    }
    
    // 게시글 정보 업데이트
    BoardVO vo = new BoardVO();
    vo.setId(id);
    vo.setTitle(multi.getParameter("title"));
    vo.setWriter(multi.getParameter("writer"));
    vo.setContent(multi.getParameter("content"));
    vo.setFilename(filename);
    vo.setFilepath(filepath);
    
    dao.update(vo);
%>

<script>
    alert("수정이 완료되었습니다!");
    location.href="view.jsp?id=<%= id %>";
</script>

