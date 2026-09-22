package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Company;
import com.ocmrs.util.DBConnection;

public class CompanyDAO {

    // ADD COMPANY
    public boolean addCompany(Company company) {

        String sql = "INSERT INTO company "
                   + "(company_name, industry, email, phone, address, website) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, company.getCompanyName());
            ps.setString(2, company.getIndustry());
            ps.setString(3, company.getEmail());
            ps.setString(4, company.getPhone());
            ps.setString(5, company.getAddress());
            ps.setString(6, company.getWebsite());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL COMPANIES
    public List<Company> getAllCompanies() {

        List<Company> companies = new ArrayList<>();

        String sql = "SELECT * FROM company";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Company company = new Company();

                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyName(rs.getString("company_name"));
                company.setIndustry(rs.getString("industry"));
                company.setEmail(rs.getString("email"));
                company.setPhone(rs.getString("phone"));
                company.setAddress(rs.getString("address"));
                company.setWebsite(rs.getString("website"));

                companies.add(company);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return companies;
    }


    // GET COMPANY BY ID
    public Company getCompanyById(int companyId) {

        Company company = null;

        String sql = "SELECT * FROM company WHERE company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                company = new Company();

                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyName(rs.getString("company_name"));
                company.setIndustry(rs.getString("industry"));
                company.setEmail(rs.getString("email"));
                company.setPhone(rs.getString("phone"));
                company.setAddress(rs.getString("address"));
                company.setWebsite(rs.getString("website"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return company;
    }


    // UPDATE COMPANY
    public boolean updateCompany(Company company) {

        String sql = "UPDATE company SET "
                   + "company_name = ?, "
                   + "industry = ?, "
                   + "email = ?, "
                   + "phone = ?, "
                   + "address = ?, "
                   + "website = ? "
                   + "WHERE company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, company.getCompanyName());
            ps.setString(2, company.getIndustry());
            ps.setString(3, company.getEmail());
            ps.setString(4, company.getPhone());
            ps.setString(5, company.getAddress());
            ps.setString(6, company.getWebsite());
            ps.setInt(7, company.getCompanyId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE COMPANY
    public boolean deleteCompany(int companyId) {

        String sql = "DELETE FROM company WHERE company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}