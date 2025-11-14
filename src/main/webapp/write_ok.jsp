<%--
  Created by IntelliJ IDEA.
  User: chick
  Date: 25. 11. 14.
  Time: 오전 10:25
--%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // 🔥 POST 한글 깨짐 방지 필수 코드
    request.setCharacterEncoding("UTF-8");
%>

<html>
<body>
<h2>글 저장 완료</h2>

제목: <%= request.getParameter("title") %><br>
작성자: <%= request.getParameter("writer") %><br>
이메일: <%= request.getParameter("email") %><br>
카테고리: <%= request.getParameter("category") %><br>
내용: <%= request.getParameter("content") %><br><br>

<!-- 🔥 이동 경로 수정: 게시판 목록으로 -->
<a href="list.jsp">목록으로</a>

</body>
</html>
