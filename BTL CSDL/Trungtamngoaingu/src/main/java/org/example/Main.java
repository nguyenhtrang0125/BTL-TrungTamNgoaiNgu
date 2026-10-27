package org.example;

import java.sql.*;

public class Main {

    public static void main(String[] args) {

        try {

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/trungtamngoaingu",
                    "root",
                    "123456"
            );

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
                    "SELECT * FROM hoc_vien"
            );

            while (rs.next()) {

                System.out.println(
                        rs.getString("ma_hv")
                                + " - "
                                + rs.getString("ho_ten")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}