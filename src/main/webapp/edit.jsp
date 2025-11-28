<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BoardDAO, model.BoardVO" %>

<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    
    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getOne(id);
    
    if (vo == null) {
        response.sendRedirect("list.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">글 수정</h2>

<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= vo.getId() %>">

    <div class="mb-3">
        <label for="title" class="form-label">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="<%= vo.getTitle() != null ? vo.getTitle() : "" %>" required>
    </div>

    <div class="mb-3">
        <label for="writer" class="form-label">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" value="<%= vo.getWriter() != null ? vo.getWriter() : "" %>" required>
    </div>

    <div class="mb-3">
        <label for="content" class="form-label">내용</label>
        <textarea class="form-control" id="content" name="content" rows="10" required><%= vo.getContent() != null ? vo.getContent() : "" %></textarea>
    </div>

    <div class="mb-3">
        <label for="file" class="form-label">첨부파일</label>
        <input type="file" class="form-control" id="file" name="file">
        <% if (vo.getFilename() != null && !vo.getFilename().isEmpty()) { %>
            <small class="form-text text-muted">
                현재 파일: <%= vo.getFilename() %> 
                <a href="download.jsp?filename=<%= java.net.URLEncoder.encode(vo.getFilename(), "UTF-8") %>">다운로드</a>
            </small>
            <small class="form-text text-muted d-block mt-1">
                새 파일을 선택하면 기존 파일이 교체됩니다.
            </small>
        <% } else { %>
            <small class="form-text text-muted">파일을 선택하지 않으면 기존 파일이 유지됩니다.</small>
        <% } %>
    </div>

    <div class="mt-3">
        <button type="submit" class="btn btn-primary">저장</button>
        <a href="view.jsp?id=<%= vo.getId() %>" class="btn btn-secondary">취소</a>
    </div>
</form>

</body>
</html>


