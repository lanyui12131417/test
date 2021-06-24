package entity;

public class News {
	public String newsNo;
	public String newsTitle;
	public String newsBody;
	
	public String getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(String newsNo) {
		this.newsNo = newsNo;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsBody() {
		return newsBody;
	}
	public void setNewsBody(String newsBody) {
		this.newsBody = newsBody;
	}
	
	@Override
	public String toString() {
		return "News [newsNo=" + newsNo + ", newsTitle=" + newsTitle + ", newsBody=" + newsBody + "]";
	}
	
}
