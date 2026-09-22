package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Job;
import com.ocmrs.util.DBConnection;

public class JobDAO {

    // ADD JOB
    public boolean addJob(Job job) {

        String sql = "INSERT INTO job "
                   + "(company_id, title, description, salary_range, location, last_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, job.getCompanyId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getSalaryRange());
            ps.setString(5, job.getLocation());
            ps.setDate(6, job.getLastDate());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL JOBS
    public List<Job> getAllJobs() {

        List<Job> jobs = new ArrayList<>();

        String sql = "SELECT * FROM job";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setCompanyId(rs.getInt("company_id"));
                job.setTitle(rs.getString("title"));
                job.setDescription(rs.getString("description"));
                job.setSalaryRange(rs.getString("salary_range"));
                job.setLocation(rs.getString("location"));
                job.setLastDate(rs.getDate("last_date"));

                jobs.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobs;
    }


    // GET JOB BY ID
    public Job getJobById(int jobId) {

        Job job = null;

        String sql = "SELECT * FROM job WHERE job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setCompanyId(rs.getInt("company_id"));
                job.setTitle(rs.getString("title"));
                job.setDescription(rs.getString("description"));
                job.setSalaryRange(rs.getString("salary_range"));
                job.setLocation(rs.getString("location"));
                job.setLastDate(rs.getDate("last_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return job;
    }


    // UPDATE JOB
    public boolean updateJob(Job job) {

        String sql = "UPDATE job SET "
                   + "company_id = ?, "
                   + "title = ?, "
                   + "description = ?, "
                   + "salary_range = ?, "
                   + "location = ?, "
                   + "last_date = ? "
                   + "WHERE job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, job.getCompanyId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getSalaryRange());
            ps.setString(5, job.getLocation());
            ps.setDate(6, job.getLastDate());
            ps.setInt(7, job.getJobId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE JOB
    public boolean deleteJob(int jobId) {

        String sql = "DELETE FROM job WHERE job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}