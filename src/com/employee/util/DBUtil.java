package com.employee.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {

    private static String url;
    private static String user;
    private static String password;

    // クラスが最初に使われるとき、一度だけ設定ファイルを読み込む
    static {
        try (InputStream input = DBUtil.class.getClassLoader()
                .getResourceAsStream("db.properties")) {

            Properties prop = new Properties();
            prop.load(input);

            url = prop.getProperty("db.url");
            user = prop.getProperty("db.user");
            password = prop.getProperty("db.password");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}