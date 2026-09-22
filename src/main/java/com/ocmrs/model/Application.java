package com.ocmrs.model;

import java.sql.Date;

public class Application {

    private int applicationId;
    private int jobId;
    private int studentId;
    private Date applicationDate;
    private String status;

    public Application() {
    }

    public Application(int applicationId,
                       int jobId,
                       int studentId,
                       Date applicationDate,
                       String status) {

        this.applicationId = applicationId;
        this.jobId = jobId;
        this.studentId = studentId;
        this.applicationDate = applicationDate;
        this.status = status;
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

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}