<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">새글 작성</h2>

<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="title" class="form-label">제목</label>
        <input type="text" class="form-control" id="title" name="title" required>
    </div>

    <div class="mb-3">
        <label for="writer" class="form-label">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" required>
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email">
    </div>

    <div class="mb-3">
        <label for="category" class="form-label">카테고리</label>
        <select class="form-control" id="category" name="category">
            <option value="공지">공지</option>
            <option value="일반" selected>일반</option>
            <option value="문의">문의</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="content" class="form-label">내용</label>
        <textarea class="form-control" id="content" name="content" rows="10" required></textarea>
    </div>

    <div class="mb-3">
        <label for="file" class="form-label">첨부파일</label>
        <input type="file" class="form-control" id="file" name="file">
        <small class="form-text text-muted">최대 10MB까지 업로드 가능합니다.</small>
    </div>

    <div class="mt-3">
        <button type="submit" class="btn btn-primary">저장</button>
        <a href="list.jsp" class="btn btn-secondary">취소</a>
    </div>
</form>

</body>
</html>
