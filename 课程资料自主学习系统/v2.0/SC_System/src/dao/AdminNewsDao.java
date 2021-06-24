package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.News;
import utils.JDBCUtils;

public class AdminNewsDao {
	public static  List<News> findAll() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = queryRunner.query(
				"select * from news",
				new BeanListHandler<News>(News.class));
		return list;
	}
	
	public void delNews(String newsNo) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("delete  from news where newsNo = ? ", newsNo);
	}
}
