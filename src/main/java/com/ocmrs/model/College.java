package com.ocmrs.model;

public class College {

    private int collegeId;
    private String collegeName;
    private String address;
    private String email;
    private String phone;

    public College() {
    }

    public College(int collegeId, String collegeName,
                   String address, String email, String phone) {

        this.collegeId = collegeId;
        this.collegeName = collegeName;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
}