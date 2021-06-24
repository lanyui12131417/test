package utils;

import java.sql.*;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	private static final ComboPooledDataSource dataSource = new ComboPooledDataSource();
 
	/**
	 * 获得连接
	 * 
	 * @throws SQLException
	 */

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	/**
	 * 获得连接池
	 */
	public static DataSource getDataSource() {
		return dataSource;
	}
}
