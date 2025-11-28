<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BoardDAO, model.BoardVO, java.util.List" %>

<%
    request.setCharacterEncoding("UTF-8");
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list;
    
    // 검색 기능
    String keyword = request.getParameter("keyword");
    String sortBy = request.getParameter("sortBy");
    
    if (keyword != null && !keyword.trim().isEmpty()) {
        // 검색 결과
        list = dao.search(keyword.trim());
    } else {
        // 정렬 옵션 적용
        list = dao.getList(sortBy);
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h2 class="mb-4">게시판 목록</h2>

<div class="row mb-3">
    <div class="col-md-6">
        <a class="btn btn-primary" href="write.jsp">새 글 작성</a>
    </div>
    <div class="col-md-6">
        <!-- 검색 폼 -->
        <form method="get" action="list.jsp" class="d-flex">
            <input type="text" name="keyword" class="form-control me-2" 
                   placeholder="제목 또는 내용으로 검색" 
                   value="<%= keyword != null ? keyword : "" %>">
            <button type="submit" class="btn btn-outline-primary">검색</button>
            <% if (keyword != null && !keyword.trim().isEmpty()) { %>
                <a href="list.jsp" class="btn btn-outline-secondary ms-2">전체보기</a>
            <% } %>
        </form>
    </div>
</div>

<!-- 정렬 옵션 -->
<div class="mb-3">
    <span class="me-2">정렬:</span>
    <a href="list.jsp?sortBy=id_desc" class="btn btn-sm <%= (sortBy == null || sortBy.equals("id_desc")) ? "btn-primary" : "btn-outline-primary" %>">최신순</a>
    <a href="list.jsp?sortBy=title_asc" class="btn btn-sm <%= "title_asc".equals(sortBy) ? "btn-primary" : "btn-outline-primary" %>">제목↑</a>
    <a href="list.jsp?sortBy=title_desc" class="btn btn-sm <%= "title_desc".equals(sortBy) ? "btn-primary" : "btn-outline-primary" %>">제목↓</a>
    <a href="list.jsp?sortBy=date_asc" class="btn btn-sm <%= "date_asc".equals(sortBy) ? "btn-primary" : "btn-outline-primary" %>">등록일↑</a>
    <a href="list.jsp?sortBy=date_desc" class="btn btn-sm <%= "date_desc".equals(sortBy) ? "btn-primary" : "btn-outline-primary" %>">등록일↓</a>
    <a href="list.jsp?sortBy=viewcount_desc" class="btn btn-sm <%= "viewcount_desc".equals(sortBy) ? "btn-primary" : "btn-outline-primary" %>">조회수↓</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-light">
    <tr>
        <th width="60">ID</th>
        <th>제목</th>
        <th width="100">작성자</th>
        <th width="120">날짜</th>
        <th width="80">조회수</th>
        <th width="80">파일</th>
        <th width="100">작업</th>
    </tr>
    </thead>

    <tbody>
    <% 
        if (list.isEmpty()) { 
    %>
        <tr>
            <td colspan="7" class="text-center">등록된 게시글이 없습니다.</td>
        </tr>
    <% 
        } else {
            for(BoardVO vo : list) { 
    %>
        <tr>
            <td><%= vo.getId() %></td>
            <td>
                <a href="view.jsp?id=<%= vo.getId() %>" style="text-decoration: none; color: inherit;">
                    <%= vo.getTitle() != null ? vo.getTitle() : "" %>
                </a>
            </td>
            <td><%= vo.getWriter() != null ? vo.getWriter() : "" %></td>
            <td><%= vo.getRegdate() != null ? vo.getRegdate() : "" %></td>
            <td class="text-center"><%= vo.getViewcount() %></td>
            <td class="text-center">
                <% if (vo.getFilename() != null && !vo.getFilename().isEmpty()) { %>
                    <span class="badge bg-success">✓</span>
                <% } else { %>
                    <span class="badge bg-secondary">-</span>
                <% } %>
            </td>
            <td>
                <a href="view.jsp?id=<%= vo.getId() %>" class="btn btn-sm btn-info">보기</a>
                <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-sm btn-danger" 
                   onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
            </td>
        </tr>
    <% 
            }
        } 
    %>
    </tbody>
</table>

</body>
</html>
