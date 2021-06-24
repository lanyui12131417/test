package dao;

import java.sql.SQLException;

import javax.rmi.CORBA.Stub;

import org.apache.commons.dbutils.QueryRunner;

import entity.Course;
import entity.News;
import entity.Student;
import entity.Teacher;
import entity.User;
import utils.JDBCUtils;

public class InsertDao {
	
	public void insertUser(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("insert into user values(?,?,?)", user.getUsername(),user.getPassword(),user.getPosition());				
	}
	
	//news
	public void insertNews(News news) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("insert into news (newsTitle,newsBody) values(?,?)",news.getNewsTitle(),news.getNewsBody());				
	}
	
	//Course
	public void insertCourse(Course course) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("insert into course (cname,teacher,semester) values(?,?,?)",course.getCname(),course.getTeacher(),course.getSemester());				
	}
}
