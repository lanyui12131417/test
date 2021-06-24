package entity;

public class SC {
	public String number;
	public String cname;
	public String semester;
	public String source;
	public String teacher;
	public String flag;
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "SC [number=" + number + ", cname=" + cname + ", semester=" + semester + ", source=" + source
				+ ", teacher=" + teacher + ", flag=" + flag + "]";
	}
	
	
}
