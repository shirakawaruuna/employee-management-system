package com.employee.test;

import java.sql.Connection;

import com.employee.util.DBUtil;

public class TestConnection {

    public static void main(String[] args) {

        try {

            Connection con = DBUtil.getConnection();

            System.out.println("接続成功！");

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}