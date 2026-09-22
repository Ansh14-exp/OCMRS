package com.ocmrs.model;

public class Faculty {

    private int facultyId;
    private int departmentId;
    private String name;
    private String email;
    private String phone;
    private String designation;

    public Faculty() {
    }

    public Faculty(int facultyId, int departmentId,
                   String name, String email,
                   String phone, String designation) {

        this.facultyId = facultyId;
        this.departmentId = departmentId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.designation = designation;
    }

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
}