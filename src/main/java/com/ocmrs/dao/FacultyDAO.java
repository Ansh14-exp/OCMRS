package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Faculty;
import com.ocmrs.util.DBConnection;

public class FacultyDAO {

    // ADD FACULTY
    public boolean addFaculty(Faculty faculty) {

        String sql = "INSERT INTO faculty "
                   + "(department_id, name, email, phone, designation) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, faculty.getDepartmentId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getEmail());
            ps.setString(4, faculty.getPhone());
            ps.setString(5, faculty.getDesignation());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL FACULTY
    public List<Faculty> getAllFaculty() {

        List<Faculty> facultyList = new ArrayList<Faculty>();

        String sql = "SELECT * FROM faculty";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Faculty faculty = new Faculty();

                faculty.setFacultyId(rs.getInt("faculty_id"));
                faculty.setDepartmentId(rs.getInt("department_id"));
                faculty.setName(rs.getString("name"));
                faculty.setEmail(rs.getString("email"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDesignation(rs.getString("designation"));

                facultyList.add(faculty);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return facultyList;
    }


    // GET FACULTY BY ID
    public Faculty getFacultyById(int facultyId) {

        Faculty faculty = null;

        String sql = "SELECT * FROM faculty WHERE faculty_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, facultyId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    faculty = new Faculty();

                    faculty.setFacultyId(rs.getInt("faculty_id"));
                    faculty.setDepartmentId(rs.getInt("department_id"));
                    faculty.setName(rs.getString("name"));
                    faculty.setEmail(rs.getString("email"));
                    faculty.setPhone(rs.getString("phone"));
                    faculty.setDesignation(rs.getString("designation"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return faculty;
    }


    // UPDATE FACULTY
    public boolean updateFaculty(Faculty faculty) {

        String sql = "UPDATE faculty SET "
                   + "department_id = ?, "
                   + "name = ?, "
                   + "email = ?, "
                   + "phone = ?, "
                   + "designation = ? "
                   + "WHERE faculty_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, faculty.getDepartmentId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getEmail());
            ps.setString(4, faculty.getPhone());
            ps.setString(5, faculty.getDesignation());
            ps.setInt(6, faculty.getFacultyId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE FACULTY
    public boolean deleteFaculty(int facultyId) {

        String sql = "DELETE FROM faculty WHERE faculty_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, facultyId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


//GET FACULTY BY USER ID
public Faculty getFacultyByUserId(int userId) {

    Faculty faculty = null;

    String sql =
            "SELECT faculty_id, user_id, department_id, "
          + "name, email, phone, designation "
          + "FROM faculty "
          + "WHERE user_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);

        try (ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {

                faculty = new Faculty();

                faculty.setFacultyId(
                    rs.getInt("faculty_id")
                );

                faculty.setDepartmentId(
                    rs.getInt("department_id")
                );

                faculty.setName(
                    rs.getString("name")
                );

                faculty.setEmail(
                    rs.getString("email")
                );

                faculty.setPhone(
                    rs.getString("phone")
                );

                faculty.setDesignation(
                    rs.getString("designation")
                );
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return faculty;
    }
}