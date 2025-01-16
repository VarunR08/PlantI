<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tree Plantation</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #000;
            background-color: #fff; /* White background */
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: #00a400; /* Dark green */
        }

        .navbar .logo h1 {
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar nav ul {
            display: flex;
            list-style: none;
        }

        .navbar nav ul li {
            margin-left: 20px;
        }

        .navbar nav ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 1rem;
            transition: color 0.3s;
        }

        .navbar nav ul li a:hover {
            color: #ddd;
        }

        .navbar .icons span {
            margin-left: 20px;
            font-size: 1.2rem;
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: space-around;
            padding: 160px;
            background: white;
        }

        .hero-content h2 {
            font-size: 4rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #00a400; /* Green text */
            transition: all 0.3s ease-in-out;
        }

        .hero-content .btn {
            display: inline-block;
            text-decoration: none;
            color:#fff; /* White text */
            background:#00a400;/* Green background */
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .hero-content .btn:hover {
            background: #007500; /* Darker green */
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #00a400; /* Light gray background */
            color: #000; /* Black text */
        }
    </style>
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <h1>Safe Plantation</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#history">About Our History</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#plantation">Our Plantation</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
        <div class="icons">
            <span>🛒</span>
            <span>📞</span>
            <span>💬</span>
        </div>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h2 id="hero-text">Tree Plantation <br> Safe Environment</h2>
            <a href="#read-more" class="btn">Login</a>
        </div>
        <div class="hero-image">
            <img src="https://avatars.githubusercontent.com/u/2621100?v=4" alt="Tree Illustration">
        </div>
    </section>

    <footer>
        <p>Safe Plantation - Make the World Green</p>
    </footer>

    <script>
        // JavaScript to change the text on hover
        const heroText = document.getElementById("hero-text");

        heroText.addEventListener("mouseover", () => {
            heroText.innerHTML = "ಗಿಡ ಬೆಳೆಸಿ <br> ಪರಿಸರ ಉಳಿಸಿ"; 
        });

        heroText.addEventListener("mouseout", () => {
            heroText.innerHTML = "Tree Plantation <br> Safe Environment";
        });
    </script>
</body>
</html>
    