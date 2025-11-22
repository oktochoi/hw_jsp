<%@ page import="dao.BoardDAO, model.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    BoardVO vo = new BoardVO();
    vo.setTitle(request.getParameter("title"));
    vo.setWriter(request.getParameter("writer"));
    vo.setEmail(request.getParameter("email"));
    vo.setCategory(request.getParameter("category"));
    vo.setContent(request.getParameter("content"));

    BoardDAO dao = new BoardDAO();
    dao.insert(vo);
%>

<script>
    alert("글이 저장되었습니다!");
    location.href="list.jsp";
</script>
