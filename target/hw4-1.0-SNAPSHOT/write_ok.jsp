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
    
    // 파일 정보 가져오기
    String filename = FileUpload.getFileName(multi, "file");
    String filepath = null;
    if (filename != null && !filename.isEmpty()) {
        filepath = FileUpload.getUploadDir() + "/" + filename;
    }
    
    // 게시글 정보 저장
    BoardVO vo = new BoardVO();
    vo.setTitle(multi.getParameter("title"));
    vo.setWriter(multi.getParameter("writer"));
    vo.setEmail(multi.getParameter("email"));
    vo.setCategory(multi.getParameter("category"));
    vo.setContent(multi.getParameter("content"));
    vo.setFilename(filename);
    vo.setFilepath(filepath);

    BoardDAO dao = new BoardDAO();
    dao.insert(vo);
%>

<script>
    alert("글이 저장되었습니다!");
    location.href="list.jsp";
</script>
