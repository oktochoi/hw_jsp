package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

    private static final String URL = "jdbc:mariadb://walab.handong.edu:3306/W25_22400742";
    private static final String USER = "W25_22400742";
    private static final String PW = "iWie8s";

    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PW);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
