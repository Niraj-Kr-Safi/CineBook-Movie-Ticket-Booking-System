<form action="${pageContext.request.contextPath}/book" method="post">
    <input type="hidden" name="userId" value="${user.id}" />
    <input type="hidden" name="showId" value="${show.id}" />
    <div>
        <label>Seats:</label>
        <input type="number" name="seatCount" required />
    </div>
    <div>
        <label>Total Price:</label>
        <input type="text" name="totalPrice" readonly value="${show.price * seatCount}" />
    </div>
    <div>
        <label>Payment Method:</label>
        <select name="paymentMethod">
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="UPI">UPI</option>
        </select>
    </div>
    <button type="submit">Book</button>
</form>
