package com.ocmrs.model;

public class Department {

    private int departmentId;
    private int collegeId;
    private String departmentName;
    private String hodName;

    public Department() {
    }

    public Department(int departmentId, int collegeId,
                      String departmentName, String hodName) {

        this.departmentId = departmentId;
        this.collegeId = collegeId;
        this.departmentName = departmentName;
        this.hodName = hodName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getHodName() {
        return hodName;
    }

    public void setHodName(String hodName) {
        this.hodName = hodName;
    }
}