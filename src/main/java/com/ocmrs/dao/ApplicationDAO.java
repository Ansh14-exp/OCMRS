package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Application;
import com.ocmrs.util.DBConnection;

public class ApplicationDAO {

    // ADD APPLICATION
    public boolean addApplication(Application application) {

        String sql = "INSERT INTO application "
                   + "(job_id, student_id, application_date, status) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, application.getJobId());
            ps.setInt(2, application.getStudentId());
            ps.setDate(3, application.getApplicationDate());
            ps.setString(4, application.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL APPLICATIONS
    public List<Application> getAllApplications() {

        List<Application> applications =
                new ArrayList<>();

        String sql = "SELECT * FROM application";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Application application =
                        new Application();

                application.setApplicationId(
                        rs.getInt("application_id")
                );

                application.setJobId(
                        rs.getInt("job_id")
                );

                application.setStudentId(
                        rs.getInt("student_id")
                );

                application.setApplicationDate(
                        rs.getDate("application_date")
                );

                application.setStatus(
                        rs.getString("status")
                );

                applications.add(application);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return applications;
    }


    // GET APPLICATION BY ID
    public Application getApplicationById(int applicationId) {

        Application application = null;

        String sql =
                "SELECT * FROM application "
              + "WHERE application_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                application = new Application();

                application.setApplicationId(
                        rs.getInt("application_id")
                );

                application.setJobId(
                        rs.getInt("job_id")
                );

                application.setStudentId(
                        rs.getInt("student_id")
                );

                application.setApplicationDate(
                        rs.getDate("application_date")
                );

                application.setStatus(
                        rs.getString("status")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return application;
    }


    // UPDATE APPLICATION
    public boolean updateApplication(
            Application application) {

        String sql =
                "UPDATE application SET "
              + "job_id = ?, "
              + "student_id = ?, "
              + "application_date = ?, "
              + "status = ? "
              + "WHERE application_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, application.getJobId());
            ps.setInt(2, application.getStudentId());
            ps.setDate(3, application.getApplicationDate());
            ps.setString(4, application.getStatus());
            ps.setInt(5, application.getApplicationId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE APPLICATION
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