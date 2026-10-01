package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Student;
import com.ocmrs.util.DBConnection;

public class StudentDAO {

    // =========================================
    // GET STUDENT BY STUDENT ID
    // Used by Enrollment and other modules
    // =========================================
    public Student getStudentById(int studentId) {

        Student student = null;

        String sql = "SELECT * FROM student WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    student = new Student();

                    student.setStudentId(rs.getInt("student_id"));
                    student.setUserId(rs.getInt("user_id"));
                    student.setCollegeId(rs.getInt("college_id"));
                    student.setCourseId(rs.getInt("course_id"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setPhone(rs.getString("phone"));
                    student.setAddress(rs.getString("address"));
                    student.setDob(rs.getString("dob"));
                    student.setGender(rs.getString("gender"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

 // GET STUDENTS BY DEPARTMENT ID
    public List<Student> getStudentsByDepartmentId(int departmentId) {

        List<Student> studentList = new ArrayList<>();

        String sql =
                "SELECT s.student_id, s.user_id, s.college_id, "
              + "s.course_id, s.name, s.email, s.phone, "
              + "s.address, s.dob, s.gender "
              + "FROM student s "
              + "JOIN course c ON s.course_id = c.course_id "
              + "WHERE c.department_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, departmentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Student student = new Student();

                    student.setStudentId(
                        rs.getInt("student_id")
                    );

                    student.setUserId(
                        rs.getInt("user_id")
                    );

                    student.setCollegeId(
                        rs.getInt("college_id")
                    );

                    student.setCourseId(
                        rs.getInt("course_id")
                    );

                    student.setName(
                        rs.getString("name")
                    );

                    student.setEmail(
                        rs.getString("email")
                    );

                    student.setPhone(
                        rs.getString("phone")
                    );

                    student.setAddress(
                        rs.getString("address")
                    );

                    student.setDob(
                        rs.getString("dob")
                    );

                    student.setGender(
                        rs.getString("gender")
                    );

                    studentList.add(student);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentList;
    }
    
    // =========================================
    // GET STUDENT BY USER ID
    // Used by StudentServlet / Profile
    // =========================================
    public Student getStudentByUserId(int userId) {

        Student student = null;

        String sql = "SELECT * FROM student WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    student = new Student();

                    student.setStudentId(rs.getInt("student_id"));
                    student.setUserId(rs.getInt("user_id"));
                    student.setCollegeId(rs.getInt("college_id"));
                    student.setCourseId(rs.getInt("course_id"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setPhone(rs.getString("phone"));
                    student.setAddress(rs.getString("address"));
                    student.setDob(rs.getString("dob"));
                    student.setGender(rs.getString("gender"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }


    // =========================================
    // ADD STUDENT
    // =========================================
    public boolean addStudent(Student student) {

        String sql = "INSERT INTO student "
                   + "(user_id, college_id, course_id, name, email, phone, address, dob, gender) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, student.getUserId());
            ps.setInt(2, student.getCollegeId());
            ps.setInt(3, student.getCourseId());
            ps.setString(4, student.getName());
            ps.setString(5, student.getEmail());
            ps.setString(6, student.getPhone());
            ps.setString(7, student.getAddress());
            ps.setString(8, student.getDob());
            ps.setString(9, student.getGender());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================================
    // GET ALL STUDENTS
    // =========================================
    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<Student>();

        String sql = "SELECT * FROM student";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Student student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setUserId(rs.getInt("user_id"));
                student.setCollegeId(rs.getInt("college_id"));
                student.setCourseId(rs.getInt("course_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setAddress(rs.getString("address"));
                student.setDob(rs.getString("dob"));
                student.setGender(rs.getString("gender"));

                students.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }


    // =========================================
    // UPDATE STUDENT
    // =========================================
    public boolean updateStudent(Student student) {

        String sql = "UPDATE student SET "
                   + "user_id = ?, "
                   + "college_id = ?, "
                   + "course_id = ?, "
                   + "name = ?, "
                   + "email = ?, "
                   + "phone = ?, "
                   + "address = ?, "
                   + "dob = ?, "
                   + "gender = ? "
                   + "WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, student.getUserId());
            ps.setInt(2, student.getCollegeId());
            ps.setInt(3, student.getCourseId());
            ps.setString(4, student.getName());
            ps.setString(5, student.getEmail());
            ps.setString(6, student.getPhone());
            ps.setString(7, student.getAddress());
            ps.setString(8, student.getDob());
            ps.setString(9, student.getGender());
            ps.setInt(10, student.getStudentId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================================
    // DELETE STUDENT
    // =========================================
    public boolean deleteStudent(int studentId) {

        String sql = "DELETE FROM student WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}