package com.bookmyshow.dao;

import com.bookmyshow.model.Payment;
import com.bookmyshow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymentsDAO {

    public void addPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO payments (booking_id, payment_mode, amount, payment_date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, payment.getBookingId());
            stmt.setString(2, payment.getPaymentMode());
            stmt.setBigDecimal(3, payment.getAmount());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating payment failed, no rows affected.");
            }
        }
    }

    // Other methods (if any)
}
