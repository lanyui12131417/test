package entity;

public class Course {
	public String cno;
	public String cname;
	public String teacher;
	public String semester;
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	@Override
	public String toString() {
		return "Course [cno=" + cno + ", cname=" + cname + ", teacher=" + teacher + ", semester=" + semester + "]";
	}
	
}
