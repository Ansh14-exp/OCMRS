<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>OCMRS - Login</title>

<style>

/* =========================
   BASIC RESET
   ========================= */

* {
    box-sizing: border-box;
}

html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    min-height: 100%;
}


/* =========================
   ANIMATED BODY BACKGROUND
   ========================= */

body {

    font-family: Arial, sans-serif;

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    overflow: hidden;

    /* Animated Gradient */

    background: linear-gradient(
        -45deg,
        #0f2027,
        #203a43,
        #2c5364,
        #1a2980,
        #0f2027
    );

    background-size: 400% 400%;

    animation: backgroundMove 12s ease infinite;
}


/* Background movement */

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
   FLOATING BACKGROUND CIRCLES
   ========================= */

.circle {

    position: absolute;

    border-radius: 50%;

    background: rgba(255, 255, 255, 0.08);

    pointer-events: none;

    animation: float 8s ease-in-out infinite;
}


.circle1 {

    width: 180px;
    height: 180px;

    top: 5%;
    left: 5%;
}


.circle2 {

    width: 250px;
    height: 250px;

    bottom: -80px;
    right: 3%;

    animation-delay: 2s;
}


.circle3 {

    width: 100px;
    height: 100px;

    top: 65%;
    left: 18%;

    animation-delay: 4s;
}


.circle4 {

    width: 140px;
    height: 140px;

    top: 12%;
    right: 12%;

    animation-delay: 1s;
}


@keyframes float {

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
   LOGIN CONTAINER
   ========================= */

.login-container {

    position: relative;

    z-index: 10;

    width: 380px;

    padding: 35px;

    /*
       Previous white login box preserved,
       but slightly transparent for animation effect
    */

    background: rgba(255, 255, 255, 0.92);

    border-radius: 12px;

    box-shadow:
        0 15px 40px rgba(0, 0, 0, 0.30);

    backdrop-filter: blur(10px);

    animation: loginAppear 0.8s ease;
}


@keyframes loginAppear {

    from {

        opacity: 0;

        transform: translateY(35px);

    }

    to {

        opacity: 1;

        transform: translateY(0);

    }
}


/* =========================
   OCMRS TITLE
   ========================= */

h1 {

    text-align: center;

    color: #203a43;

    margin: 0 0 10px 0;

    font-size: 32px;

    letter-spacing: 2px;
}


.subtitle {

    text-align: center;

    color: #777;

    margin-bottom: 30px;

    line-height: 1.5;

    font-size: 14px;
}


/* =========================
   LABELS
   ========================= */

label {

    display: block;

    margin-top: 15px;

    margin-bottom: 6px;

    font-weight: bold;

    color: #333;
}


/* =========================
   INPUT FIELDS
   ========================= */

input {

    width: 100%;

    padding: 12px;

    border: 1px solid #ccc;

    border-radius: 6px;

    font-size: 15px;

    outline: none;

    transition: 0.3s;
}


input:focus {

    border-color: #2c5364;

    box-shadow:
        0 0 8px rgba(44, 83, 100, 0.25);
}


/* =========================
   LOGIN BUTTON
   ========================= */

button {

    width: 100%;

    margin-top: 25px;

    padding: 12px;

    border: none;

    border-radius: 6px;

    background: #2c5364;

    color: white;

    font-size: 16px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}


button:hover {

    background: #1a2980;

    transform: translateY(-2px);

    box-shadow:
        0 6px 15px rgba(0, 0, 0, 0.25);
}


button:active {

    transform: scale(0.98);
}


/* =========================
   ERROR MESSAGE
   ========================= */

.error {

    color: #d00000;

    text-align: center;

    margin-top: 15px;

    padding: 8px;

    background: rgba(255, 0, 0, 0.08);

    border-radius: 5px;

    font-size: 14px;
}


/* =========================
   FOOTER
   ========================= */

.footer {

    text-align: center;

    margin-top: 22px;

    color: #777;

    font-size: 12px;
}


/* =========================
   MOBILE
   ========================= */

@media (max-width: 500px) {

    .login-container {

        width: 90%;

        padding: 30px 25px;
    }

}

</style>

</head>


<body>


<!-- =========================
     ANIMATED BACKGROUND
     ========================= -->

<div class="circle circle1"></div>

<div class="circle circle2"></div>

<div class="circle circle3"></div>

<div class="circle circle4"></div>


<!-- =========================
     LOGIN BOX
     ========================= -->

<div class="login-container">


    <h1>OCMRS</h1>


    <div class="subtitle">

        Online College Management and<br>
        Recruitment System

    </div>


    <!-- LOGIN FORM -->

    <form action="LoginServlet" method="post">


        <!-- USERNAME -->

        <label for="username">

            Username

        </label>


        <input
            type="text"
            id="username"
            name="username"
            placeholder="Enter your username"
            required
        >


        <!-- PASSWORD -->

        <label for="password">

            Password

        </label>


        <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
            required
        >


        <!-- LOGIN BUTTON -->

        <button type="submit">

            Login

        </button>


    </form>


    <!-- ERROR MESSAGE -->

    <%

        String error = request.getParameter("error");


        if ("InvalidLogin".equals(error)) {

    %>

        <div class="error">

            Invalid username or password!

        </div>

    <%

        }

        else if ("InvalidRole".equals(error)) {

    %>

        <div class="error">

            Invalid user role!

        </div>

    <%

        }

    %>


    <!-- FOOTER -->

    <div class="footer">

        OCMRS © 2026 | College Management System

    </div>


</div>


</body>

</html>