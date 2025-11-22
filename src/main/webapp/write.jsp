<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>글 작성</title></head>
<body>
<h2>새글 작성</h2>

<form action="write_ok.jsp" method="post">
  제목: <input type="text" name="title"><br><br>
  작성자: <input type="text" name="writer"><br><br>
  이메일: <input type="email" name="email"><br><br>
  카테고리:
  <select name="category">
    <option>공지</option>
    <option>일반</option>
    <option>문의</option>
  </select><br><br>

  내용:<br>
  <textarea name="content" rows="5" cols="40"></textarea><br><br>

  <button type="submit">저장</button>
</form>

</body>
</html>
