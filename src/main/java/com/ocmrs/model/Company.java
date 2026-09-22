package com.ocmrs.model;

public class Company {

    private int companyId;
    private String companyName;
    private String industry;
    private String email;
    private String phone;
    private String address;
    private String website;

    public Company() {
    }

    public Company(int companyId, String companyName,
                   String industry, String email,
                   String phone, String address,
                   String website) {

        this.companyId = companyId;
        this.companyName = companyName;
        this.industry = industry;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.website = website;
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

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}