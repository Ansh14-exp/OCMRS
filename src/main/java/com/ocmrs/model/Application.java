package com.ocmrs.model;

public class Application {

    private int applicationId;
    private int jobId;
    private int studentId;
    private String applicationDate;
    private String status;

    // Extra display fields
    private String jobTitle;
    private String companyName;

    // Student display fields
    private String studentName;
    private String studentEmail;
    private String studentPhone;

    public Application() {
    }

    public Application(int applicationId, int jobId, int studentId,
                       String applicationDate, String status) {

        this.applicationId = applicationId;
        this.jobId = jobId;
        this.studentId = studentId;
        this.applicationDate = applicationDate;
        this.status = status;
    }

    // =========================
    // Application ID
    // =========================

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    // =========================
    // Job ID
    // =========================

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    // =========================
    // Student ID
    // =========================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    // =========================
    // Application Date
    // =========================

    public String getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(String applicationDate) {
        this.applicationDate = applicationDate;
    }

    // =========================
    // Status
    // =========================

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // =========================
    // Job Title
    // =========================

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    // =========================
    // Company Name
    // =========================

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    // =========================
    // Student Name
    // =========================

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    // =========================
    // Student Email
    // =========================

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    // =========================
    // Student Phone
    // =========================

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }
}