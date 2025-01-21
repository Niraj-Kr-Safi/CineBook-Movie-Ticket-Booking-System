<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation - CineBook</title>
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
            max-width: 800px;
            margin: 0 auto;
            padding-left: 20px;
            padding-right: 20px;
        }

        .confirmation-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            margin-bottom: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .confirmation-card h1 {
            color: #64b5f6;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-align: center;
        }

        .success-message {
            background: rgba(76, 175, 80, 0.1);
            border: 1px solid rgba(76, 175, 80, 0.3);
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 30px;
            text-align: center;
            color: #81c784;
        }

        .booking-details {
            display: grid;
            gap: 15px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .detail-label {
            color: rgba(255, 255, 255, 0.7);
            font-weight: 500;
        }

        .detail-value {
            color: #fff;
            font-weight: 600;
        }

        .total-amount {
            font-size: 1.2rem;
            color: #64b5f6;
            border-top: 2px solid rgba(255, 255, 255, 0.2);
            margin-top: 20px;
            padding-top: 20px;
        }

        .btn-back {
            background: linear-gradient(90deg, #64b5f6, #2196f3);
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 12px;
            display: inline-block;
            margin-top: 30px;
            transition: all 0.3s ease;
            text-align: center;
            font-weight: 500;
        }

        .btn-back:hover {
            background: linear-gradient(90deg, #2196f3, #1976d2);
            transform: translateY(-2px);
            color: white;
        }

        @media (max-width: 768px) {
            .header {
                padding: 1rem;
            }

            .confirmation-card {
                padding: 20px;
            }

            .confirmation-card h1 {
                font-size: 2rem;
            }

            .detail-row {
                flex-direction: column;
                gap: 5px;
            }

            .detail-value {
                text-align: right;
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
        <div class="confirmation-card">
            <h1>Booking Confirmation</h1>
            <div class="success-message">
                <c:out value="${message}" />
            </div>
            
            <div class="booking-details">
                <div class="detail-row">
                    <span class="detail-label">Username</span>
                    <span class="detail-value"><c:out value="${username}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Movie Name</span>
                    <span class="detail-value"><c:out value="${movieName}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Show Time</span>
                    <span class="detail-value"><c:out value="${showTime}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Show ID</span>
                    <span class="detail-value">#<c:out value="${showId}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">User ID</span>
                    <span class="detail-value">#<c:out value="${userId}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Seats Booked</span>
                    <span class="detail-value"><c:out value="${seatsBooked}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Price per Seat</span>
                    <span class="detail-value">₹<c:out value="${pricePerSeat}" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Payment Method</span>
                    <span class="detail-value"><c:out value="${paymentMethod}" /></span>
                </div>
                <div class="detail-row total-amount">
                    <span class="detail-label">Total Amount</span>
                    <span class="detail-value">₹<c:out value="${totalAmount}" /></span>
                </div>
            </div>
            
            <a href="movies.jsp" class="btn-back">Back to Movies</a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>