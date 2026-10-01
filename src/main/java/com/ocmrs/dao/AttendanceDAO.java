package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Attendance;
import com.ocmrs.util.DBConnection;

public class AttendanceDAO {

    // =====================================================
    // FACULTY MODULE
    // Get attendance for all students of faculty subjects
    // =====================================================
    public List<Attendance> getAttendanceByFacultyId(int facultyId) {

        List<Attendance> attendanceList = new ArrayList<>();

        String sql =
                "SELECT a.attendance_id, "
              + "a.student_id, "
              + "a.subject_id, "
              + "a.attendance_date, "
              + "a.status, "
              + "st.name AS student_name, "
              + "s.subject_name "
              + "FROM attendance a "
              + "JOIN student st ON a.student_id = st.student_id "
              + "JOIN subject s ON a.subject_id = s.subject_id "
              + "WHERE s.faculty_id = ? "
              + "ORDER BY a.attendance_date DESC, st.name";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, facultyId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Attendance attendance = new Attendance();

                    attendance.setAttendanceId(
                            rs.getInt("attendance_id")
                    );

                    attendance.setStudentId(
                            rs.getInt("student_id")
                    );

                    attendance.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    attendance.setAttendanceDate(
                            rs.getString("attendance_date")
                    );

                    attendance.setStatus(
                            rs.getString("status")
                    );

                    attendance.setStudentName(
                            rs.getString("student_name")
                    );

                    attendance.setSubjectName(
                            rs.getString("subject_name")
                    );

                    attendanceList.add(attendance);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return attendanceList;
    }


    // =====================================================
    // FACULTY MODULE
    // Add attendance
    // =====================================================
    public boolean addAttendance(Attendance attendance) {

        String sql =
                "INSERT INTO attendance "
              + "(student_id, subject_id, attendance_date, status) "
              + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, attendance.getStudentId());
            ps.setInt(2, attendance.getSubjectId());
            ps.setString(3, attendance.getAttendanceDate());
            ps.setString(4, attendance.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // FACULTY MODULE
    // Get attendance by ID
    // =====================================================
    public Attendance getAttendanceById(int attendanceId) {

        Attendance attendance = null;

        String sql =
                "SELECT attendance_id, student_id, subject_id, "
              + "attendance_date, status "
              + "FROM attendance "
              + "WHERE attendance_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, attendanceId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    attendance = new Attendance();

                    attendance.setAttendanceId(
                            rs.getInt("attendance_id")
                    );

                    attendance.setStudentId(
                            rs.getInt("student_id")
                    );

                    attendance.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    attendance.setAttendanceDate(
                            rs.getString("attendance_date")
                    );

                    attendance.setStatus(
                            rs.getString("status")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return attendance;
    }


    // =====================================================
    // FACULTY MODULE
    // Update attendance
    // =====================================================
    public boolean updateAttendance(Attendance attendance) {

        String sql =
                "UPDATE attendance SET "
              + "student_id = ?, "
              + "subject_id = ?, "
              + "attendance_date = ?, "
              + "status = ? "
              + "WHERE attendance_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, attendance.getStudentId());
            ps.setInt(2, attendance.getSubjectId());
            ps.setString(3, attendance.getAttendanceDate());
            ps.setString(4, attendance.getStatus());
            ps.setInt(5, attendance.getAttendanceId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // FACULTY MODULE
    // Delete attendance
    // =====================================================
    public boolean deleteAttendance(int attendanceId) {

        String sql =
                "DELETE FROM attendance "
              + "WHERE attendance_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, attendanceId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // STUDENT MODULE
    // Get attendance of a particular student
    // =====================================================
    public List<Attendance> getAttendanceByStudentId(int studentId) {

        List<Attendance> attendanceList = new ArrayList<>();

        String sql =
                "SELECT a.attendance_id, "
              + "a.student_id, "
              + "a.subject_id, "
              + "a.attendance_date, "
              + "a.status, "
              + "s.subject_name "
              + "FROM attendance a "
              + "JOIN subject s ON a.subject_id = s.subject_id "
              + "WHERE a.student_id = ? "
              + "ORDER BY a.attendance_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Attendance attendance = new Attendance();

                    attendance.setAttendanceId(
                            rs.getInt("attendance_id")
                    );

                    attendance.setStudentId(
                            rs.getInt("student_id")
                    );

                    attendance.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    attendance.setAttendanceDate(
                            rs.getString("attendance_date")
                    );

                    attendance.setStatus(
                            rs.getString("status")
                    );

                    attendance.setSubjectName(
                            rs.getString("subject_name")
                    );

                    attendanceList.add(attendance);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return attendanceList;
    }
}