package com.ocmrs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ocmrs.model.Student;
import com.ocmrs.util.DBConnection;

public class StudentDao {

    // Add Student
    public boolean addStudent(Student student) {

        String sql = "INSERT INTO student " +
                     "(college_id, course_id, name, email, phone, address, dob, gender) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, student.getCollegeId());
            ps.setInt(2, student.getCourseId());
            ps.setString(3, student.getName());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhone());
            ps.setString(6, student.getAddress());
            ps.setString(7, student.getDob());
            ps.setString(8, student.getGender());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get All Students
    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<Student>();

        String sql = "SELECT * FROM student";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student student = new Student();

                student.setStudentId(rs.getInt("student_id"));
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

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }


    // Delete Student
    public boolean deleteStudent(int studentId) {

        String sql = "DELETE FROM student WHERE student_id = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
 // Update Student
    public boolean updateStudent(Student student) {

        String sql = "UPDATE student SET college_id = ?, course_id = ?, "
                   + "name = ?, email = ?, phone = ?, address = ?, "
                   + "dob = ?, gender = ? WHERE student_id = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, student.getCollegeId());
            ps.setInt(2, student.getCourseId());
            ps.setString(3, student.getName());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhone());
            ps.setString(6, student.getAddress());
            ps.setString(7, student.getDob());
            ps.setString(8, student.getGender());
            ps.setInt(9, student.getStudentId());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
 // Get Student By ID
    public Student getStudentById(int studentId) {

        Student student = null;

        String sql = "SELECT * FROM student WHERE student_id = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setCollegeId(rs.getInt("college_id"));
                student.setCourseId(rs.getInt("course_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setAddress(rs.getString("address"));
                student.setDob(rs.getString("dob"));
                student.setGender(rs.getString("gender"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return student;
    }
}