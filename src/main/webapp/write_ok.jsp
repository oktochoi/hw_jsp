<%--
  Created by IntelliJ IDEA.
  User: chick
  Date: 25. 11. 14.
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html><body>
<h2>글 저장 완료</h2>

제목: <%=request.getParameter("title")%><br>
작성자: <%=request.getParameter("writer")%><br>
이메일: <%=request.getParameter("email")%><br>
카테고리: <%=request.getParameter("category")%><br>
내용: <%=request.getParameter("content")%><br><br>

<a href="form.jsp">목록으로</a>
</body></html>
