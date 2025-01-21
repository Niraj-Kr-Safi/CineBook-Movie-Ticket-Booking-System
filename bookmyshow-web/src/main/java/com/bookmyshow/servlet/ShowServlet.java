package com.bookmyshow.servlet;

import com.bookmyshow.dao.ShowDAO;
import com.bookmyshow.dao.MovieDAO;
import com.bookmyshow.model.Movie;
import com.bookmyshow.model.Show;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/shows")
public class ShowServlet extends HttpServlet {
    private ShowDAO showDAO;
    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        showDAO = new ShowDAO();
        movieDAO = new MovieDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieIdStr = request.getParameter("movieId");

        // Validate input fields
        if (movieIdStr == null || movieIdStr.isEmpty()) {
            request.setAttribute("message", "Movie ID is required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("movies.jsp");
            dispatcher.forward(request, response);
            return;
        }

        int movieId = Integer.parseInt(movieIdStr);

        try {
            List<Show> shows = showDAO.getShowsByMovieId(movieId);
            Movie movie = movieDAO.getMovieById(movieId);
            request.setAttribute("shows", shows);
            request.setAttribute("movie", movie); // Set the movie object
            RequestDispatcher dispatcher = request.getRequestDispatcher("shows.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
