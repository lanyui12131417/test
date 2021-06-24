package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.User;
import utils.JDBCUtils;

public class AdminUserDao {
	public static  List<User> findAll() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<User> list = queryRunner.query(
				"select * from user",
				new BeanListHandler<User>(User.class));
		return list;
	}
	public void del(String username) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("delete  from user where username = ? ", username);
	}
}
