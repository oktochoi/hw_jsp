<%--
  Created by IntelliJ IDEA.
  User: chick
  Date: 25. 11. 14.
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Mock Data (DB 대신)
    String[][] mock = {
            {"1", "첫 번째 글입니다", "관리자", "내용1"},
            {"2", "두 번째 글입니다", "홍길동", "내용2"},
            {"3", "세 번째 글입니다", "김철수", "내용3"}
    };
%>

<html>
<body>
<h2>게시판 목록</h2>

<a href="write.html">새글작성</a>
<br><br>

<table border="1" width="500">
    <tr>
        <th>ID</th><th>제</th><th>작성자</th><th>보기</th>
    </tr>

    <%
        for(int i=0;i<mock.length;i++){
    %>
    <tr>
        <td><%=mock[i][0]%></td>
        <td><%=mock[i][1]%></td>
        <td><%=mock[i][2]%></td>
        <td>
            <a href="view.jsp?id=<%=mock[i][0]%>&title=<%=mock[i][1]%>&writer=<%=mock[i][2]%>&content=<%=mock[i][3]%>">
                상세보기</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
