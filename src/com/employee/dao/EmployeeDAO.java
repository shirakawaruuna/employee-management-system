package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.model.Employee;
import com.employee.util.DBUtil;

public class EmployeeDAO {

	public List<Employee> findAll() {

		List<Employee> list = new ArrayList<>();

		String sql = "SELECT * FROM employee";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {

			while (rs.next()) {

				Employee emp = new Employee();

				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setAge(rs.getInt("age"));
				emp.setDepartment(rs.getString("department"));
				emp.setEmail(rs.getString("email"));

				list.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Employee login(String id, String pass) {

		Employee emp = null;

		String sql = "SELECT * FROM employee WHERE id = ? AND password = ?";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {

			ps.setString(1, id);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				emp = new Employee();

				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setAge(rs.getInt("age"));
				emp.setDepartment(rs.getString("department"));
				emp.setEmail(rs.getString("email"));
				emp.setPassword(rs.getString("password"));
				emp.setRole(rs.getString("role"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return emp;
	}

	public Employee findById(int id) {
		Employee emp = null;

		String sql = "SELECT * FROM employee WHERE id = ?";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				emp = new Employee();

				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setAge(rs.getInt("age"));
				emp.setDepartment(rs.getString("department"));
				emp.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return emp;
	}

	public void update(Employee emp) {

		String sql = "UPDATE employee SET name = ?, age = ?, department = ?, email = ? WHERE id = ?";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {

			ps.setString(1, emp.getName());
			ps.setInt(2, emp.getAge());
			ps.setString(3, emp.getDepartment());
			ps.setString(4, emp.getEmail());
			ps.setInt(5, emp.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		String sql = "DELETE FROM employee WHERE id = ?";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {

			ps.setInt(1, id);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void insert(Employee emp) {
		String sql = "INSERT INTO employee (name, age, department, email, password) VALUES (?, ?, ?, ?, ?)";

		try (
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {

			ps.setString(1, emp.getName());
			ps.setInt(2, emp.getAge());
			ps.setString(3, emp.getDepartment());
			ps.setString(4, emp.getEmail());
			ps.setString(5, emp.getPassword());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
