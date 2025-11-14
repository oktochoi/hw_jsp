<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<body>
<h2>📌 JSP 데이터 수신 결과</h2>

이름: <%= request.getParameter("name") %><br><br>
나이: <%= request.getParameter("age") %><br><br>
이메일: <%= request.getParameter("email") %><br><br>
성별: <%= request.getParameter("gender") %><br><br>
관심분야: <%= request.getParameter("interest") %><br><br>
자기소개: <%= request.getParameter("intro") %><br><br>

<a href="form.html">다시 입력하기</a>

</body>
</html>
