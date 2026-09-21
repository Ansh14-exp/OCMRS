package com.ocmrs.model;

import java.sql.Date;

public class Placement {

    private int placementId;
    private int studentId;
    private int applicationId;
    private int jobId;
    private Date placementDate;
    private String packageAmount;
    private String status;

    public Placement() {
    }

    public Placement(int placementId,
                     int studentId,
                     int applicationId,
                     int jobId,
                     Date placementDate,
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

    public Date getPlacementDate() {
        return placementDate;
    }

    public void setPlacementDate(Date placementDate) {
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
}