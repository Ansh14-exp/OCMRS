package com.ocmrs.model;

public class Job {

    private int jobId;
    private int companyId;
    private String companyName;
    private String title;
    private String description;
    private String salaryRange;
    private String location;
    private String lastDate;

    // Default Constructor
    public Job() {
    }

    // Parameterized Constructor
    public Job(int jobId, int companyId, String companyName, String title,
               String description, String salaryRange,
               String location, String lastDate) {

        this.jobId = jobId;
        this.companyId = companyId;
        this.companyName = companyName;
        this.title = title;
        this.description = description;
        this.salaryRange = salaryRange;
        this.location = location;
        this.lastDate = lastDate;
    }

    // Getters and Setters

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
    
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }
}