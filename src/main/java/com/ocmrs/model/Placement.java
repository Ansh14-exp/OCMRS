package com.ocmrs.model;

public class Placement {

    private int placementId;
    private int studentId;
    private int applicationId;
    private int jobId;

    private String placementDate;
    private String packageAmount;
    private String status;

    // Display fields
    private String studentName;
    private String studentEmail;
    private String studentPhone;

    private String jobTitle;
    private String companyName;

    // ================= CONSTRUCTOR =================

    public Placement() {
    }

    public Placement(int placementId,
                     int studentId,
                     int applicationId,
                     int jobId,
                     String placementDate,
                     String packageAmount,
                     String status) {

        this.placementId = placementId;
        this.studentId = studentId;
        this.applicationId = applicationId;
        this.jobId = jobId;
        this.placementDate = placementDate;
        this.packageAmount = packageAmount;
        this.status = status;
    }

    // ================= GETTERS & SETTERS =================

    public int getPlacementId() {
        return placementId;
    }

    public void setPlacementId(int placementId) {
        this.placementId = placementId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getPlacementDate() {
        return placementDate;
    }

    public void setPlacementDate(String placementDate) {
        this.placementDate = placementDate;
    }

    public String getPackageAmount() {
        return packageAmount;
    }

    public void setPackageAmount(String packageAmount) {
        this.packageAmount = packageAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // ================= STUDENT DETAILS =================

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    // ================= JOB DETAILS =================

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}