package com.bookmyshow.dao;

import com.bookmyshow.model.Booking;
import com.bookmyshow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookingDAO {

    public void addBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO bookings (show_id, user_id, seats_booked, total_amount, booking_date) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, booking.getShowId());
            stmt.setInt(2, booking.getUserId());
            stmt.setInt(3, booking.getSeatsBooked());
            stmt.setBigDecimal(4, booking.getTotalAmount());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating booking failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    booking.setBookingId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating booking failed, no ID obtained.");
                }
            }

            // Update available seats in the shows table
            String updateSeatsSql = "UPDATE shows SET available_seats = available_seats - ? WHERE show_id = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSeatsSql)) {
                updateStmt.setInt(1, booking.getSeatsBooked());
                updateStmt.setInt(2, booking.getShowId());
                updateStmt.executeUpdate();
            }
        }
    }

    // Other methods (if any)
}
