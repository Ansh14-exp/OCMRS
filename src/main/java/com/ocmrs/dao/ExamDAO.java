package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Exam;
import com.ocmrs.util.DBConnection;

public class ExamDAO {

    // =====================================================
    // STUDENT MODULE
    // Get exams according to student's course
    // =====================================================

    public List<Exam> getExamsByCourseId(int courseId) {

        List<Exam> examList = new ArrayList<>();

        String sql =
                "SELECT e.exam_id, e.subject_id, e.exam_type, "
              + "e.exam_date, e.total_marks "
              + "FROM exam e "
              + "JOIN subject s ON e.subject_id = s.subject_id "
              + "WHERE s.course_id = ? "
              + "ORDER BY e.exam_date";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, courseId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Exam exam = new Exam();

                    exam.setExamId(
                            rs.getInt("exam_id")
                    );

                    exam.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    exam.setExamType(
                            rs.getString("exam_type")
                    );

                    exam.setExamDate(
                            rs.getString("exam_date")
                    );

                    exam.setTotalMarks(
                            rs.getInt("total_marks")
                    );

                    examList.add(exam);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return examList;
    }


    // =====================================================
    // FACULTY MODULE
    // Get exams according to faculty's subjects
    // =====================================================

    public List<Exam> getExamsByFacultyId(int facultyId) {

        List<Exam> examList = new ArrayList<>();

        String sql =
                "SELECT e.exam_id, e.subject_id, e.exam_type, "
              + "e.exam_date, e.total_marks "
              + "FROM exam e "
              + "JOIN subject s ON e.subject_id = s.subject_id "
              + "WHERE s.faculty_id = ? "
              + "ORDER BY e.exam_date";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, facultyId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Exam exam = new Exam();

                    exam.setExamId(
                            rs.getInt("exam_id")
                    );

                    exam.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    exam.setExamType(
                            rs.getString("exam_type")
                    );

                    exam.setExamDate(
                            rs.getString("exam_date")
                    );

                    exam.setTotalMarks(
                            rs.getInt("total_marks")
                    );

                    examList.add(exam);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return examList;
    }


    // =====================================================
    // ADMIN MODULE
    // Get all exams
    // =====================================================

    public List<Exam> getAllExams() {

        List<Exam> exams = new ArrayList<>();

        String sql =
                "SELECT exam_id, subject_id, exam_type, "
              + "exam_date, total_marks "
              + "FROM exam "
              + "ORDER BY exam_date";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Exam exam = new Exam();

                exam.setExamId(
                        rs.getInt("exam_id")
                );

                exam.setSubjectId(
                        rs.getInt("subject_id")
                );

                exam.setExamType(
                        rs.getString("exam_type")
                );

                exam.setExamDate(
                        rs.getString("exam_date")
                );

                exam.setTotalMarks(
                        rs.getInt("total_marks")
                );

                exams.add(exam);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exams;
    }


    // =====================================================
    // ADMIN MODULE
    // Get exam by ID
    // =====================================================

    public Exam getExamById(int examId) {

        Exam exam = null;

        String sql =
                "SELECT exam_id, subject_id, exam_type, "
              + "exam_date, total_marks "
              + "FROM exam "
              + "WHERE exam_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, examId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    exam = new Exam();

                    exam.setExamId(
                            rs.getInt("exam_id")
                    );

                    exam.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    exam.setExamType(
                            rs.getString("exam_type")
                    );

                    exam.setExamDate(
                            rs.getString("exam_date")
                    );

                    exam.setTotalMarks(
                            rs.getInt("total_marks")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exam;
    }


    // =====================================================
    // ADMIN MODULE
    // Add exam
    // =====================================================

    public boolean addExam(Exam exam) {

        String sql =
                "INSERT INTO exam "
              + "(subject_id, exam_type, exam_date, total_marks) "
              + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    exam.getSubjectId()
            );

            ps.setString(
                    2,
                    exam.getExamType()
            );

            ps.setString(
                    3,
                    exam.getExamDate()
            );

            ps.setInt(
                    4,
                    exam.getTotalMarks()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // ADMIN MODULE
    // Update exam
    // =====================================================

    public boolean updateExam(Exam exam) {

        String sql =
                "UPDATE exam SET "
              + "subject_id = ?, "
              + "exam_type = ?, "
              + "exam_date = ?, "
              + "total_marks = ? "
              + "WHERE exam_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    exam.getSubjectId()
            );

            ps.setString(
                    2,
                    exam.getExamType()
            );

            ps.setString(
                    3,
                    exam.getExamDate()
            );

            ps.setInt(
                    4,
                    exam.getTotalMarks()
            );

            ps.setInt(
                    5,
                    exam.getExamId()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // ADMIN MODULE
    // Delete exam
    // =====================================================

    public boolean deleteExam(int examId) {

        String sql =
                "DELETE FROM exam "
              + "WHERE exam_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, examId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}