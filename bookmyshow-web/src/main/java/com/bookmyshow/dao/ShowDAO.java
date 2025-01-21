package com.bookmyshow.dao;

import com.bookmyshow.model.Show;
import com.bookmyshow.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO {

    public Show getShowById(int showId) throws SQLException {
        String sql = "SELECT s.show_id, s.movie_id, m.title as movie_name, s.show_time, s.price, s.available_seats " +
                     "FROM shows s JOIN movies m ON s.movie_id = m.movie_id WHERE s.show_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, showId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Show show = new Show();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setMovieName(rs.getString("movie_name"));
                show.setShowTime(rs.getTimestamp("show_time"));
                show.setPrice(rs.getBigDecimal("price"));
                show.setAvailableSeats(rs.getInt("available_seats"));
                return show;
            }
        }
        return null;
    }

    public List<Show> getShowsByMovieId(int movieId) throws SQLException {
        String sql = "SELECT s.show_id, s.movie_id, m.title as movie_name, s.show_time, s.price, s.available_seats " +
                     "FROM shows s JOIN movies m ON s.movie_id = m.movie_id WHERE s.movie_id = ?";
        List<Show> shows = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, movieId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Show show = new Show();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setMovieName(rs.getString("movie_name"));
                show.setShowTime(rs.getTimestamp("show_time"));
                show.setPrice(rs.getBigDecimal("price"));
                show.setAvailableSeats(rs.getInt("available_seats"));
                shows.add(show);
            }
        }
        return shows;
    }

    // Other methods (if any)
}
