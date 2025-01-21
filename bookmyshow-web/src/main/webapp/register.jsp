<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - CineBook</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a237e, #283593, #3949ab);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            color: #fff;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .logo span {
            color: #64b5f6;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }

        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .main-content {
            padding-top: 100px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-container {
            max-width: 400px;
            width: 90%;
            padding: 40px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        h2 {
            margin-bottom: 30px;
            font-size: 32px;
            font-weight: bold;
            color: #fff;
            text-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            text-align: left;
        }

        label {
            font-weight: 500;
            font-size: 14px;
            color: #fff;
        }

        input {
            padding: 14px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            outline: none;
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        input:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #64b5f6;
        }

        button {
            background: linear-gradient(90deg, #64b5f6, #2196f3);
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 14px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(90deg, #2196f3, #1976d2);
        }

        button:active {
            transform: translateY(1px);
        }

        p {
            margin-top: 20px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.8);
        }

        a {
            color: #64b5f6;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #2196f3;
        }

        @media (max-width: 768px) {
            .header {
                padding: 1rem;
            }

            .logo {
                font-size: 20px;
            }

            .nav-links {
                gap: 10px;
            }

            .nav-links a {
                padding: 6px 12px;
                font-size: 14px;
            }

            .register-container {
                padding: 30px;
            }

            h2 {
                font-size: 24px;
            }

            input {
                font-size: 16px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav-container">
            <a href="/" class="logo">Cine<span>Book</span></a>
            <div class="nav-links">
                <a href="/">Home</a>
                <a href="/movies">Movies</a>
            </div>
        </nav>
    </header>

    <div class="main-content">
        <div class="register-container">
            <h2>Create Account</h2>
            <form action="register" method="post">
                <div class="input-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter your full name">
                </div>
                
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="Enter your username">
                </div>
                
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email">
                </div>
                
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>
                
                <button type="submit">Sign Up</button>
                
                <p>Already have an account? <a href="login.jsp">Sign in here</a></p>
            </form>
        </div>
    </div>
</body>
</html>