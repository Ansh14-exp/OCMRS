package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Department;
import com.ocmrs.util.DBConnection;

public class DepartmentDAO {

    // Add Department
    public boolean addDepartment(Department department) {

        String sql = "INSERT INTO department "
                   + "(college_id, department_name, hod_name) "
                   + "VALUES (?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, department.getCollegeId());
            ps.setString(2, department.getDepartmentName());
            ps.setString(3, department.getHodName());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // View All Departments
    public List<Department> getAllDepartments() {

        List<Department> departments =
                new ArrayList<Department>();

        String sql = "SELECT * FROM department";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Department department =
                        new Department();

                department.setDepartmentId(
                        rs.getInt("department_id"));

                department.setCollegeId(
                        rs.getInt("college_id"));

                department.setDepartmentName(
                        rs.getString("department_name"));

                department.setHodName(
                        rs.getString("hod_name"));

                departments.add(department);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return departments;
    }


    // Delete Department
    public boolean deleteDepartment(int departmentId) {

        String sql =
                "DELETE FROM department WHERE department_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, departmentId);

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
 // Get Department by ID
    public Department getDepartmentById(int departmentId) {

        Department department = null;

        String sql =
                "SELECT * FROM department WHERE department_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, departmentId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                department = new Department();

                department.setDepartmentId(
                        rs.getInt("department_id"));

                department.setCollegeId(
                        rs.getInt("college_id"));

                department.setDepartmentName(
                        rs.getString("department_name"));

                department.setHodName(
                        rs.getString("hod_name"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return department;
    }
 // Update Department
    public boolean updateDepartment(Department department) {

        String sql = "UPDATE department SET college_id = ?, "
                   + "department_name = ?, hod_name = ? "
                   + "WHERE department_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, department.getCollegeId());
            ps.setString(2, department.getDepartmentName());
            ps.setString(3, department.getHodName());
            ps.setInt(4, department.getDepartmentId());

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}
