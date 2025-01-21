<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Tickets - ${movie.title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-5">
        <div class="card">
            <div class="card-header">
                <h3>Book Tickets for ${movie.title}</h3>
            </div>
            <div class="card-body">
                <div class="mb-4">
                    <h5>Show Details:</h5>
                    <p>Date & Time: <fmt:formatDate value="${show.showTime}" pattern="EEEE, MMMM d, yyyy 'at' hh:mm a" /></p>
                    <p>Price per ticket: ₹<fmt:formatNumber value="${show.price}" pattern="#,##0.00" /></p>
                    <p>Available seats: ${show.availableSeats}</p>
                </div>

                <form action="booking" method="post">
                    <input type="hidden" name="showId" value="${show.showId}" />

                    <div class="mb-3">
                        <label for="numberOfSeats" class="form-label">Number of Seats:</label>
                        <select name="numberOfSeats" id="numberOfSeats" class="form-select" required>
                            <c:choose>
                                <c:when test="${show.availableSeats > 0}">
                                    <c:choose>
                                        <c:when test="${show.availableSeats > 10}">
                                            <c:set var="maxAvailable" value="10" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="maxAvailable" value="${show.availableSeats}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach var="i" begin="1" end="${maxAvailable}">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="">No seats available</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>

                    <div class="mb-3">
                        <p>Total Amount: ₹<span id="totalAmount">0.00</span></p>
                    </div>

                    <c:if test="${show.availableSeats > 0}">
                        <button type="submit" class="btn btn-primary">Proceed to Payment</button>
                    </c:if>
                    <c:if test="${show.availableSeats <= 0}">
                        <button type="button" class="btn btn-secondary" disabled>No Seats Available</button>
                    </c:if>
                </form>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">
                        ${error}
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('numberOfSeats').addEventListener('change', function() {
        const seats = parseInt(this.value) || 0;
        const price = ${show.price != null ? show.price : 0};
        const total = seats * price;
        document.getElementById('totalAmount').textContent = total.toFixed(2);
    });
    </script>
</body>
</html>
