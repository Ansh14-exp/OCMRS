package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.College;
import com.ocmrs.util.DBConnection;

public class CollegeDAO {

    // =========================
    // ADD COLLEGE
    // =========================
    public boolean addCollege(College college) {

        String sql = "INSERT INTO college "
                   + "(college_name, address, email, phone) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, college.getCollegeName());
            ps.setString(2, college.getAddress());
            ps.setString(3, college.getEmail());
            ps.setString(4, college.getPhone());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // GET ALL COLLEGES
    // =========================
    public List<College> getAllColleges() {

        List<College> colleges =
                new ArrayList<College>();

        String sql = "SELECT * FROM college";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                College college =
                        new College();

                college.setCollegeId(
                    rs.getInt("college_id")
                );

                college.setCollegeName(
                    rs.getString("college_name")
                );

                college.setAddress(
                    rs.getString("address")
                );

                college.setEmail(
                    rs.getString("email")
                );

                college.setPhone(
                    rs.getString("phone")
                );

                colleges.add(college);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return colleges;
    }


    // =========================
    // GET COLLEGE BY ID
    // =========================
    public College getCollegeById(int collegeId) {

        College college = null;

        String sql =
                "SELECT * FROM college "
              + "WHERE college_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, collegeId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    college =
                            new College();

                    college.setCollegeId(
                        rs.getInt("college_id")
                    );

                    college.setCollegeName(
                        rs.getString("college_name")
                    );

                    college.setAddress(
                        rs.getString("address")
                    );

                    college.setEmail(
                        rs.getString("email")
                    );

                    college.setPhone(
                        rs.getString("phone")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return college;
    }


    // =========================
    // UPDATE COLLEGE
    // =========================
    public boolean updateCollege(College college) {

        String sql =
                "UPDATE college SET "
              + "college_name = ?, "
              + "address = ?, "
              + "email = ?, "
              + "phone = ? "
              + "WHERE college_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, college.getCollegeName());
            ps.setString(2, college.getAddress());
            ps.setString(3, college.getEmail());
            ps.setString(4, college.getPhone());
            ps.setInt(5, college.getCollegeId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE COLLEGE
    // =========================
    public boolean deleteCollege(int collegeId) {

        String sql =
                "DELETE FROM college "
              + "WHERE college_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, collegeId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}