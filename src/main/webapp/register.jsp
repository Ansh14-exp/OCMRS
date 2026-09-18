<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>OCMRS - Register</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* =========================
   BODY
========================= */

body {

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    font-family: Arial, Helvetica, sans-serif;

    overflow-x: hidden;

    background:
        radial-gradient(
            circle at 15% 20%,
            rgba(0,198,255,0.18),
            transparent 30%
        ),

        radial-gradient(
            circle at 85% 75%,
            rgba(124,58,237,0.20),
            transparent 30%
        ),

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

    background: rgba(255,255,255,0.04);

    border: 1px solid rgba(255,255,255,0.06);

    animation: float 8s ease-in-out infinite;

    pointer-events: none;
}


.circle1 {

    width: 220px;

    height: 220px;

    top: 5%;

    left: -80px;
}


.circle2 {

    width: 300px;

    height: 300px;

    right: -100px;

    bottom: -120px;

    animation-delay: 2s;
}


@keyframes float {

    0% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-25px);
    }

    100% {
        transform: translateY(0);
    }
}


/* =========================
   REGISTER CARD
========================= */

.register-container {

    position: relative;

    z-index: 10;

    width: 420px;

    padding: 35px;

    margin: 25px;

    border-radius: 20px;

    background: rgba(255,255,255,0.94);

    box-shadow:
        0 25px 70px rgba(0,0,0,0.40);

    animation: appear 0.8s ease;
}


@keyframes appear {

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
   LOGO
========================= */

.logo {

    width: 58px;

    height: 58px;

    margin: 0 auto 12px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 15px;

    color: white;

    font-size: 25px;

    font-weight: bold;

    background:
        linear-gradient(
            135deg,
            #00aeea,
            #6366f1
        );

    box-shadow:
        0 8px 25px rgba(0,174,234,0.25);
}


/* =========================
   HEADING
========================= */

h1 {

    text-align: center;

    color: #102a43;

    font-size: 30px;

    letter-spacing: 2px;

    margin-bottom: 8px;
}


.subtitle {

    text-align: center;

    color: #777;

    font-size: 13px;

    line-height: 1.5;

    margin-bottom: 25px;
}


/* =========================
   FORM
========================= */

.form-group {

    margin-bottom: 17px;
}


label {

    display: block;

    margin-bottom: 7px;

    color: #263746;

    font-size: 14px;

    font-weight: bold;
}


input,
select {

    width: 100%;

    padding: 12px 13px;

    border: 1px solid #d2d7dc;

    border-radius: 8px;

    background: #ffffff;

    color: #263746;

    font-size: 14px;

    outline: none;

    transition: 0.3s;
}


input:focus,
select:focus {

    border-color: #00aeea;

    box-shadow:
        0 0 0 3px rgba(0,174,234,0.10);
}


select {

    cursor: pointer;
}


/* =========================
   REGISTER BUTTON
========================= */

button {

    width: 100%;

    padding: 13px;

    margin-top: 5px;

    border: none;

    border-radius: 8px;

    background:
        linear-gradient(
            135deg,
            #00aeea,
            #6366f1
        );

    color: white;

    font-size: 15px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}


button:hover {

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(0,174,234,0.25);
}


button:active {

    transform: scale(0.98);
}


/* =========================
   LOGIN LINK
========================= */

.login-link {

    text-align: center;

    margin-top: 22px;

    font-size: 13px;

    color: #777;
}


.login-link a {

    color: #006fa6;

    text-decoration: none;

    font-weight: bold;
}


.login-link a:hover {

    text-decoration: underline;
}


/* =========================
   ERROR / SUCCESS
========================= */

.message {

    margin-bottom: 15px;

    padding: 10px;

    border-radius: 7px;

    text-align: center;

    font-size: 13px;
}


.error {

    color: #b00020;

    background: #fff0f2;

    border: 1px solid #ffd0d7;
}


.success {

    color: #087443;

    background: #edfff6;

    border: 1px solid #b9efd2;
}


/* =========================
   FOOTER
========================= */

.footer {

    text-align: center;

    margin-top: 20px;

    color: #999;

    font-size: 11px;
}


/* =========================
   MOBILE
========================= */

@media (max-width: 500px) {

    .register-container {

        width: calc(100% - 30px);

        padding: 28px 22px;
    }

}

</style>

</head>


<body>


<!-- Background -->

<div class="circle circle1"></div>

<div class="circle circle2"></div>


<!-- Register Card -->

<div class="register-container">


    <!-- Logo -->

    <div class="logo">
        O
    </div>


    <!-- Heading -->

    <h1>
        OCMRS
    </h1>


    <div class="subtitle">

        Create your account for<br>

        Online College Management and Recruitment System

    </div>


    <!-- Messages -->

    <%

        String error = request.getParameter("error");

        String success = request.getParameter("success");


        if ("UsernameExists".equals(error)) {

    %>

        <div class="message error">
            Username already exists!
        </div>

    <%

        } else if ("RegistrationFailed".equals(error)) {

    %>

        <div class="message error">
            Registration failed. Please try again.
        </div>

    <%

        } else if ("PasswordMismatch".equals(error)) {

    %>

        <div class="message error">
            Passwords do not match!
        </div>

    <%

        } else if ("Registered".equals(success)) {

    %>

        <div class="message success">
            Registration successful! Please login.
        </div>

    <%

        }

    %>


    <!-- Registration Form -->

    <form action="RegisterServlet"
          method="post">


        <!-- Username -->

        <div class="form-group">

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

        </div>


        <!-- Password -->

        <div class="form-group">

            <label for="password">
                Password
            </label>

            <input
                type="password"
                id="password"
                name="password"
                placeholder="Create a password"
                required
            >

        </div>


        <!-- Confirm Password -->

        <div class="form-group">

            <label for="confirmPassword">
                Confirm Password
            </label>

            <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                placeholder="Confirm your password"
                required
            >

        </div>


        <!-- Role -->

        <div class="form-group">

            <label for="role">
                Account Type
            </label>

            <select id="role"
                    name="role"
                    required>

                <option value="">
                    Select your role
                </option>

                <option value="STUDENT">
                    Student
                </option>

                <option value="FACULTY">
                    Faculty
                </option>

                <option value="COMPANY">
                    Company
                </option>

            </select>

        </div>


        <!-- Button -->

        <button type="submit">
            Create Account
        </button>


    </form>


    <!-- Login -->

    <div class="login-link">

        Already have an account?

        <a href="login.jsp">
            Login here
        </a>

    </div>


    <!-- Footer -->

    <div class="footer">

        OCMRS © 2026 | College Management System

    </div>


</div>


</body>

</html>