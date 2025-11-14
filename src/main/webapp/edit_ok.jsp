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
<h2>수정 완료</h2>

글번호: <%= request.getParameter("id") %><br>
제목: <%= request.getParameter("title") %><br>
작성자: <%= request.getParameter("writer") %><br>
내용: <%= request.getParameter("content") %><br><br>

<!-- 🔥 흐름에 맞게 list.jsp로 돌아가도록 수정 -->
<a href="list.jsp">목록으로</a>

</body>
</html>
