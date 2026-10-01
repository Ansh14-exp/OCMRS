package com.ocmrs.model;

public class Exam {

    private int examId;
    private int subjectId;
    private String examType;
    private String examDate;
    private int totalMarks;

    // Default constructor
    public Exam() {
    }

    // Parameterized constructor
    public Exam(int examId, int subjectId, String examType,String examDate, int totalMarks) {
        this.examId = examId;
        this.subjectId = subjectId;
        this.examType = examType;
        this.examDate = examDate;
        this.totalMarks = totalMarks;
    }

    // Getters and Setters

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
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

    public int getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }
}