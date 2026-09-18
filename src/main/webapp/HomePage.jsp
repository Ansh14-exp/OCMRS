<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>OCMRS | Online College Management and Recruitment System</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    color: #ffffff;
    background: #07111f;
    overflow-x: hidden;
}


/* =========================
   BACKGROUND
========================= */

.background {
    position: fixed;
    inset: 0;
    z-index: -2;

    background:
        radial-gradient(circle at 15% 20%,
            rgba(0, 180, 255, 0.18),
            transparent 30%),

        radial-gradient(circle at 85% 70%,
            rgba(124, 58, 237, 0.20),
            transparent 30%),

        linear-gradient(
            135deg,
            #07111f,
            #0b1d33,
            #102a43,
            #07111f
        );

    background-size: 200% 200%;
    animation: backgroundMove 12s ease infinite;
}

@keyframes backgroundMove {

    0% {
        background-position: 0% 50%;
    }

    50% {
        background-position: 100% 50%;
    }

    100% {
        background-position: 0% 50%;
    }
}


/* =========================
   FLOATING CIRCLES
========================= */

.circle {
    position: fixed;
    border-radius: 50%;
    z-index: -1;

    background: rgba(255,255,255,0.04);

    border: 1px solid rgba(255,255,255,0.06);

    animation: floating 8s ease-in-out infinite;
}

.circle1 {
    width: 220px;
    height: 220px;
    top: 12%;
    left: -80px;
}

.circle2 {
    width: 320px;
    height: 320px;
    bottom: -140px;
    right: -100px;
    animation-delay: 2s;
}

.circle3 {
    width: 100px;
    height: 100px;
    top: 65%;
    left: 30%;
    animation-delay: 4s;
}

@keyframes floating {

    0% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-30px);
    }

    100% {
        transform: translateY(0);
    }
}


/* =========================
   NAVBAR
========================= */

.navbar {

    width: 100%;

    padding: 18px 7%;

    display: flex;

    justify-content: space-between;

    align-items: center;

    position: sticky;

    top: 0;

    z-index: 100;

    background: rgba(7,17,31,0.75);

    backdrop-filter: blur(14px);

    border-bottom: 1px solid rgba(255,255,255,0.08);
}


/* LOGO */

.logo {

    display: flex;

    align-items: center;

    gap: 12px;

    font-size: 25px;

    font-weight: bold;

    letter-spacing: 2px;
}

.logo-box {

    width: 43px;

    height: 43px;

    border-radius: 12px;

    display: flex;

    justify-content: center;

    align-items: center;

    background: linear-gradient(
        135deg,
        #00c6ff,
        #7c3aed
    );

    box-shadow:
        0 0 25px rgba(0,198,255,0.25);

}


/* NAV LINKS */

.nav-links {

    display: flex;

    align-items: center;

    gap: 30px;

    list-style: none;
}

.nav-links a {

    color: #dce9f5;

    text-decoration: none;

    font-size: 15px;

    transition: 0.3s;
}

.nav-links a:hover {

    color: #00c6ff;
}


/* NAV LOGIN */

.nav-login {

    padding: 10px 20px;

    border-radius: 8px;

    background: transparent;

    border: 1px solid #00c6ff;

    color: #ffffff !important;
}

.nav-login:hover {

    background: #00c6ff;

    color: #07111f !important;
}


/* =========================
   HERO SECTION
========================= */

.hero {

    min-height: 650px;

    padding: 80px 7% 70px;

    display: grid;

    grid-template-columns: 1.1fr 0.9fr;

    align-items: center;

    gap: 60px;
}


/* HERO TEXT */

.hero-content {

    animation: heroAppear 1s ease;
}

@keyframes heroAppear {

    from {

        opacity: 0;

        transform: translateY(35px);
    }

    to {

        opacity: 1;

        transform: translateY(0);
    }
}


.badge {

    display: inline-block;

    padding: 8px 15px;

    border-radius: 30px;

    background: rgba(0,198,255,0.10);

    border: 1px solid rgba(0,198,255,0.35);

    color: #6ddcff;

    font-size: 13px;

    margin-bottom: 20px;
}


.hero h1 {

    font-size: clamp(42px, 6vw, 72px);

    line-height: 1.05;

    letter-spacing: -2px;

    margin-bottom: 22px;
}


.gradient-text {

    background: linear-gradient(
        90deg,
        #00c6ff,
        #7c3aed
    );

    -webkit-background-clip: text;

    -webkit-text-fill-color: transparent;
}


.hero p {

    max-width: 620px;

    color: #b7c6d6;

    font-size: 17px;

    line-height: 1.8;

    margin-bottom: 32px;
}


/* BUTTONS */

.hero-buttons {

    display: flex;

    gap: 15px;

    flex-wrap: wrap;
}

.btn {

    display: inline-block;

    padding: 14px 27px;

    border-radius: 9px;

    text-decoration: none;

    font-weight: bold;

    transition: 0.3s;
}


.btn-primary {

    color: white;

    background: linear-gradient(
        135deg,
        #00aeea,
        #6366f1
    );

    box-shadow:
        0 10px 25px rgba(0,174,234,0.20);
}

.btn-primary:hover {

    transform: translateY(-3px);

    box-shadow:
        0 15px 30px rgba(0,174,234,0.30);
}


.btn-secondary {

    color: white;

    border: 1px solid rgba(255,255,255,0.20);

    background: rgba(255,255,255,0.05);
}

.btn-secondary:hover {

    background: rgba(255,255,255,0.10);

    transform: translateY(-3px);
}


/* =========================
   HERO VISUAL
========================= */

.hero-visual {

    display: flex;

    justify-content: center;

    align-items: center;
}


.dashboard-card {

    width: 390px;

    min-height: 360px;

    padding: 25px;

    border-radius: 22px;

    background: rgba(255,255,255,0.07);

    border: 1px solid rgba(255,255,255,0.13);

    backdrop-filter: blur(15px);

    box-shadow:
        0 30px 70px rgba(0,0,0,0.35);

    transform: perspective(1000px)
               rotateY(-8deg);

    animation: cardFloat 5s ease-in-out infinite;
}

@keyframes cardFloat {

    0% {
        transform:
            perspective(1000px)
            rotateY(-8deg)
            translateY(0);
    }

    50% {
        transform:
            perspective(1000px)
            rotateY(-8deg)
            translateY(-12px);
    }

    100% {
        transform:
            perspective(1000px)
            rotateY(-8deg)
            translateY(0);
    }
}


.card-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 25px;
}

.card-title {

    font-size: 18px;

    font-weight: bold;
}

.status {

    font-size: 11px;

    padding: 6px 10px;

    border-radius: 20px;

    background: rgba(34,197,94,0.15);

    color: #86efac;
}


.stats {

    display: grid;

    grid-template-columns: repeat(2,1fr);

    gap: 15px;
}


.stat-box {

    padding: 20px;

    border-radius: 14px;

    background: rgba(255,255,255,0.06);

    border: 1px solid rgba(255,255,255,0.07);
}


.stat-number {

    font-size: 27px;

    font-weight: bold;

    margin-bottom: 6px;
}

.stat-label {

    color: #9eb1c4;

    font-size: 12px;
}


/* GRAPH */

.graph {

    height: 80px;

    margin-top: 22px;

    display: flex;

    align-items: end;

    gap: 9px;
}

.bar {

    flex: 1;

    border-radius: 5px 5px 0 0;

    background: linear-gradient(
        to top,
        #00aeea,
        #7c3aed
    );
}

.bar:nth-child(1) {
    height: 35%;
}

.bar:nth-child(2) {
    height: 55%;
}

.bar:nth-child(3) {
    height: 45%;
}

.bar:nth-child(4) {
    height: 75%;
}

.bar:nth-child(5) {
    height: 62%;
}

.bar:nth-child(6) {
    height: 90%;
}

.bar:nth-child(7) {
    height: 70%;
}


/* =========================
   FEATURES
========================= */

.section {

    padding: 80px 7%;

    text-align: center;
}

.section-title {

    font-size: 38px;

    margin-bottom: 15px;
}

.section-subtitle {

    color: #9eb1c4;

    max-width: 650px;

    margin: 0 auto 45px;

    line-height: 1.7;
}


.features {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;
}


.feature-card {

    padding: 30px 22px;

    text-align: left;

    border-radius: 16px;

    background: rgba(255,255,255,0.05);

    border: 1px solid rgba(255,255,255,0.08);

    transition: 0.3s;
}

.feature-card:hover {

    transform: translateY(-8px);

    background: rgba(255,255,255,0.08);

    border-color: rgba(0,198,255,0.3);
}


.feature-icon {

    width: 50px;

    height: 50px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 12px;

    margin-bottom: 18px;

    font-size: 22px;

    background:
        linear-gradient(
            135deg,
            rgba(0,198,255,0.18),
            rgba(124,58,237,0.18)
        );
}

.feature-card h3 {

    margin-bottom: 10px;

    font-size: 18px;
}

.feature-card p {

    color: #9eb1c4;

    font-size: 14px;

    line-height: 1.6;
}


/* =========================
   STATISTICS
========================= */

.statistics {

    margin: 20px 7% 80px;

    padding: 35px;

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;

    border-radius: 20px;

    background: rgba(255,255,255,0.05);

    border: 1px solid rgba(255,255,255,0.08);
}


.stat {

    text-align: center;
}

.stat h2 {

    font-size: 34px;

    background: linear-gradient(
        90deg,
        #00c6ff,
        #8b5cf6
    );

    -webkit-background-clip: text;

    -webkit-text-fill-color: transparent;
}

.stat p {

    color: #9eb1c4;

    margin-top: 5px;

    font-size: 13px;
}


/* =========================
   CTA
========================= */

.cta {

    margin: 0 7% 80px;

    padding: 60px 30px;

    text-align: center;

    border-radius: 24px;

    background:
        linear-gradient(
            135deg,
            rgba(0,198,255,0.12),
            rgba(124,58,237,0.14)
        );

    border: 1px solid rgba(255,255,255,0.10);
}

.cta h2 {

    font-size: 34px;

    margin-bottom: 15px;
}

.cta p {

    color: #a9b9ca;

    margin-bottom: 25px;
}


/* =========================
   FOOTER
========================= */

footer {

    padding: 25px 7%;

    border-top: 1px solid rgba(255,255,255,0.08);

    text-align: center;

    color: #8093a7;

    font-size: 13px;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 950px) {

    .hero {

        grid-template-columns: 1fr;

        text-align: center;
    }

    .hero p {

        margin-left: auto;

        margin-right: auto;
    }

    .hero-buttons {

        justify-content: center;
    }

    .hero-visual {

        margin-top: 20px;
    }

    .features {

        grid-template-columns:
            repeat(2, 1fr);
    }

    .statistics {

        grid-template-columns:
            repeat(2, 1fr);
    }

}


@media (max-width: 650px) {

    .navbar {

        padding: 15px 5%;
    }

    .nav-links {

        gap: 10px;
    }

    .nav-links li:not(:last-child) {

        display: none;
    }

    .hero {

        padding: 60px 5%;
    }

    .dashboard-card {

        width: 100%;

        max-width: 390px;
    }

    .features {

        grid-template-columns: 1fr;
    }

    .statistics {

        grid-template-columns: 1fr 1fr;

        margin-left: 5%;

        margin-right: 5%;
    }

    .section {

        padding-left: 5%;

        padding-right: 5%;
    }

    .cta {

        margin-left: 5%;

        margin-right: 5%;
    }

}

</style>

</head>


<body>


<!-- BACKGROUND -->

<div class="background"></div>

<div class="circle circle1"></div>
<div class="circle circle2"></div>
<div class="circle circle3"></div>


<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar">

    <div class="logo">

        <div class="logo-box">
            O
        </div>

        OCMRS

    </div>


    <ul class="nav-links">

        <li>
            <a href="#home">Home</a>
        </li>

        <li>
            <a href="#features">Features</a>
        </li>

        <li>
            <a href="#about">About</a>
        </li>

        <li>
            <a href="login.jsp" class="nav-login">
                Login
            </a>
        </li>

    </ul>

</nav>



<!-- =========================
     HERO
========================= -->

<section class="hero" id="home">


    <div class="hero-content">

        <span class="badge">
            ✦ Smart • Secure • Connected
        </span>


        <h1>

            One Platform.

            <br>

            <span class="gradient-text">
                Endless Opportunities.
            </span>

        </h1>


        <p>

            Welcome to OCMRS — an integrated Online College
            Management and Recruitment System designed to connect
            students, faculty, colleges and recruiters in one
            powerful digital platform.

        </p>


        <div class="hero-buttons">

            <a href="login.jsp"
               class="btn btn-primary">

                Get Started →

            </a>


            <a href="#features"
               class="btn btn-secondary">

                Explore Features

            </a>

        </div>

    </div>



    <!-- DASHBOARD PREVIEW -->

    <div class="hero-visual">

        <div class="dashboard-card">


            <div class="card-header">

                <div class="card-title">
                    OCMRS Dashboard
                </div>

                <div class="status">
                    ● System Active
                </div>

            </div>


            <div class="stats">


                <div class="stat-box">

                    <div class="stat-number">
                        1,250+
                    </div>

                    <div class="stat-label">
                        Students
                    </div>

                </div>


                <div class="stat-box">

                    <div class="stat-number">
                        85+
                    </div>

                    <div class="stat-label">
                        Companies
                    </div>

                </div>


                <div class="stat-box">

                    <div class="stat-number">
                        120+
                    </div>

                    <div class="stat-label">
                        Job Opportunities
                    </div>

                </div>


                <div class="stat-box">

                    <div class="stat-number">
                        92%
                    </div>

                    <div class="stat-label">
                        Placement Rate
                    </div>

                </div>


            </div>


            <div class="graph">

                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>

            </div>


        </div>

    </div>

</section>



<!-- =========================
     FEATURES
========================= -->

<section class="section"
         id="features">


    <h2 class="section-title">
        Everything in One Place
    </h2>


    <p class="section-subtitle">

        OCMRS brings the complete college management
        and recruitment process together through a
        single, easy-to-use platform.

    </p>


    <div class="features">


        <div class="feature-card">

            <div class="feature-icon">
                🎓
            </div>

            <h3>
                Student Management
            </h3>

            <p>
                Manage student profiles, enrollment,
                subjects, examinations and academic results.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                👨‍🏫
            </div>

            <h3>
                Faculty Management
            </h3>

            <p>
                Organize faculty information, subjects,
                examinations and student academic records.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                💼
            </div>

            <h3>
                Recruitment
            </h3>

            <p>
                Connect students with companies and
                manage job opportunities and applications.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                📊
            </div>

            <h3>
                Placement Tracking
            </h3>

            <p>
                Manage interviews, selections and
                placement information efficiently.
            </p>

        </div>


    </div>

</section>



<!-- =========================
     STATISTICS
========================= -->

<div class="statistics">


    <div class="stat">

        <h2>15+</h2>

        <p>
            Integrated Modules
        </p>

    </div>


    <div class="stat">

        <h2>4</h2>

        <p>
            User Roles
        </p>

    </div>


    <div class="stat">

        <h2>100%</h2>

        <p>
            Centralized Data
        </p>

    </div>


    <div class="stat">

        <h2>24/7</h2>

        <p>
            Digital Access
        </p>

    </div>


</div>



<!-- =========================
     ABOUT
========================= -->

<section class="section"
         id="about">


    <h2 class="section-title">
        About OCMRS
    </h2>


    <p class="section-subtitle">

        OCMRS is designed to simplify college administration
        while creating a bridge between students and recruiters.
        From academic management to recruitment and placement,
        everything can be managed through one centralized system.

    </p>

</section>



<!-- =========================
     CALL TO ACTION
========================= -->

<section class="cta">


    <h2>
        Ready to get started?
    </h2>


    <p>

        Access your OCMRS account and explore
        your personalized dashboard.

    </p>


    <a href="login.jsp"
       class="btn btn-primary">

        Login to OCMRS →

    </a>

</section>



<!-- =========================
     FOOTER
========================= -->

<footer>

    © 2026 OCMRS —
    Online College Management and Recruitment System

</footer>


</body>

</html>
