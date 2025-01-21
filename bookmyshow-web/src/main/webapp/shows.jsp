<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${movie.title} - Show Times - CineBook</title>
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

        .movie-details {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .movie-details h2 {
            color: #fff;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .movie-info {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.1rem;
        }

        .show-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 30px;
            transition: all 0.3s ease;
        }

        .show-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .show-time {
            font-size: 1.5rem;
            color: #64b5f6;
            font-weight: bold;
        }

        .show-date {
            background: #64b5f6;
            color: #fff;
            padding: 8px 16px;
            border-radius: 12px;
            font-weight: 500;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            border-radius: 12px;
            padding: 12px;
            margin-bottom: 15px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #64b5f6;
            box-shadow: none;
            color: #fff;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        select.form-control option {
            background: #283593;
            color: #fff;
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

        .btn-success:hover:not([disabled]) {
            background: linear-gradient(90deg, #2196f3, #1976d2);
            transform: translateY(-2px);
        }

        .btn-success[disabled] {
            background: #ccc;
            cursor: not-allowed;
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

            .movie-details {
                padding: 20px;
            }

            .movie-details h2 {
                font-size: 1.5rem;
            }

            .show-card {
                padding: 20px;
            }

            .show-time {
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
        <div class="movie-details">
            <h2>${movie.title}</h2>
            <div class="row">
                <div class="col-md-4">
                    <p class="movie-info"><strong>Genre:</strong> ${movie.genre}</p>
                </div>
                <div class="col-md-4">
                    <p class="movie-info"><strong>Duration:</strong> ${movie.duration} minutes</p>
                </div>
                <div class="col-md-4">
                    <p class="movie-info"><strong>Language:</strong> ${movie.language}</p>
                </div>
            </div>
        </div>

        <h3 class="text-white mb-4">Available Shows</h3>
        <div class="row">
            <c:forEach var="show" items="${shows}">
                <div class="col-md-4">
                    <div class="show-card">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="show-time mb-0">
                                <fmt:formatDate type="time" value="${show.showTime}" pattern="hh:mm a" />
                            </h5>
                            <span class="show-date">
                                <fmt:formatDate type="date" value="${show.showTime}" pattern="EEE, MMM d" />
                            </span>
                        </div>
                        <p class="mb-2 text-white">Price: ₹<fmt:formatNumber value="${show.price}" pattern="#,##0.00"/></p>
                        <p class="mb-3 text-white">Available Seats: ${show.availableSeats}</p>
                        
                        <form method="post" action="${pageContext.request.contextPath}/book" onsubmit="return validateForm()">
                            <input type="hidden" name="showId" value="${show.showId}">
                            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                            <input type="number" name="seatsBooked" class="form-control" placeholder="Number of Seats" required>
                            <input type="hidden" name="totalAmount" value="${show.price}">
                            <select name="paymentMode" class="form-control" required>
                                <option value="">Select Payment Mode</option>
                                <option value="Credit Card">Credit Card</option>
                                <option value="Debit Card">Debit Card</option>
                                <option value="Net Banking">Net Banking</option>
                                <option value="UPI">UPI</option>
                            </select>
                            <button type="submit" class="btn btn-success" ${show.availableSeats == 0 ? 'disabled' : ''}>
                                ${show.availableSeats == 0 ? 'Sold Out' : 'Book Tickets'}
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            const seatsBooked = document.getElementsByName('seatsBooked')[0].value;
            if (seatsBooked === "") {
                alert("Please enter the number of seats.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>