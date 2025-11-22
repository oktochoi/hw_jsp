<%@ page import="dao.BoardDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDAO dao = new BoardDAO();
    dao.delete(id);
%>

<script>
    alert("삭제 완료");
    location.href="list.jsp";
</script>