package com.ocmrs.model;

public class Result {

    private int resultId;
    private int examId;
    private int studentId;
    private double marks;
    private String grade;

    // Faculty Result Display Fields
    private String studentName;
    private String subjectName;
    private String examType;
    private String examDate;


    public Result() {
    }


    public Result(int resultId, int examId, int studentId,
                  double marks, String grade) {

        this.resultId = resultId;
        this.examId = examId;
        this.studentId = studentId;
        this.marks = marks;
        this.grade = grade;
    }


    // ==========================================
    // Existing Fields
    // ==========================================

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }


    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }


    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    public double getMarks() {
        return marks;
    }

    public void setMarks(double marks) {
        this.marks = marks;
    }


    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }


    // ==========================================
    // Faculty Result Display Fields
    // ==========================================

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }


    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }


    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }


    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }
}