<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>JSP Homework Main</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">JSP Homework</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="list.jsp">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="write.html">새 글 작성</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="form.html">Form 테스트</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<header class="py-5 text-center bg-white shadow-sm">
    <div class="container">
        <h1 class="display-5 fw-bold">📌 JSP 프로젝트 메인 페이지</h1>
        <p class="lead text-muted">
            Bootstrap 기반으로 스타일링된 JSP 과제 메인 화면입니다.<br>
            아래 메뉴를 통해 CRUD 게시판 및 Form 테스트를 사용할 수 있습니다.
        </p>
        <a href="list.jsp" class="btn btn-primary btn-lg mt-3">게시판 바로가기</a>
    </div>
</header>

<!-- Cards Section -->
<section class="container py-5">

    <div class="row g-4">

        <!-- Card 1 -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title fw-bold">📝 게시판</h5>
                    <p class="card-text">
                        Mock Data 기반으로 구현된 JSP 게시판입니다.
                        목록, 상세보기, 글쓰기, 수정, 삭제 기능을 포함합니다.
                    </p>
                    <a href="list.jsp" class="btn btn-outline-primary">이동</a>
                </div>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title fw-bold">✍️ 새 글 작성</h5>
                    <p class="card-text">
                        HTML Form과 JSP 연결을 보여주는 글 작성 페이지입니다.
                    </p>
                    <a href="write.html" class="btn btn-outline-success">작성하기</a>
                </div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title fw-bold">📩 Form 테스트</h5>
                    <p class="card-text">
                        form.html → form_ok.jsp<br>
                        JSP 데이터 전달 테스트 페이지입니다.
                    </p>
                    <a href="form.html" class="btn btn-outline-info">Form 테스트</a>
                </div>
            </div>
        </div>

    </div>

</section>

<!-- Footer -->
<footer class="py-4 bg-primary text-white text-center mt-5">
    <p class="mb-0">© 2025 JSP Homework by Okto · Bootstrap 5 UI</p>
</footer>

<!-- Bootstrap Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
