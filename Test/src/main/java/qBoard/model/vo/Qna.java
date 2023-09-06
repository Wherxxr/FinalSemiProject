package qBoard.model.vo;

public class Qna {
	private int qNo;
	private String qTitle;
	private String qContent;
	private int qWriter;
	private String qDate;
	private int count;
	private String status;
	
	public Qna() {}
	

	public Qna(int qNo, String qTitle, String qContent, String qDate) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
	}
	




	public Qna(int qNo, String qTitle, String qContent, String qDate, int count) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.count = count;
	}


	public Qna(int qNo, String qTitle, String qContent, String qDate, int count, String status) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.count = count;
		this.status = status;
	}


	public Qna(int qNo, String qTitle, String qContent, int qWriter, String qDate, String status) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qWriter = qWriter;
		this.qDate = qDate;
		this.status = status;
	}



	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public int getqWriter() {
		return qWriter;
	}

	public void setqWriter(int qWriter) {
		this.qWriter = qWriter;
	}

	public String getqDate() {
		return qDate;
	}

	public void setqDate(String qDate) {
		this.qDate = qDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qWriter=" + qWriter + ", qDate="
				+ qDate + ", count=" + count + ", status=" + status + "]";
	}

	
}
