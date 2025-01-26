<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quality Lawn Care</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .hero {
            background: url('https://i.pinimg.com/736x/bf/c6/ba/bfc6ba9f683ff1628dc87f0d05d21faa.jpg') no-repeat center center/cover;
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .services, .about {
            padding: 50px 15px;
        }
        .service-item {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <header class="bg-dark py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1 class="text-white">PlantI</h1>
            <nav>
                <a href="Home.jsp" class="text-white text-decoration-none mx-2">Home</a>
                <a href="#" class="text-white text-decoration-none mx-2">Services</a>
                <a href="#" class="text-white text-decoration-none mx-2">Contact</a>
            </nav>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h2 class="display-4">Quality Lawn Care, Reliable Services</h2>
            <p>Providing the best lawn care solutions for your home and business.</p>

        </div>
    </section>

    <section class="services text-center bg-light">
        <div class="container">
            <h2 class="mb-4">We Propose the Best Services</h2>
            <div class="row">
                <div class="col-md-4 service-item">
                    <h5>Design & Planting</h5>
                    <p>Innovative design and quality planting services tailored to your space.</p>
                </div>
                <div class="col-md-4 service-item">
                    <h5>Smart Planning</h5>
                    <p>Optimized landscaping plans to enhance functionality and aesthetics.</p>
                </div>
                <div class="col-md-4 service-item">
                    <h5>Garden Care</h5>
                    <p>Professional maintenance to keep your garden healthy and beautiful.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2>Starting with the Right Idea</h2>
                    <p>Our team focuses on understanding your needs and delivering effective solutions that make your outdoor spaces stand out.</p>
                </div>
                <div class="col-md-6">
                    <img src="https://i.pinimg.com/236x/c8/c4/40/c8c440dc3c837abd05cacda4ecccbd63.jpg" alt="Garden Image" class="img-fluid rounded">
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark py-3 text-center text-white">
        <p>&copy; 2025 Project by PentagonSpace.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    