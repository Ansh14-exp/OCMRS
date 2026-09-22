package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Interview;
import com.ocmrs.util.DBConnection;

public class InterviewDAO {

    // ADD INTERVIEW
    public boolean addInterview(Interview interview) {

        String sql = "INSERT INTO interview "
                   + "(application_id, interview_date, mode, result) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, interview.getApplicationId());
            ps.setTimestamp(2, interview.getInterviewDate());
            ps.setString(3, interview.getMode());
            ps.setString(4, interview.getResult());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL INTERVIEWS
    public List<Interview> getAllInterviews() {

        List<Interview> interviews =
                new ArrayList<Interview>();

        String sql = "SELECT * FROM interview";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Interview interview =
                        new Interview();

                interview.setInterviewId(
                        rs.getInt("interview_id")
                );

                interview.setApplicationId(
                        rs.getInt("application_id")
                );

                interview.setInterviewDate(
                        rs.getTimestamp("interview_date")
                );

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


    // GET INTERVIEW BY ID
    public Interview getInterviewById(int interviewId) {

        Interview interview = null;

        String sql =
                "SELECT * FROM interview "
              + "WHERE interview_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, interviewId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                interview =
                        new Interview();

                interview.setInterviewId(
                        rs.getInt("interview_id")
                );

                interview.setApplicationId(
                        rs.getInt("application_id")
                );

                interview.setInterviewDate(
                        rs.getTimestamp("interview_date")
                );

                interview.setMode(
                        rs.getString("mode")
                );

                interview.setResult(
                        rs.getString("result")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return interview;
    }


    // UPDATE INTERVIEW
    public boolean updateInterview(
            Interview interview) {

        String sql =
                "UPDATE interview SET "
              + "application_id = ?, "
              + "interview_date = ?, "
              + "mode = ?, "
              + "result = ? "
              + "WHERE interview_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    interview.getApplicationId()
            );

            ps.setTimestamp(
                    2,
                    interview.getInterviewDate()
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


    // DELETE INTERVIEW
    public boolean deleteInterview(int interviewId) {

        String sql =
                "DELETE FROM interview "
              + "WHERE interview_id = ?";

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