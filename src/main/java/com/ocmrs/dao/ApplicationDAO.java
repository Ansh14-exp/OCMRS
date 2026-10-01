package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Application;
import com.ocmrs.util.DBConnection;

public class ApplicationDAO {

    // =========================
    // GET ALL APPLICATIONS
    // =========================
    public List<Application> getAllApplications() {

        List<Application> applications = new ArrayList<>();

        String sql = "SELECT a.application_id, a.job_id, a.student_id, "
                   + "a.application_date, a.status, "
                   + "j.title AS job_title, "
                   + "c.company_name AS company_name "
                   + "FROM application a "
                   + "JOIN job j ON a.job_id = j.job_id "
                   + "JOIN company c ON j.company_id = c.company_id "
                   + "ORDER BY a.application_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Application application = new Application();

                application.setApplicationId(
                        rs.getInt("application_id"));

                application.setJobId(
                        rs.getInt("job_id"));

                application.setStudentId(
                        rs.getInt("student_id"));

                java.sql.Date date =
                        rs.getDate("application_date");

                if (date != null) {
                    application.setApplicationDate(
                            date.toString());
                }

                application.setStatus(
                        rs.getString("status"));

                application.setJobTitle(
                        rs.getString("job_title"));

                application.setCompanyName(
                        rs.getString("company_name"));

                applications.add(application);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return applications;
    }


    // =========================
    // GET APPLICATION BY ID
    // =========================
    public Application getApplicationById(int applicationId) {

        Application application = null;

        String sql = "SELECT a.application_id, a.job_id, a.student_id, "
                   + "a.application_date, a.status, "
                   + "j.title AS job_title, "
                   + "c.company_name AS company_name "
                   + "FROM application a "
                   + "JOIN job j ON a.job_id = j.job_id "
                   + "JOIN company c ON j.company_id = c.company_id "
                   + "WHERE a.application_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    application = new Application();

                    application.setApplicationId(
                            rs.getInt("application_id"));

                    application.setJobId(
                            rs.getInt("job_id"));

                    application.setStudentId(
                            rs.getInt("student_id"));

                    java.sql.Date date =
                            rs.getDate("application_date");

                    if (date != null) {

                        application.setApplicationDate(
                                date.toString());
                    }

                    application.setStatus(
                            rs.getString("status"));

                    application.setJobTitle(
                            rs.getString("job_title"));

                    application.setCompanyName(
                            rs.getString("company_name"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return application;
    }


    // =========================
    // GET APPLICATIONS BY STUDENT
    // =========================
    public List<Application> getApplicationsByStudentId(int studentId) {

        List<Application> applications = new ArrayList<>();

        String sql = "SELECT a.application_id, a.job_id, a.student_id, "
                   + "a.application_date, a.status, "
                   + "j.title AS job_title, "
                   + "c.company_name AS company_name "
                   + "FROM application a "
                   + "JOIN job j ON a.job_id = j.job_id "
                   + "JOIN company c ON j.company_id = c.company_id "
                   + "WHERE a.student_id = ? "
                   + "ORDER BY a.application_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Application application = new Application();

                    application.setApplicationId(
                            rs.getInt("application_id"));

                    application.setJobId(
                            rs.getInt("job_id"));

                    application.setStudentId(
                            rs.getInt("student_id"));

                    java.sql.Date date =
                            rs.getDate("application_date");

                    if (date != null) {

                        application.setApplicationDate(
                                date.toString());
                    }

                    application.setStatus(
                            rs.getString("status"));

                    application.setJobTitle(
                            rs.getString("job_title"));

                    application.setCompanyName(
                            rs.getString("company_name"));

                    applications.add(application);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return applications;
    }


    // ================================
    // APPLICATIONS BY COMPANY ID
    // ================================
    public List<Application> getApplicationsByCompanyId(int companyId) {

        List<Application> applications = new ArrayList<>();

        String sql =
            "SELECT a.application_id, "
          + "a.job_id, "
          + "a.student_id, "
          + "a.application_date, "
          + "a.status, "
          + "j.title AS job_title, "
          + "s.name AS student_name, "
          + "s.email AS student_email, "
          + "s.phone AS student_phone "
          + "FROM application a "
          + "INNER JOIN job j ON a.job_id = j.job_id "
          + "INNER JOIN student s ON a.student_id = s.student_id "
          + "WHERE j.company_id = ? "
          + "ORDER BY a.application_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Application application =
                            new Application();

                    application.setApplicationId(
                            rs.getInt("application_id"));

                    application.setJobId(
                            rs.getInt("job_id"));

                    application.setStudentId(
                            rs.getInt("student_id"));

                    if (rs.getDate("application_date") != null) {

                        application.setApplicationDate(
                                rs.getDate("application_date")
                                  .toString());
                    }

                    application.setStatus(
                            rs.getString("status"));

                    application.setJobTitle(
                            rs.getString("job_title"));

                    application.setStudentName(
                            rs.getString("student_name"));

                    application.setStudentEmail(
                            rs.getString("student_email"));

                    application.setStudentPhone(
                            rs.getString("student_phone"));

                    applications.add(application);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return applications;
    }


    // ==================================================
    // CHECK APPLICATION BELONGS TO COMPANY
    // ==================================================
    public boolean applicationBelongsToCompany(
            int applicationId,
            int companyId) {

        String sql =
                "SELECT a.application_id "
              + "FROM application a "
              + "INNER JOIN job j "
              + "ON a.job_id = j.job_id "
              + "WHERE a.application_id = ? "
              + "AND j.company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);
            ps.setInt(2, companyId);

            try (ResultSet rs = ps.executeQuery()) {

                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // ADD APPLICATION
    // =========================
    public boolean addApplication(Application application) {

        String sql = "INSERT INTO application "
                   + "(job_id, student_id, application_date, status) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, application.getJobId());

            ps.setInt(2, application.getStudentId());

            if (application.getApplicationDate() != null
                    && !application.getApplicationDate()
                        .trim().isEmpty()) {

                ps.setDate(
                        3,
                        java.sql.Date.valueOf(
                                application.getApplicationDate()));

            } else {

                ps.setNull(
                        3,
                        java.sql.Types.DATE);
            }

            ps.setString(
                    4,
                    application.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // UPDATE APPLICATION
    // =========================
    public boolean updateApplication(Application application) {

        String sql = "UPDATE application SET "
                   + "job_id = ?, "
                   + "student_id = ?, "
                   + "application_date = ?, "
                   + "status = ? "
                   + "WHERE application_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, application.getJobId());

            ps.setInt(2, application.getStudentId());

            if (application.getApplicationDate() != null
                    && !application.getApplicationDate()
                        .trim().isEmpty()) {

                ps.setDate(
                        3,
                        java.sql.Date.valueOf(
                                application.getApplicationDate()));

            } else {

                ps.setNull(
                        3,
                        java.sql.Types.DATE);
            }

            ps.setString(
                    4,
                    application.getStatus());

            ps.setInt(
                    5,
                    application.getApplicationId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE APPLICATION
    // =========================
    public boolean deleteApplication(int applicationId) {

        String sql =
                "DELETE FROM application "
              + "WHERE application_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}