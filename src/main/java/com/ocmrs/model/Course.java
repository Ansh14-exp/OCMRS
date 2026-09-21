package com.ocmrs.model;

public class Course {

    private int courseId;
    private int departmentId;
    private String courseName;
    private String duration;
    private String level;

    public Course() {
    }

    public Course(int courseId, int departmentId,
                  String courseName, String duration,
                  String level) {

        this.courseId = courseId;
        this.departmentId = departmentId;
        this.courseName = courseName;
        this.duration = duration;
        this.level = level;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}