<%--
  Created by IntelliJ IDEA.
  User: chick
  Date: 25. 11. 27.
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form method="post", action="fileupload_ok.jsp" enctype="multipart/form-data">
    <input type = "text" name = "title"/>
    <input type="file" name="img"/>
    <input type="submit" vaule="upload"/>
  </form>
</body>
</html>
