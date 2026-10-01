package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Job;
import com.ocmrs.util.DBConnection;

public class JobDAO {
	
	public List<Job> getAllJobs() {

	    List<Job> jobs = new ArrayList<>();

	    String sql = "SELECT job_id, company_id, title, description, "
	               + "salary_range, location, last_date "
	               + "FROM job "
	               + "ORDER BY job_id DESC";

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

	            if (rs.getDate("last_date") != null) {
	                job.setLastDate(
	                    rs.getDate("last_date").toString()
	                );
	            }

	            jobs.add(job);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return jobs;
	}
	
    // =========================
    // GET ALL JOBS
    // =========================
	public List<Job> getJobsByCompanyId(int companyId) {

	    List<Job> jobs = new ArrayList<>();

	    String sql = "SELECT job_id, company_id, title, description, "
	               + "salary_range, location, last_date "
	               + "FROM job "
	               + "WHERE company_id = ? "
	               + "ORDER BY job_id DESC";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, companyId);

	        try (ResultSet rs = ps.executeQuery()) {

	            while (rs.next()) {

	                Job job = new Job();

	                job.setJobId(rs.getInt("job_id"));
	                job.setCompanyId(rs.getInt("company_id"));
	                job.setTitle(rs.getString("title"));
	                job.setDescription(rs.getString("description"));
	                job.setSalaryRange(rs.getString("salary_range"));
	                job.setLocation(rs.getString("location"));

	                if (rs.getDate("last_date") != null) {
	                    job.setLastDate(
	                        rs.getDate("last_date").toString()
	                    );
	                }

	                jobs.add(job);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return jobs;
	}


    // =========================
    // GET JOB BY ID
    // =========================
    public Job getJobById(int jobId) {

        Job job = null;

        String sql = "SELECT job_id, company_id, title, description, "
                   + "salary_range, location, last_date "
                   + "FROM job WHERE job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    job = new Job();

                    job.setJobId(rs.getInt("job_id"));
                    job.setCompanyId(rs.getInt("company_id"));
                    job.setTitle(rs.getString("title"));
                    job.setDescription(rs.getString("description"));
                    job.setSalaryRange(rs.getString("salary_range"));
                    job.setLocation(rs.getString("location"));

                    java.sql.Date date = rs.getDate("last_date");

                    if (date != null) {
                        job.setLastDate(date.toString());
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return job;
    }


    // =========================
    // ADD JOB
    // =========================
    public boolean addJob(Job job) {

        String sql = "INSERT INTO job "
                   + "(company_id, title, description, salary_range, "
                   + "location, last_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, job.getCompanyId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getSalaryRange());
            ps.setString(5, job.getLocation());

            if (job.getLastDate() != null
                    && !job.getLastDate().trim().isEmpty()) {

                ps.setDate(
                    6,
                    java.sql.Date.valueOf(job.getLastDate())
                );

            } else {

                ps.setNull(
                    6,
                    java.sql.Types.DATE
                );
            }

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // UPDATE JOB
    // =========================
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

            if (job.getLastDate() != null
                    && !job.getLastDate().trim().isEmpty()) {

                ps.setDate(
                    6,
                    java.sql.Date.valueOf(job.getLastDate())
                );

            } else {

                ps.setNull(
                    6,
                    java.sql.Types.DATE
                );
            }

            ps.setInt(7, job.getJobId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE JOB
    // =========================
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
    
    // ==============================
    // UPDATE JOB BY COMPANY
    // ==============================
    
    public boolean updateJobByCompany(Job job, int companyId) {

        String sql = "UPDATE job SET "
                   + "title = ?, "
                   + "description = ?, "
                   + "salary_range = ?, "
                   + "location = ?, "
                   + "last_date = ? "
                   + "WHERE job_id = ? AND company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, job.getTitle());
            ps.setString(2, job.getDescription());
            ps.setString(3, job.getSalaryRange());
            ps.setString(4, job.getLocation());

            if (job.getLastDate() != null
                    && !job.getLastDate().trim().isEmpty()) {

                ps.setDate(
                    5,
                    java.sql.Date.valueOf(job.getLastDate())
                );

            } else {

                ps.setNull(5, java.sql.Types.DATE);
            }

            ps.setInt(6, job.getJobId());

            // Security check
            ps.setInt(7, companyId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    // =============================
    // DELETE JOB BY COMPANY
    // =============================
    
    public boolean deleteJobByCompany(int jobId, int companyId) {

        String sql = "DELETE FROM job "
                   + "WHERE job_id = ? AND company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, companyId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}