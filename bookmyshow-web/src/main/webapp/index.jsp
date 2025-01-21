<!-- index.jsp -->
<!--  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookMyShow</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>BookMyShow</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="movies">Movies</a></li>
                <li><a href="shows">Shows</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="movie-list">
            <h2>Now Showing</h2>
            <div class="movies">
                <c:forEach items="${movies}" var="movie">
                    <div class="movie-card">
                        <h3>${movie.title}</h3>
                        <p>Genre: ${movie.genre}</p>
                        <p>Duration: ${movie.duration} mins</p>
                        <p>Language: ${movie.language}</p>
                        <a href="shows?movieId=${movie.movieId}" class="btn">Book Now</a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
    
    <script src="js/script.js"></script>
</body>
</html> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookMyShow</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Navbar */
        .navbar {
            background: #1f2533;
            padding: 15px 50px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #f84464;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        /* Hero Section */
        /*.hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                        url('/api/placeholder/1200/400');
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }*/
      .hero {
    position: relative;
    height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    overflow: hidden;
    color: white;
}

.hero img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2; /* Push the image further back */
    filter: blur(5px); /* Apply blur effect to the image */
}

.hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7); /* Add a blackish overlay */
    z-index: -1; /* Place the overlay above the image but behind the text */
}

.hero-content {
    z-index: 1; /* Bring text content above everything else */
}

.hero h1 {
    font-size: 48px;
    margin-bottom: 20px;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7); /* Add shadow for better visibility */
}

.hero p {
    font-size: 18px;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
}
      
        

        /* Movie Grid */
        .movie-container {
            padding: 50px;
            background: #f5f5f5;
        }

        .section-title {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }

        .movie-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .movie-card:hover {
            transform: translateY(-5px);
        }

        .movie-image {
            width: 100%;
            height: 300px;
            background: #ddd;
            position: relative;
        }
        .movie-image img {
    width: 100%; /* Ensures the image fills the container's width */
    height: 300px; /* Set a fixed height for the image */
    object-fit: cover; /* Ensures the image is cropped proportionally */
    border-radius: 8px 8px 0 0; /* Optional: match the border-radius of the card */
}
        

        .movie-details {
            padding: 20px;
        }

        .movie-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .movie-info {
            color: #666;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .book-btn {
            background: #f84464;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .book-btn:hover {
            background: #e03454;
        }

        /* Footer */
        .footer {
            background: #333545;
            color: white;
            padding: 50px;
            text-align: center;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }

        .footer-section h3 {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .footer-section p {
            color: #aaa;
            line-height: 1.6;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                padding: 15px 20px;
            }

            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }

            .movie-container {
                padding: 20px;
            }
        }

        @media (max-width: 480px) {
            .footer-content {
                grid-template-columns: 1fr;
            }

            .hero h1 {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">CineBook</div>
        <div class="nav-links">
            <a href="movies.jsp">Movies</a>
            <a href="#theaters">Theaters</a>
            <a href="#events">Events</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-content">
        <img src="https://hcdevilsadvocate.com/wp-content/uploads/2019/01/netflix-background-9.jpg">
            <h1>Book Your Entertainment</h1>
            <p>Watch the latest movies in theaters near you</p>
        </div>
    </div>

    <!-- Movies Section -->
    <div class="movie-container">
        <h2 class="section-title">Now Showing</h2>
        <div class="movie-grid">
            <!-- Movie 1 -->
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p8033989_p_v8_aq.jpg" alt="Movie 1">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Tangled</h3>
                    <p class="movie-info">
                        Action/Drama • 2h 32m<br>
                        Rating: 9.0/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>

            <!-- Movie 2 -->
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg" alt="Movie 2">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Inception</h3>
                    <p class="movie-info">
                        Sci-Fi/Action • 2h 28m<br>
                        Rating: 8.8/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>

            <!-- Movie 3 -->
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Interstellar</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 2h 49m<br>
                        Rating: 8.6/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0MiAFRF0oxZO8nwPESVBei050PmIs6_46y9pPRkfWS59pFJpi" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Spider-Man: Across the Spider-Verse</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 2h 49m<br>
                        Rating: 7.8/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://m.media-amazon.com/images/M/MV5BNjcxMjg1Njg2NF5BMl5BanBnXkFtZTcwMjQ4NzMzMw@@._V1_.jpg" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">charlie and chocolate factory</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 3h 10m<br>
                        Rating: 8.1/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://m.media-amazon.com/images/M/MV5BMjMyMzQ1ODM1MF5BMl5BanBnXkFtZTcwMjE2MTQxOQ@@._V1_.jpg" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Oz</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 2h 50m<br>
                        Rating: 6.7/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div> 
            
             <div class="movie-card">
                <div class="movie-image">
                    <img src="https://resizing.flixster.com/wMrzJcWEC7xs1H24uMSOFIBe4-s=/fit-in/180x240/v2/https://resizing.flixster.com/P3ITKQPm33gw4K73O9DYCOfyZ4E=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzQ1Zjg4NDFhLWMxY2EtNDU3NC04OTNmLTQ4MTJiMzc3Y2EwZC5qcGc=" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Damsel</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 3h 22m<br>
                        Rating: 6.5/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div> 
            
            
            
            
            
            
            
            
            
            
             <div class="movie-card">
                <div class="movie-image">
                    <img src="https://m.media-amazon.com/images/M/MV5BZTk5ODY0MmQtMzA3Ni00NGY1LThiYzItZThiNjFiNDM4MTM3XkEyXkFqcGc@._V1_.jpg" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Deadpool & Wolverine</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 3h 50m<br>
                        Rating: 8.5/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
            
            
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjE_lrA3YMjdGhkuTZ0iP_8z_vATAFh2rBU7xPOilIoQI_buV1Q3gwwi15gq39Z8nvUjG88DIkKfUt48NqzSAbNJqLO4y7-VTi5QQ7AN4H9glPmoqt5zObHmx4F5kHTnNujrH5IdgGMP-r5z-boYpp6wFTX_ziP2atlYSrW5uiWt_Tl1tx_v1W2b8L6fHY/w1200-h630-p-k-no-nu/black-panther-nmovies.jpeg" alt="Movie 3">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Wakanda Forever</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 2h 23m<br>
                        Rating: 6.8/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>


            <!-- Movie 4 -->
            <div class="movie-card">
                <div class="movie-image">
                    <img src="https://irs.www.warnerbros.com/keyart-jpeg/movies/media/browser/ReadyPlayerOne_Onesheet.jpeg" alt="Movie 4">
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">Ready Player One</h3>
                    <p class="movie-info">
                        Sci-Fi/Adventure • 2h 42m<br>
                        Rating: 5.8/10
                    </p>
                    <button class="book-btn">Book Now</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>BookMyShow is India's largest entertainment ticketing platform.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <p>Movies<br>Theaters<br>Events<br>Gift Cards</p>
            </div>
            <div class="footer-section">
                <h3>Help & Support</h3>
                <p>Contact Us<br>FAQ<br>Terms & Conditions<br>Privacy Policy</p>
            </div>
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <p>Facebook<br>Twitter<br>Instagram<br>YouTube</p>
            </div>
        </div>
    </footer>

    <script>
        // Add smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Add click handlers for book buttons
        document.querySelectorAll('.book-btn').forEach(button => {
            button.addEventListener('click', function() {
                const movieTitle = this.parentElement.querySelector('.movie-title').textContent;
                alert(`Booking system opening for ${movieTitle}`);
                // In a real implementation, this would open the booking modal or redirect to booking page
            });
        });
    </script>
</body>
</html>