package com.bookmyshow.servlet;

import com.bookmyshow.dao.BookingDAO;
import com.bookmyshow.dao.PaymentDAO;
import com.bookmyshow.model.Booking;
import com.bookmyshow.model.Payment;
import com.bookmyshow.model.Show;
import com.bookmyshow.model.User;
import com.bookmyshow.dao.ShowDAO;
import com.bookmyshow.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {
    private BookingDAO bookingDAO;
    private ShowDAO showDAO;
    private UserDAO userDAO;
    private PaymentDAO paymentDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
        showDAO = new ShowDAO();
        userDAO = new UserDAO();
        paymentDAO = new PaymentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String showIdStr = request.getParameter("showId");
        String userIdStr = request.getParameter("userId");
        String seatsBookedStr = request.getParameter("seatsBooked");
        String pricePerSeatStr = request.getParameter("totalAmount");
        String paymentMode = request.getParameter("paymentMode");

        if (showIdStr == null || showIdStr.isEmpty() || userIdStr == null || userIdStr.isEmpty() ||
            seatsBookedStr == null || seatsBookedStr.isEmpty() || pricePerSeatStr == null || pricePerSeatStr.isEmpty() ||
            paymentMode == null || paymentMode.isEmpty()) {
            request.setAttribute("message", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("shows.jsp");
            dispatcher.forward(request, response);
            return;
        }

        int showId = Integer.parseInt(showIdStr);
        int userId = Integer.parseInt(userIdStr);
        int seatsBooked = Integer.parseInt(seatsBookedStr);
        BigDecimal pricePerSeat = new BigDecimal(pricePerSeatStr);
        BigDecimal totalAmount = pricePerSeat.multiply(new BigDecimal(seatsBooked));

        Booking booking = new Booking();
        booking.setShowId(showId);
        booking.setUserId(userId);
        booking.setSeatsBooked(seatsBooked);
        booking.setBookingDate(new Date());
        booking.setTotalAmount(totalAmount);

        try {
            bookingDAO.addBooking(booking);

            Payment payment = new Payment();
            payment.setBookingId(booking.getBookingId());
            payment.setPaymentMode(paymentMode);
            payment.setAmount(totalAmount);
            paymentDAO.addPayment(payment);

            Show show = showDAO.getShowById(showId);
            User user = userDAO.getUserById(userId);

            request.setAttribute("message", "Booking and payment successful!");
            request.setAttribute("showId", showId);
            request.setAttribute("userId", userId);
            request.setAttribute("username", user.getUsername());
            request.setAttribute("movieName", show.getMovieName());
            request.setAttribute("showTime", show.getShowTime());
            request.setAttribute("seatsBooked", seatsBooked);
            request.setAttribute("pricePerSeat", pricePerSeat);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("paymentMethod", paymentMode);
            RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
