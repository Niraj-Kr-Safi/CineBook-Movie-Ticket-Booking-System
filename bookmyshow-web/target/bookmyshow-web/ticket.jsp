// ticket.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Ticket - ${movie.title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .ticket {
            border: 2px solid #333;
            border-radius: 15px;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            background-color: #fff;
        }
        .ticket-header {
            border-bottom: 2px dashed #333;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }
        .ticket-content {
            margin: 20px 0;
        }
        .ticket-footer {
            border-top: 2px dashed #333;
            padding-top: 15px;
            margin-top: 15px;
        }
        .qr-code {
            text-align: center;
            margin: 20px 0;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                background-color: #fff;
            }
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="ticket shadow">
            <div class="ticket-header">
                <h2 class="text-center mb-0">BookMyShow</h2>
            </div>
            
            <div class="ticket-content">
                <div class="row">
                    <div class="col-md-8">
                        <h3>${movie.title}</h3>
                        <p>
                            <strong>Show Time:</strong><br>
                            <fmt:formatDate value="${show.showTime}" pattern="EEEE, MMMM d, yyyy 'at' hh:mm a" />
                        </p>
                        <p>
                            <strong>Number of Seats:</strong> ${booking.numberOfSeats}<br>
                            <strong>Total Amount:</strong> ₹<fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/>
                        </p>
                        <p>
                            <strong>Booking ID:</strong> ${booking.bookingId}<br>
                            <strong>Payment ID:</strong> ${booking.paymentId}
                        </p>
                    </div>
                    <div class="col-md-4">
                        <div class="qr-code">
                            <!-- Replace with actual QR code -->
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII=" alt="QR Code">
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="ticket-footer text-center">
                <small>Please show this ticket at the entrance. Valid ID proof may be required.</small>
            </div>
        </div>
        
        <div class="text-center mt-4 no-print">
            <button onclick="window.print()" class="btn btn-primary">Print Ticket</button>
            <a href="${pageContext.request.contextPath}/movies" class="btn btn-secondary">Back to Movies</a>
        </div>
    </div>
</body>
</html>