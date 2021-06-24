package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import entity.Student;
import entity.User;
import utils.JDBCUtils;

public class UserDao {
	public User login(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User existUser = queryRunner.query("select * from user where username = ? and password = ?",
				new BeanHandler<User>(User.class), user.getUsername(), user.getPassword());
		
		return existUser;
	}
	public Student getStu(String number) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		Student existStu = queryRunner.query("select * from student where number = ? ",
				new BeanHandler<Student>(Student.class),number);
		
		return existStu;
	}
}
