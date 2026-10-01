package com.ocmrs.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/college_management";

    private static final String USER = "root";

    private static final String PASSWORD =
            System.getenv("OCMRS_DB_PASSWORD");

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            if (PASSWORD == null || PASSWORD.isEmpty()) {
                throw new RuntimeException(
                    "OCMRS_DB_PASSWORD environment variable is not set."
                );
            }

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println(
                    "Database Connected Successfully!"
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}