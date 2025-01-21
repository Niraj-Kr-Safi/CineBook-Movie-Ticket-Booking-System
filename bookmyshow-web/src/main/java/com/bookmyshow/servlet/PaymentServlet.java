package com.bookmyshow.servlet;

import com.bookmyshow.dao.BookingDAO;
import com.bookmyshow.dao.PaymentsDAO;
import com.bookmyshow.model.Booking;
import com.bookmyshow.model.Payment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/processPayment")
public class PaymentServlet extends HttpServlet {
    private BookingDAO bookingDAO;
    private PaymentsDAO paymentsDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
        paymentsDAO = new PaymentsDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String showIdStr = request.getParameter("showId");
        String userIdStr = request.getParameter("userId");
        String seatsBookedStr = request.getParameter("seatsBooked");
        String totalAmountStr = request.getParameter("totalAmount");
        String paymentMethod = request.getParameter("paymentMethod");
        String username = request.getParameter("username");
        String movieName = request.getParameter("movieName");
        String showTime = request.getParameter("showTime");
        String pricePerSeat = request.getParameter("pricePerSeat");

        int showId = Integer.parseInt(showIdStr);
        int userId = Integer.parseInt(userIdStr);
        int seatsBooked = Integer.parseInt(seatsBookedStr);
        BigDecimal totalAmount = new BigDecimal(totalAmountStr);

        try {
            // Simulate payment processing
            boolean paymentSuccessful = true; // Assume payment is successful for this simulation

            if (paymentSuccessful) {
                // Create booking
                Booking booking = new Booking();
                booking.setShowId(showId);
                booking.setUserId(userId);
                booking.setSeatsBooked(seatsBooked);
                booking.setBookingDate(new Date());
                booking.setTotalAmount(totalAmount);

                bookingDAO.addBooking(booking);

                // Create payment
                Payment payment = new Payment();
                payment.setBookingId(booking.getBookingId());
                payment.setPaymentMode(paymentMethod);
                payment.setAmount(totalAmount);

                paymentsDAO.addPayment(payment);

                request.setAttribute("message", "Booking successful!");
                request.setAttribute("username", username);
                request.setAttribute("movieName", movieName);
                request.setAttribute("showTime", showTime);
                request.setAttribute("showId", showId);
                request.setAttribute("userId", userId);
                request.setAttribute("seatsBooked", seatsBooked);
                request.setAttribute("pricePerSeat", pricePerSeat);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("paymentMethod", paymentMethod);
                RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("paymentMessage", "Payment failed. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
