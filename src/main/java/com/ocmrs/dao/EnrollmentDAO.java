package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Enrollment;
import com.ocmrs.util.DBConnection;

public class EnrollmentDAO {

    public List<Enrollment> getEnrollmentsByStudentId(int studentId) {

        List<Enrollment> list = new ArrayList<>();

        String sql = "SELECT * FROM enrollment WHERE student_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Enrollment enrollment = new Enrollment();

                enrollment.setEnrollmentId(
                        rs.getInt("enrollment_id"));

                enrollment.setStudentId(
                        rs.getInt("student_id"));

                enrollment.setCourseId(
                        rs.getInt("course_id"));

                enrollment.setEnrollmentYear(
                        rs.getInt("enrollment_year"));

                enrollment.setGrade(
                        rs.getString("grade"));

                list.add(enrollment);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}