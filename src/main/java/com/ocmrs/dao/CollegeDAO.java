package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.College;
import com.ocmrs.util.DBConnection;

public class CollegeDAO {

    // Add College
    public boolean addCollege(College college) {

        String sql = "INSERT INTO college "
                   + "(college_name, address, email, phone) "
                   + "VALUES (?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, college.getCollegeName());
            ps.setString(2, college.getAddress());
            ps.setString(3, college.getEmail());
            ps.setString(4, college.getPhone());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get All Colleges
    public List<College> getAllColleges() {

        List<College> colleges = new ArrayList<College>();

        String sql = "SELECT * FROM college";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                College college = new College();

                college.setCollegeId(
                        rs.getInt("college_id"));

                college.setCollegeName(
                        rs.getString("college_name"));

                college.setAddress(
                        rs.getString("address"));

                college.setEmail(
                        rs.getString("email"));

                college.setPhone(
                        rs.getString("phone"));

                colleges.add(college);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return colleges;
    }


    // Delete College
    public boolean deleteCollege(int collegeId) {

        String sql =
                "DELETE FROM college WHERE college_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, collegeId);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
     
 // Get College By ID
    public College getCollegeById(int collegeId) {

        College college = null;

        String sql = "SELECT * FROM college WHERE college_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, collegeId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                college = new College();

                college.setCollegeId(
                        rs.getInt("college_id"));

                college.setCollegeName(
                        rs.getString("college_name"));

                college.setAddress(
                        rs.getString("address"));

                college.setEmail(
                        rs.getString("email"));

                college.setPhone(
                        rs.getString("phone"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return college;
    }
    
 // Update College
    public boolean updateCollege(College college) {

        String sql = "UPDATE college SET college_name = ?, "
                   + "address = ?, email = ?, phone = ? "
                   + "WHERE college_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, college.getCollegeName());
            ps.setString(2, college.getAddress());
            ps.setString(3, college.getEmail());
            ps.setString(4, college.getPhone());
            ps.setInt(5, college.getCollegeId());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}