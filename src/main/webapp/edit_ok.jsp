<%--
  Created by IntelliJ IDEA.
  User: chick
  Date: 25. 11. 14.
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<html><body>
<h2>수정 완료</h2>

글번호: <%=request.getParameter("id")%><br>
제목: <%=request.getParameter("title")%><br>
작성자: <%=request.getParameter("writer")%><br>
내용: <%=request.getParameter("content")%><br><br>

<a href="list.jsp">목록으로</a>
</body></html>
