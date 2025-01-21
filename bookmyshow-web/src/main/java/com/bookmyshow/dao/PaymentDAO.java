package com.bookmyshow.dao;

import com.bookmyshow.model.Payment;
import com.bookmyshow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentDAO {

    public void addPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO payments (booking_id, payment_mode, amount, payment_date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, payment.getBookingId());
            stmt.setString(2, payment.getPaymentMode());
            stmt.setBigDecimal(3, payment.getAmount());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating payment failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    payment.setPaymentId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating payment failed, no ID obtained.");
                }
            }
        }
    }

    // Other methods (if any)
}
