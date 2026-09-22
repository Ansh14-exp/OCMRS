package com.ocmrs.model;

import java.sql.Date;

public class Job {

    private int jobId;
    private int companyId;
    private String title;
    private String description;
    private String salaryRange;
    private String location;
    private Date lastDate;

    public Job() {
    }

    public Job(int jobId, int companyId,
               String title, String description,
               String salaryRange, String location,
               Date lastDate) {

        this.jobId = jobId;
        this.companyId = companyId;
        this.title = title;
        this.description = description;
        this.salaryRange = salaryRange;
        this.location = location;
        this.lastDate = lastDate;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSalaryRange() {
        return salaryRange;
    }

    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getLastDate() {
        return lastDate;
    }

    public void setLastDate(Date lastDate) {
        this.lastDate = lastDate;
    }
}