package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Subject;
import com.ocmrs.util.DBConnection;

public class SubjectDAO {

    // =====================================================
    // STUDENT MODULE
    // Get subjects by course ID
    // =====================================================

    public List<Subject> getSubjectsByCourseId(int courseId) {

        List<Subject> subjects = new ArrayList<>();

        String sql = "SELECT subject_id, course_id, subject_name, credits "
                   + "FROM subject WHERE course_id = ? "
                   + "ORDER BY subject_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, courseId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Subject subject = new Subject();

                    subject.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    subject.setCourseId(
                            rs.getInt("course_id")
                    );

                    subject.setSubjectName(
                            rs.getString("subject_name")
                    );

                    subject.setCredits(
                            rs.getInt("credits")
                    );

                    subjects.add(subject);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subjects;
    }


    // =====================================================
    // ADMIN MODULE
    // Get all subjects
    // =====================================================

    public List<Subject> getAllSubjects() {

        List<Subject> subjects = new ArrayList<>();

        String sql = "SELECT subject_id, course_id, subject_name, credits "
                   + "FROM subject ORDER BY subject_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Subject subject = new Subject();

                subject.setSubjectId(
                        rs.getInt("subject_id")
                );

                subject.setCourseId(
                        rs.getInt("course_id")
                );

                subject.setSubjectName(
                        rs.getString("subject_name")
                );

                subject.setCredits(
                        rs.getInt("credits")
                );

                subjects.add(subject);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subjects;
    }


    // =====================================================
    // ADMIN MODULE
    // Get subject by ID
    // =====================================================

    public Subject getSubjectById(int subjectId) {

        Subject subject = null;

        String sql = "SELECT subject_id, course_id, subject_name, credits "
                   + "FROM subject WHERE subject_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, subjectId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    subject = new Subject();

                    subject.setSubjectId(
                            rs.getInt("subject_id")
                    );

                    subject.setCourseId(
                            rs.getInt("course_id")
                    );

                    subject.setSubjectName(
                            rs.getString("subject_name")
                    );

                    subject.setCredits(
                            rs.getInt("credits")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subject;
    }


    // =====================================================
    // ADMIN MODULE
    // Add subject
    // =====================================================

    public boolean addSubject(Subject subject) {

        String sql = "INSERT INTO subject "
                   + "(course_id, subject_name, credits) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, subject.getCourseId());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getCredits());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // ADMIN MODULE
    // Update subject
    // =====================================================

    public boolean updateSubject(Subject subject) {

        String sql = "UPDATE subject SET "
                   + "course_id = ?, "
                   + "subject_name = ?, "
                   + "credits = ? "
                   + "WHERE subject_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, subject.getCourseId());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getCredits());
            ps.setInt(4, subject.getSubjectId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // ADMIN MODULE
    // Delete subject
    // =====================================================

    public boolean deleteSubject(int subjectId) {

        String sql = "DELETE FROM subject WHERE subject_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, subjectId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
 // GET SUBJECTS BY FACULTY ID
    public List<Subject> getSubjectsByFacultyId(int facultyId) {

        List<Subject> subjectList = new ArrayList<>();

        String sql =
                "SELECT subject_id, course_id, faculty_id, "
              + "subject_name, credits "
              + "FROM subject "
              + "WHERE faculty_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, facultyId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Subject subject = new Subject();

                    subject.setSubjectId(
                        rs.getInt("subject_id")
                    );

                    subject.setCourseId(
                        rs.getInt("course_id")
                    );

                    subject.setSubjectName(
                        rs.getString("subject_name")
                    );

                    subject.setCredits(
                        rs.getInt("credits")
                    );

                    subjectList.add(subject);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subjectList;
    }
}