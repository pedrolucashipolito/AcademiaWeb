package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private static Connection connection = null;

    public static Connection getConnection() {

        if (connection != null) {
            return connection;
        }

        try {
            String user = "postgres";
            String password = "123456";

            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/bdueg202601",
                user,
                password
            );

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}