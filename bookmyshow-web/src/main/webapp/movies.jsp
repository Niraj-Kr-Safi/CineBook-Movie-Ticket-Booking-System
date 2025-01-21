<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies - CineBook</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a237e, #283593, #3949ab);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            color: #fff;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .logo span {
            color: #64b5f6;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }

        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .main-content {
            padding-top: 100px;
            min-height: 100vh;
            max-width: 1200px;
            margin: 0 auto;
            padding-left: 20px;
            padding-right: 20px;
        }

        .filter-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-label {
            color: #fff;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .form-select {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            border-radius: 12px;
            padding: 12px;
        }

        .form-select:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #64b5f6;
            box-shadow: none;
        }

        .form-select option {
            background: #283593;
            color: #fff;
        }

        .btn-primary {
            background: linear-gradient(90deg, #64b5f6, #2196f3);
            border: none;
            padding: 12px 24px;
            border-radius: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(90deg, #2196f3, #1976d2);
            transform: translateY(-2px);
        }

        .movie-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            overflow: hidden;
            transition: all 0.3s ease;
            height: 100%;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 25px;
        }

        .card-title {
            color: #fff;
            font-size: 1.5rem;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .card-text {
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .btn-success {
            background: linear-gradient(90deg, #64b5f6, #2196f3);
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background: linear-gradient(90deg, #2196f3, #1976d2);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .header {
                padding: 1rem;
            }

            .logo {
                font-size: 20px;
            }

            .nav-links {
                gap: 10px;
            }

            .nav-links a {
                padding: 6px 12px;
                font-size: 14px;
            }

            .filter-section {
                padding: 20px;
            }

            .card-title {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav-container">
            <a href="/" class="logo">Cine<span>Book</span></a>
            <div class="nav-links">
                <a href="/">Home</a>
                <a href="/movies">Movies</a>
                <a href="/login.jsp">Sign In</a>
            </div>
        </nav>
    </header>

    <div class="main-content">
        <div class="filter-section">
            <form method="GET" action="${pageContext.request.contextPath}/movies" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Genre</label>
                    <select name="genre" class="form-select">
                        <option value="">All Genres</option>
                        <c:forEach var="genre" items="${genres}">
                            <option value="<c:out value='${genre}'/>" <c:if test="${selectedGenre == genre}">selected</c:if>>
                                <c:out value="${genre}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Language</label>
                    <select name="language" class="form-select">
                        <option value="">All Languages</option>
                        <c:forEach var="language" items="${languages}">
                            <option value="<c:out value='${language}'/>" <c:if test="${selectedLanguage == language}">selected</c:if>>
                                <c:out value="${language}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary">Apply Filters</button>
                </div>
            </form>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="movie" items="${movies}">
            
                <div class="col">
                    <div class="movie-card">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${movie.title}"/></h5>
                            <p class="card-text">
                                <strong>Genre:</strong> <c:out value="${movie.genre}"/><br>
                                <strong>Duration:</strong> <c:out value="${movie.duration}"/> minutes<br>
                                <strong>Language:</strong> <c:out value="${movie.language}"/>
                            </p>
                            <button type="button" 
                                    class="btn btn-success" 
                                    onclick="bookMovie(${movie.movieId}, '${movie.title}')">
                                Book Now
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        function bookMovie(movieId, movieTitle) {
            window.location.href = "${pageContext.request.contextPath}/shows?movieId=" + movieId;
        }
    </script>
</body>
</html>