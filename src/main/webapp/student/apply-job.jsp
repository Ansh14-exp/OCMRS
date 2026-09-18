<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply for Job - OCMRS</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #f4f7fc;
    color: #222;
}

/* Sidebar */
.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 240px;
    height: 100vh;
    background: linear-gradient(180deg, #111827, #1e1b4b);
    padding: 25px 15px;
    color: white;
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo h2 {
    color: #60a5fa;
    font-size: 27px;
}

.logo p {
    font-size: 12px;
    color: #cbd5e1;
    margin-top: 5px;
}

.sidebar a {
    display: block;
    color: #dbeafe;
    text-decoration: none;
    padding: 13px 15px;
    margin: 6px 0;
    border-radius: 10px;
    transition: 0.3s;
}

.sidebar a:hover,
.sidebar a.active {
    background: linear-gradient(90deg, #2563eb, #7c3aed);
    color: white;
}

/* Main */
.main {
    margin-left: 240px;
    padding: 30px;
}

/* Header */
.header {
    background: linear-gradient(135deg, #2563eb, #7c3aed);
    color: white;
    padding: 25px;
    border-radius: 18px;
    margin-bottom: 25px;
}

.header h1 {
    font-size: 28px;
}

.header p {
    margin-top: 8px;
    color: #e0e7ff;
}

/* Form Container */
.form-container {
    max-width: 900px;
    background: white;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.form-title {
    font-size: 22px;
    color: #1e293b;
    margin-bottom: 25px;
    border-left: 5px solid #2563eb;
    padding-left: 12px;
}

.job-box {
    background: #eff6ff;
    border: 1px solid #bfdbfe;
    padding: 18px;
    border-radius: 12px;
    margin-bottom: 25px;
}

.job-box h3 {
    color: #1d4ed8;
    margin-bottom: 8px;
}

.job-box p {
    color: #475569;
    margin: 5px 0;
}

/* Form */
.form-row {
    display: flex;
    gap: 20px;
}

.form-group {
    flex: 1;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #334155;
}

input,
select,
textarea {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #cbd5e1;
    border-radius: 9px;
    font-size: 14px;
    outline: none;
}

input:focus,
select:focus,
textarea:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.1);
}

textarea {
    height: 130px;
    resize: vertical;
}

input[type="file"] {
    background: #f8fafc;
}

/* Buttons */
.buttons {
    display: flex;
    gap: 15px;
    margin-top: 10px;
}

.btn {
    padding: 13px 28px;
    border: none;
    border-radius: 9px;
    font-size: 15px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
}

.apply-btn {
    background: linear-gradient(90deg, #2563eb, #7c3aed);
    color: white;
}

.apply-btn:hover {
    opacity: 0.9;
}

.cancel-btn {
    background: #e2e8f0;
    color: #334155;
}

.cancel-btn:hover {
    background: #cbd5e1;
}

/* Responsive */
@media (max-width: 800px) {

    .sidebar {
        width: 200px;
    }

    .main {
        margin-left: 200px;
    }

    .form-row {
        flex-direction: column;
        gap: 0;
    }
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">

    <div class="logo">
        <h2>OCMRS</h2>
        <p>Student Portal</p>
    </div>

    <a href="dashboard.jsp">🏠 Dashboard</a>
    <a href="profile.jsp">👤 Profile</a>
    <a href="enrollment.jsp">📚 Enrollment</a>
    <a href="subjects.jsp">📖 Subjects</a>
    <a href="exams.jsp">📝 Exams</a>
    <a href="results.jsp">📊 Results</a>
    <a href="jobs.jsp">💼 Jobs</a>
    <a href="apply-job.jsp" class="active">📨 Apply Job</a>
    <a href="application.jsp">📄 Applications</a>
    <a href="placement.jsp">🎓 Placement</a>

</div>


<!-- Main Content -->
<div class="main">

    <div class="header">
        <h1>Apply for Job</h1>
        <p>Submit your application for available placement opportunities.</p>
    </div>


    <div class="form-container">

        <h2 class="form-title">Job Application Form</h2>


        <!-- Selected Job -->
        <div class="job-box">

            <h3>Java Developer</h3>

            <p><strong>Company:</strong> Tech Solutions Pvt. Ltd.</p>
            <p><strong>Location:</strong> Kolkata</p>
            <p><strong>Eligibility:</strong> Fresher</p>
            <p><strong>Package:</strong> ₹4 - 6 LPA</p>

        </div>


        <form action="#" method="post" enctype="multipart/form-data">

            <!-- Student Information -->

            <div class="form-row">

                <div class="form-group">
                    <label>Student Name</label>
                    <input type="text"
                           name="studentName"
                           placeholder="Enter your full name"
                           required>
                </div>

                <div class="form-group">
                    <label>Student ID</label>
                    <input type="text"
                           name="studentId"
                           placeholder="Enter student ID"
                           required>
                </div>

            </div>


            <div class="form-row">

                <div class="form-group">
                    <label>Email</label>
                    <input type="email"
                           name="email"
                           placeholder="Enter email address"
                           required>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel"
                           name="phone"
                           placeholder="Enter phone number"
                           required>
                </div>

            </div>


            <!-- Academic Information -->

            <div class="form-row">

                <div class="form-group">

                    <label>Course</label>

                    <select name="course" required>

                        <option value="">Select Course</option>
                        <option>B.Tech Computer Science</option>
                        <option>BCA</option>
                        <option>MCA</option>
                        <option>B.Sc Computer Science</option>

                    </select>

                </div>


                <div class="form-group">

                    <label>Current CGPA</label>

                    <input type="number"
                           name="cgpa"
                           step="0.01"
                           min="0"
                           max="10"
                           placeholder="Enter CGPA"
                           required>

                </div>

            </div>


            <!-- Resume -->

            <div class="form-group">

                <label>Upload Resume</label>

                <input type="file"
                       name="resume"
                       accept=".pdf,.doc,.docx"
                       required>

            </div>


            <!-- Cover Note -->

            <div class="form-group">

                <label>Application Message</label>

                <textarea name="message"
                    placeholder="Write a short message about why you are applying for this position..."
                    required></textarea>

            </div>


            <!-- Buttons -->

            <div class="buttons">

                <button type="submit" class="btn apply-btn">
                    Submit Application
                </button>

                <a href="jobs.jsp" class="btn cancel-btn">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>