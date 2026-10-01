package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Placement;
import com.ocmrs.util.DBConnection;

public class PlacementDAO {

    // =====================================================
    // GET ALL PLACEMENTS
    // =====================================================

    public List<Placement> getAllPlacements() {

        List<Placement> placements =
                new ArrayList<>();

        String sql =
                "SELECT p.placement_id, "
              + "p.student_id, "
              + "p.application_id, "
              + "p.job_id, "
              + "p.placement_date, "
              + "p.package, "
              + "p.status, "
              + "s.name AS student_name, "
              + "s.email AS student_email, "
              + "s.phone AS student_phone, "
              + "j.title AS job_title, "
              + "c.company_name AS company_name "
              + "FROM placement p "
              + "INNER JOIN student s "
              + "ON p.student_id = s.student_id "
              + "INNER JOIN job j "
              + "ON p.job_id = j.job_id "
              + "INNER JOIN company c "
              + "ON j.company_id = c.company_id "
              + "ORDER BY p.placement_id DESC";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql);
             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                Placement placement =
                        createPlacementFromResultSet(rs);

                placements.add(placement);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return placements;
    }


    // =====================================================
    // GET PLACEMENT BY ID
    // =====================================================

    public Placement getPlacementById(
            int placementId) {

        String sql =
                "SELECT p.placement_id, "
              + "p.student_id, "
              + "p.application_id, "
              + "p.job_id, "
              + "p.placement_date, "
              + "p.package, "
              + "p.status, "
              + "s.name AS student_name, "
              + "s.email AS student_email, "
              + "s.phone AS student_phone, "
              + "j.title AS job_title, "
              + "c.company_name AS company_name "
              + "FROM placement p "
              + "INNER JOIN student s "
              + "ON p.student_id = s.student_id "
              + "INNER JOIN job j "
              + "ON p.job_id = j.job_id "
              + "INNER JOIN company c "
              + "ON j.company_id = c.company_id "
              + "WHERE p.placement_id = ?";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, placementId);

            try (ResultSet rs =
                         ps.executeQuery()) {

                if (rs.next()) {

                    return createPlacementFromResultSet(rs);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // GET PLACEMENTS BY STUDENT ID
    // =====================================================

    public List<Placement> getPlacementsByStudentId(
            int studentId) {

        List<Placement> placements =
                new ArrayList<>();

        String sql =
                "SELECT p.placement_id, "
              + "p.student_id, "
              + "p.application_id, "
              + "p.job_id, "
              + "p.placement_date, "
              + "p.package, "
              + "p.status, "
              + "s.name AS student_name, "
              + "s.email AS student_email, "
              + "s.phone AS student_phone, "
              + "j.title AS job_title, "
              + "c.company_name AS company_name "
              + "FROM placement p "
              + "INNER JOIN student s "
              + "ON p.student_id = s.student_id "
              + "INNER JOIN job j "
              + "ON p.job_id = j.job_id "
              + "INNER JOIN company c "
              + "ON j.company_id = c.company_id "
              + "WHERE p.student_id = ? "
              + "ORDER BY p.placement_id DESC";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs =
                         ps.executeQuery()) {

                while (rs.next()) {

                    Placement placement =
                            createPlacementFromResultSet(rs);

                    placements.add(placement);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return placements;
    }


    // =====================================================
    // GET PLACEMENTS BY COMPANY ID
    // =====================================================

    public List<Placement> getPlacementsByCompanyId(
            int companyId) {

        List<Placement> placements =
                new ArrayList<>();

        String sql =
                "SELECT p.placement_id, "
              + "p.student_id, "
              + "p.application_id, "
              + "p.job_id, "
              + "p.placement_date, "
              + "p.package, "
              + "p.status, "
              + "s.name AS student_name, "
              + "s.email AS student_email, "
              + "s.phone AS student_phone, "
              + "j.title AS job_title, "
              + "c.company_name AS company_name "
              + "FROM placement p "
              + "INNER JOIN student s "
              + "ON p.student_id = s.student_id "
              + "INNER JOIN job j "
              + "ON p.job_id = j.job_id "
              + "INNER JOIN company c "
              + "ON j.company_id = c.company_id "
              + "WHERE j.company_id = ? "
              + "ORDER BY p.placement_id DESC";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, companyId);

            try (ResultSet rs =
                         ps.executeQuery()) {

                while (rs.next()) {

                    Placement placement =
                            createPlacementFromResultSet(rs);

                    placements.add(placement);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return placements;
    }


    // =====================================================
    // ADD PLACEMENT
    // =====================================================

    public boolean addPlacement(
            Placement placement) {

        String sql =
                "INSERT INTO placement "
              + "(student_id, application_id, job_id, "
              + "placement_date, package, status) "
              + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    placement.getStudentId()
            );

            ps.setInt(
                    2,
                    placement.getApplicationId()
            );

            ps.setInt(
                    3,
                    placement.getJobId()
            );

            if (placement.getPlacementDate() != null
                    && !placement.getPlacementDate()
                    .trim().isEmpty()) {

                ps.setDate(
                        4,
                        java.sql.Date.valueOf(
                                placement.getPlacementDate()
                        )
                );

            } else {

                ps.setDate(4, null);
            }

            ps.setString(
                    5,
                    placement.getPackageAmount()
            );

            ps.setString(
                    6,
                    placement.getStatus()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // UPDATE PLACEMENT
    // =====================================================

    public boolean updatePlacement(
            Placement placement) {

        String sql =
                "UPDATE placement SET "
              + "student_id = ?, "
              + "application_id = ?, "
              + "job_id = ?, "
              + "placement_date = ?, "
              + "package = ?, "
              + "status = ? "
              + "WHERE placement_id = ?";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    placement.getStudentId()
            );

            ps.setInt(
                    2,
                    placement.getApplicationId()
            );

            ps.setInt(
                    3,
                    placement.getJobId()
            );

            if (placement.getPlacementDate() != null
                    && !placement.getPlacementDate()
                    .trim().isEmpty()) {

                ps.setDate(
                        4,
                        java.sql.Date.valueOf(
                                placement.getPlacementDate()
                        )
                );

            } else {

                ps.setDate(4, null);
            }

            ps.setString(
                    5,
                    placement.getPackageAmount()
            );

            ps.setString(
                    6,
                    placement.getStatus()
            );

            ps.setInt(
                    7,
                    placement.getPlacementId()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // DELETE PLACEMENT
    // =====================================================

    public boolean deletePlacement(
            int placementId) {

        String sql =
                "DELETE FROM placement "
              + "WHERE placement_id = ?";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, placementId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // CREATE PLACEMENT FROM RESULT SET
    // =====================================================

    private Placement createPlacementFromResultSet(
            ResultSet rs) throws Exception {

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

        if (rs.getDate("placement_date") != null) {

            placement.setPlacementDate(
                    rs.getDate("placement_date")
                            .toString()
            );
        }

        placement.setPackageAmount(
                rs.getString("package")
        );

        placement.setStatus(
                rs.getString("status")
        );

        placement.setStudentName(
                rs.getString("student_name")
        );

        placement.setStudentEmail(
                rs.getString("student_email")
        );

        placement.setStudentPhone(
                rs.getString("student_phone")
        );

        placement.setJobTitle(
                rs.getString("job_title")
        );

        placement.setCompanyName(
                rs.getString("company_name")
        );

        return placement;
    }
}