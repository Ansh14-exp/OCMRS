package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Result;
import com.ocmrs.util.DBConnection;

public class ResultDAO {

    // ==========================================
    // STUDENT MODULE
    // Get results of a particular student
    // ==========================================
    public List<Result> getResultsByStudentId(int studentId) {

        List<Result> results = new ArrayList<>();

        String sql = "SELECT result_id, exam_id, student_id, marks, grade "
                   + "FROM result "
                   + "WHERE student_id = ? "
                   + "ORDER BY result_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Result result = new Result();

                    result.setResultId(rs.getInt("result_id"));
                    result.setExamId(rs.getInt("exam_id"));
                    result.setStudentId(rs.getInt("student_id"));
                    result.setMarks(rs.getDouble("marks"));
                    result.setGrade(rs.getString("grade"));

                    results.add(result);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return results;
    }

 // =====================================================
 // FACULTY MODULE
 // Get detailed results of students for faculty subjects
 // =====================================================
 public List<Result> getResultsByFacultyId(int facultyId) {

     List<Result> results = new ArrayList<>();

     String sql =
             "SELECT r.result_id, r.exam_id, r.student_id, "
           + "r.marks, r.grade, "
           + "st.name AS student_name, "
           + "s.subject_name, "
           + "e.exam_type, "
           + "e.exam_date "
           + "FROM result r "
           + "JOIN exam e ON r.exam_id = e.exam_id "
           + "JOIN subject s ON e.subject_id = s.subject_id "
           + "JOIN student st ON r.student_id = st.student_id "
           + "WHERE s.faculty_id = ? "
           + "ORDER BY e.exam_date, st.name";

     try (Connection con = DBConnection.getConnection();
          PreparedStatement ps = con.prepareStatement(sql)) {

         ps.setInt(1, facultyId);

         try (ResultSet rs = ps.executeQuery()) {

             while (rs.next()) {

                 Result result = new Result();

                 // Existing result information
                 result.setResultId(
                         rs.getInt("result_id")
                 );

                 result.setExamId(
                         rs.getInt("exam_id")
                 );

                 result.setStudentId(
                         rs.getInt("student_id")
                 );

                 result.setMarks(
                         rs.getDouble("marks")
                 );

                 result.setGrade(
                         rs.getString("grade")
                 );


                 // Detailed faculty result information
                 result.setStudentName(
                         rs.getString("student_name")
                 );

                 result.setSubjectName(
                         rs.getString("subject_name")
                 );

                 result.setExamType(
                         rs.getString("exam_type")
                 );

                 result.setExamDate(
                         rs.getString("exam_date")
                 );


                 results.add(result);
             }
         }

     } catch (Exception e) {
         e.printStackTrace();
     }

     return results;
 }
 
    // ==========================================
    // ADMIN MODULE
    // Get all results
    // ==========================================
    public List<Result> getAllResults() {

        List<Result> results = new ArrayList<>();

        String sql = "SELECT result_id, exam_id, student_id, marks, grade "
                   + "FROM result "
                   + "ORDER BY result_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Result result = new Result();

                result.setResultId(rs.getInt("result_id"));
                result.setExamId(rs.getInt("exam_id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setMarks(rs.getDouble("marks"));
                result.setGrade(rs.getString("grade"));

                results.add(result);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return results;
    }


    // ==========================================
    // ADMIN MODULE
    // Get result by ID
    // ==========================================
    public Result getResultById(int resultId) {

        Result result = null;

        String sql = "SELECT result_id, exam_id, student_id, marks, grade "
                   + "FROM result "
                   + "WHERE result_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, resultId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    result = new Result();

                    result.setResultId(rs.getInt("result_id"));
                    result.setExamId(rs.getInt("exam_id"));
                    result.setStudentId(rs.getInt("student_id"));
                    result.setMarks(rs.getDouble("marks"));
                    result.setGrade(rs.getString("grade"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    // ==========================================
    // ADMIN MODULE
    // Add Result
    // ==========================================
    public boolean addResult(Result result) {

        String sql = "INSERT INTO result "
                   + "(exam_id, student_id, marks, grade) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, result.getExamId());
            ps.setInt(2, result.getStudentId());
            ps.setDouble(3, result.getMarks());
            ps.setString(4, result.getGrade());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // ==========================================
    // ADMIN MODULE
    // Update Result
    // ==========================================
    public boolean updateResult(Result result) {

        String sql = "UPDATE result SET "
                   + "exam_id = ?, "
                   + "student_id = ?, "
                   + "marks = ?, "
                   + "grade = ? "
                   + "WHERE result_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, result.getExamId());
            ps.setInt(2, result.getStudentId());
            ps.setDouble(3, result.getMarks());
            ps.setString(4, result.getGrade());
            ps.setInt(5, result.getResultId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // ==========================================
    // ADMIN MODULE
    // Delete Result
    // ==========================================
    public boolean deleteResult(int resultId) {

        String sql = "DELETE FROM result WHERE result_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, resultId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}