package com.ocmrs.model;

public class College {

    private int collegeId;
    private String collegeName;
    private String address;
    private String email;
    private String phone;

    // Default Constructor
    public College() {
    }

    // Parameterized Constructor
    public College(int collegeId,
                   String collegeName,
                   String address,
                   String email,
                   String phone) {

        this.collegeId = collegeId;
        this.collegeName = collegeName;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    // Getter and Setter for collegeId
    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    // Getter and Setter for collegeName
    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    // Getter and Setter for address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for phone
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}