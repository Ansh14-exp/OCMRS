package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Faculty;
import com.ocmrs.util.DBConnection;

public class FacultyDAO {

    // Add Faculty
    public boolean addFaculty(Faculty faculty) {

        String sql = "INSERT INTO faculty "
                   + "(department_id, name, email, phone, designation) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, faculty.getDepartmentId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getEmail());
            ps.setString(4, faculty.getPhone());
            ps.setString(5, faculty.getDesignation());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // View All Faculty
    public List<Faculty> getAllFaculty() {

        List<Faculty> facultyList =
                new ArrayList<Faculty>();

        String sql = "SELECT * FROM faculty";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Faculty faculty =
                        new Faculty();

                faculty.setFacultyId(
                        rs.getInt("faculty_id"));

                faculty.setDepartmentId(
                        rs.getInt("department_id"));

                faculty.setName(
                        rs.getString("name"));

                faculty.setEmail(
                        rs.getString("email"));

                faculty.setPhone(
                        rs.getString("phone"));

                faculty.setDesignation(
                        rs.getString("designation"));

                facultyList.add(faculty);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return facultyList;
    }


    // Delete Faculty
    public boolean deleteFaculty(int facultyId) {

        String sql =
                "DELETE FROM faculty WHERE faculty_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, facultyId);

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get Faculty by ID
    public Faculty getFacultyById(int facultyId) {

        Faculty faculty = null;

        String sql =
                "SELECT * FROM faculty WHERE faculty_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, facultyId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                faculty =
                        new Faculty();

                faculty.setFacultyId(
                        rs.getInt("faculty_id"));

                faculty.setDepartmentId(
                        rs.getInt("department_id"));

                faculty.setName(
                        rs.getString("name"));

                faculty.setEmail(
                        rs.getString("email"));

                faculty.setPhone(
                        rs.getString("phone"));

                faculty.setDesignation(
                        rs.getString("designation"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return faculty;
    }


    // Update Faculty
    public boolean updateFaculty(Faculty faculty) {

        String sql =
                "UPDATE faculty SET "
              + "department_id = ?, "
              + "name = ?, "
              + "email = ?, "
              + "phone = ?, "
              + "designation = ? "
              + "WHERE faculty_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, faculty.getDepartmentId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getEmail());
            ps.setString(4, faculty.getPhone());
            ps.setString(5, faculty.getDesignation());
            ps.setInt(6, faculty.getFacultyId());

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}