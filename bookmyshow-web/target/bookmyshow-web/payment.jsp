// payment.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-5">
        <div class="card">
            <div class="card-header">
                <h3>Payment Details</h3>
            </div>
            <div class="card-body">
                <div class="mb-4">
                    <h5>Booking Summary:</h5>
                    <p>Number of Seats: ${booking.numberOfSeats}</p>
                    <p>Total Amount: ₹<fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></p>
                </div>

                <form action="payment" method="post">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                    
                    <div class="mb-3">
                        <label class="form-label">Payment Method:</label>
                        <select name="paymentMethod" class="form-select" required>
                            <option value="card">Credit/Debit Card</option>
                            <option value="upi">UPI</option>
                            <option value="netbanking">Net Banking</option>
                        </select>
                    </div>

                    <div id="cardDetails" class="mb-3">
                        <label for="cardNumber" class="form-label">Card Number:</label>
                        <input type="text" name="cardNumber" class="form-control" pattern="[0-9]{16}" placeholder="Enter 16-digit card number">
                        
                        <div class="row mt-3">
                            <div class="col">
                                <label for="expiryDate" class="form-label">Expiry Date:</label>
                                <input type="text" name="expiryDate" class="form-control" placeholder="MM/YY">
                            </div>
                            <div class="col">
                                <label for="cvv" class="form-label">CVV:</label>
                                
                                
                                <input type="password" name="cvv" class="form-control" pattern="[0-9]{3}" placeholder="CVV">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-success">Pay ₹<fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.querySelector('select[name="paymentMethod"]').addEventListener('change', function() {
            const cardDetails = document.getElementById('cardDetails');
            cardDetails.style.display = this.value === 'card' ? 'block' : 'none';
        });
    </script>
</body>
</html>
                                