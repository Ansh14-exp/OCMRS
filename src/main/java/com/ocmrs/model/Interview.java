package com.ocmrs.model;

import java.sql.Timestamp;

public class Interview {

    private int interviewId;
    private int applicationId;
    private Timestamp interviewDate;
    private String mode;
    private String result;

    public Interview() {
    }

    public Interview(int interviewId,
                     int applicationId,
                     Timestamp interviewDate,
                     String mode,
                     String result) {

        this.interviewId = interviewId;
        this.applicationId = applicationId;
        this.interviewDate = interviewDate;
        this.mode = mode;
        this.result = result;
    }

    public int getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(int interviewId) {
        this.interviewId = interviewId;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public Timestamp getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Timestamp interviewDate) {
        this.interviewDate = interviewDate;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}