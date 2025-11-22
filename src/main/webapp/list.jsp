<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BoardDAO, model.BoardVO, java.util.List" %>

<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = dao.getList();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h2 class="mb-4">게시판 목록</h2>
<a class="btn btn-primary mb-3" href="write.jsp">새 글 작성</a>

<table class="table table-bordered table-hover">
    <thead class="table-light">
    <tr>
        <th>ID</th><th>제목</th><th>작성자</th><th>날짜</th><th>삭제</th>
    </tr>
    </thead>

    <tbody>
    <% for(BoardVO vo : list) { %>
    <tr>
        <td><%= vo.getId() %></td>
        <td><%= vo.getTitle() %></td>
        <td><%= vo.getWriter() %></td>
        <td><%= vo.getRegdate() %></td>
        <td>
            <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-danger btn-sm">삭제</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
