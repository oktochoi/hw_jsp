<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BoardDAO, model.BoardVO" %>

<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    
    BoardDAO dao = new BoardDAO();
    // 조회수 증가
    dao.incrementViewCount(id);
    // 게시글 조회
    BoardVO vo = dao.getOne(id);
    
    if (vo == null) {
        response.sendRedirect("list.jsp");
        return;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">상세보기</h2>

<div class="card">
    <div class="card-body">
        <table class="table table-bordered">
            <tr>
                <th width="100">글번호</th>
                <td><%= vo.getId() %></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><%= vo.getTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= vo.getWriter() %></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><%= vo.getEmail() != null ? vo.getEmail() : "" %></td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td><%= vo.getCategory() != null ? vo.getCategory() : "" %></td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><%= vo.getRegdate() != null ? vo.getRegdate() : "" %></td>
            </tr>
            <tr>
                <th>조회수</th>
                <td><%= vo.getViewcount() %></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td>
                    <% if (vo.getFilename() != null && !vo.getFilename().isEmpty()) { %>
                        <a href="download.jsp?filename=<%= java.net.URLEncoder.encode(vo.getFilename(), "UTF-8") %>" class="btn btn-sm btn-outline-primary">
                            <%= vo.getFilename() %> 다운로드
                        </a>
                    <% } else { %>
                        첨부파일 없음
                    <% } %>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td><%= vo.getContent() != null ? vo.getContent().replace("\n", "<br>") : "" %></td>
            </tr>
        </table>
        
        <div class="mt-3">
            <a href="edit.jsp?id=<%= vo.getId() %>" class="btn btn-primary">수정</a>
            <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
            <a href="list.jsp" class="btn btn-secondary">목록으로</a>
        </div>
    </div>
</div>

</body>
</html>
