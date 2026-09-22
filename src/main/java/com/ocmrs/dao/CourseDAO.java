package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Course;
import com.ocmrs.util.DBConnection;

public class CourseDAO {

    // Add Course
    public boolean addCourse(Course course) {

        String sql = "INSERT INTO course "
                   + "(department_id, course_name, duration, level) "
                   + "VALUES (?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, course.getDepartmentId());
            ps.setString(2, course.getCourseName());
            ps.setString(3, course.getDuration());
            ps.setString(4, course.getLevel());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // View All Courses
    public List<Course> getAllCourses() {

        List<Course> courses =
                new ArrayList<Course>();

        String sql = "SELECT * FROM course";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Course course =
                        new Course();

                course.setCourseId(
                        rs.getInt("course_id"));

                course.setDepartmentId(
                        rs.getInt("department_id"));

                course.setCourseName(
                        rs.getString("course_name"));

                course.setDuration(
                        rs.getString("duration"));

                course.setLevel(
                        rs.getString("level"));

                courses.add(course);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return courses;
    }


    // Delete Course
    public boolean deleteCourse(int courseId) {

        String sql =
                "DELETE FROM course WHERE course_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, courseId);

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


    // Get Course by ID
    public Course getCourseById(int courseId) {

        Course course = null;

        String sql =
                "SELECT * FROM course WHERE course_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, courseId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                course =
                        new Course();

                course.setCourseId(
                        rs.getInt("course_id"));

                course.setDepartmentId(
                        rs.getInt("department_id"));

                course.setCourseName(
                        rs.getString("course_name"));

                course.setDuration(
                        rs.getString("duration"));

                course.setLevel(
                        rs.getString("level"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return course;
    }


    // Update Course
    public boolean updateCourse(Course course) {

        String sql =
                "UPDATE course SET "
              + "department_id = ?, "
              + "course_name = ?, "
              + "duration = ?, "
              + "level = ? "
              + "WHERE course_id = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, course.getDepartmentId());
            ps.setString(2, course.getCourseName());
            ps.setString(3, course.getDuration());
            ps.setString(4, course.getLevel());
            ps.setInt(5, course.getCourseId());

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