package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Placement;
import com.ocmrs.util.DBConnection;

public class PlacementDAO {

    // ADD PLACEMENT
    public boolean addPlacement(Placement placement) {

        String sql = "INSERT INTO placement "
                   + "(student_id, application_id, job_id, placement_date, package, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, placement.getStudentId());
            ps.setInt(2, placement.getApplicationId());
            ps.setInt(3, placement.getJobId());
            ps.setDate(4, placement.getPlacementDate());
            ps.setString(5, placement.getPackageAmount());
            ps.setString(6, placement.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL PLACEMENTS
    public List<Placement> getAllPlacements() {

        List<Placement> placements =
                new ArrayList<Placement>();

        String sql = "SELECT * FROM placement";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Placement placement =
                        new Placement();

                placement.setPlacementId(
                        rs.getInt("placement_id")
                );

                placement.setStudentId(
                        rs.getInt("student_id")
                );

                placement.setApplicationId(
                        rs.getInt("application_id")
                );

                placement.setJobId(
                        rs.getInt("job_id")
                );

                placement.setPlacementDate(
                        rs.getDate("placement_date")
                );

                placement.setPackageAmount(
                        rs.getString("package")
                );

                placement.setStatus(
                        rs.getString("status")
                );

                placements.add(placement);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return placements;
    }


    // GET PLACEMENT BY ID
    public Placement getPlacementById(int placementId) {

        Placement placement = null;

        String sql =
                "SELECT * FROM placement "
              + "WHERE placement_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, placementId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                placement =
                        new Placement();

                placement.setPlacementId(
                        rs.getInt("placement_id")
                );

                placement.setStudentId(
                        rs.getInt("student_id")
                );

                placement.setApplicationId(
                        rs.getInt("application_id")
                );

                placement.setJobId(
                        rs.getInt("job_id")
                );

                placement.setPlacementDate(
                        rs.getDate("placement_date")
                );

                placement.setPackageAmount(
                        rs.getString("package")
                );

                placement.setStatus(
                        rs.getString("status")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return placement;
    }


    // UPDATE PLACEMENT
    public boolean updatePlacement(Placement placement) {

        String sql =
                "UPDATE placement SET "
              + "student_id = ?, "
              + "application_id = ?, "
              + "job_id = ?, "
              + "placement_date = ?, "
              + "package = ?, "
              + "status = ? "
              + "WHERE placement_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, placement.getStudentId());
            ps.setInt(2, placement.getApplicationId());
            ps.setInt(3, placement.getJobId());
            ps.setDate(4, placement.getPlacementDate());
            ps.setString(5, placement.getPackageAmount());
            ps.setString(6, placement.getStatus());
            ps.setInt(7, placement.getPlacementId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE PLACEMENT
    public boolean deletePlacement(int placementId) {

        String sql =
                "DELETE FROM placement "
              + "WHERE placement_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, placementId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}