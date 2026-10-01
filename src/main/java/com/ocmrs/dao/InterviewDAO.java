package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Interview;
import com.ocmrs.util.DBConnection;

public class InterviewDAO {

    // ==========================================
    // GET ALL INTERVIEWS
    // ==========================================

    public List<Interview> getAllInterviews() {

        List<Interview> interviews = new ArrayList<>();

        String sql =
            "SELECT interview_id, application_id, " +
            "interview_date, mode, result " +
            "FROM interview " +
            "ORDER BY interview_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Interview interview = new Interview();

                interview.setInterviewId(
                    rs.getInt("interview_id")
                );

                interview.setApplicationId(
                    rs.getInt("application_id")
                );

                Timestamp timestamp =
                    rs.getTimestamp("interview_date");

                if (timestamp != null) {
                    interview.setInterviewDate(
                        timestamp.toString()
                    );
                }

                interview.setMode(
                    rs.getString("mode")
                );

                interview.setResult(
                    rs.getString("result")
                );

                interviews.add(interview);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return interviews;
    }


    // ==========================================
    // GET INTERVIEW BY ID
    // ==========================================

    public Interview getInterviewById(int interviewId) {

        Interview interview = null;

        String sql =
            "SELECT interview_id, application_id, " +
            "interview_date, mode, result " +
            "FROM interview " +
            "WHERE interview_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, interviewId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    interview = new Interview();

                    interview.setInterviewId(
                        rs.getInt("interview_id")
                    );

                    interview.setApplicationId(
                        rs.getInt("application_id")
                    );

                    Timestamp timestamp =
                        rs.getTimestamp("interview_date");

                    if (timestamp != null) {
                        interview.setInterviewDate(
                            timestamp.toString()
                        );
                    }

                    interview.setMode(
                        rs.getString("mode")
                    );

                    interview.setResult(
                        rs.getString("result")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return interview;
    }


    // ==========================================
    // GET INTERVIEWS BY APPLICATION ID
    // ==========================================

    public List<Interview> getInterviewsByApplicationId(
            int applicationId) {

        List<Interview> interviews =
            new ArrayList<>();

        String sql =
            "SELECT interview_id, application_id, " +
            "interview_date, mode, result " +
            "FROM interview " +
            "WHERE application_id = ? " +
            "ORDER BY interview_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Interview interview =
                        new Interview();

                    interview.setInterviewId(
                        rs.getInt("interview_id")
                    );

                    interview.setApplicationId(
                        rs.getInt("application_id")
                    );

                    Timestamp timestamp =
                        rs.getTimestamp("interview_date");

                    if (timestamp != null) {
                        interview.setInterviewDate(
                            timestamp.toString()
                        );
                    }

                    interview.setMode(
                        rs.getString("mode")
                    );

                    interview.setResult(
                        rs.getString("result")
                    );

                    interviews.add(interview);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return interviews;
    }


    // ==========================================
    // GET INTERVIEWS BY COMPANY ID
    // ==========================================

    public List<Interview> getInterviewsByCompanyId(
            int companyId) {

        List<Interview> interviews =
            new ArrayList<>();

        String sql =
            "SELECT i.interview_id, " +
            "i.application_id, " +
            "i.interview_date, " +
            "i.mode, " +
            "i.result, " +

            "s.name AS student_name, " +
            "s.email AS student_email, " +
            "s.phone AS student_phone, " +

            "j.title AS job_title, " +

            "c.company_name AS company_name " +

            "FROM interview i " +

            "INNER JOIN application a " +
            "ON i.application_id = a.application_id " +

            "INNER JOIN student s " +
            "ON a.student_id = s.student_id " +

            "INNER JOIN job j " +
            "ON a.job_id = j.job_id " +

            "INNER JOIN company c " +
            "ON j.company_id = c.company_id " +

            "WHERE j.company_id = ? " +

            "ORDER BY i.interview_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Interview interview =
                        new Interview();

                    interview.setInterviewId(
                        rs.getInt("interview_id")
                    );

                    interview.setApplicationId(
                        rs.getInt("application_id")
                    );

                    Timestamp timestamp =
                        rs.getTimestamp("interview_date");

                    if (timestamp != null) {

                        interview.setInterviewDate(
                            timestamp.toString()
                        );
                    }

                    interview.setMode(
                        rs.getString("mode")
                    );

                    interview.setResult(
                        rs.getString("result")
                    );

                    interview.setStudentName(
                        rs.getString("student_name")
                    );

                    interview.setStudentEmail(
                        rs.getString("student_email")
                    );

                    interview.setStudentPhone(
                        rs.getString("student_phone")
                    );

                    interview.setJobTitle(
                        rs.getString("job_title")
                    );

                    interview.setCompanyName(
                        rs.getString("company_name")
                    );

                    interviews.add(interview);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return interviews;
    }


    // ==========================================
    // ADD INTERVIEW
    // ==========================================

    public boolean addInterview(Interview interview) {

        String sql =
            "INSERT INTO interview " +
            "(application_id, interview_date, mode, result) " +
            "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(
                1,
                interview.getApplicationId()
            );

            ps.setTimestamp(
                2,
                Timestamp.valueOf(
                    interview.getInterviewDate()
                )
            );

            ps.setString(
                3,
                interview.getMode()
            );

            ps.setString(
                4,
                interview.getResult()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // ==========================================
    // UPDATE INTERVIEW
    // ==========================================

    public boolean updateInterview(
            Interview interview) {

        String sql =
            "UPDATE interview SET " +
            "application_id = ?, " +
            "interview_date = ?, " +
            "mode = ?, " +
            "result = ? " +
            "WHERE interview_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(
                1,
                interview.getApplicationId()
            );

            ps.setTimestamp(
                2,
                Timestamp.valueOf(
                    interview.getInterviewDate()
                )
            );

            ps.setString(
                3,
                interview.getMode()
            );

            ps.setString(
                4,
                interview.getResult()
            );

            ps.setInt(
                5,
                interview.getInterviewId()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // ==========================================
    // DELETE INTERVIEW
    // ==========================================

    public boolean deleteInterview(
            int interviewId) {

        String sql =
            "DELETE FROM interview " +
            "WHERE interview_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, interviewId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}