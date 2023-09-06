package qBoard.model.vo;

public class Qreply {
	private int qReplyNo;
	private String qReplyContent;
	private int refQNo;
	private int qReplyWriter;
	private String createDate;
	private String status;
	private String userId;
	
	public Qreply(){}
	
	

	public Qreply(int qReplyNo, String qReplyContent, int qReplyWriter, String createDate) {
		super();
		this.qReplyNo = qReplyNo;
		this.qReplyContent = qReplyContent;
		this.qReplyWriter = qReplyWriter;
		this.createDate = createDate;
	}



	public Qreply(int qReplyNo, String qReplyContent, int qReplyWriter, String createDate, String status,
			int refQNo) {
		super();
		this.qReplyNo = qReplyNo;
		this.qReplyContent = qReplyContent;
		this.qReplyWriter = qReplyWriter;
		this.createDate = createDate;
		this.status = status;
		this.refQNo = refQNo;
	}

	



	public Qreply(int qReplyNo, String qReplyContent, String userId, String createDate) {
		super();
		this.qReplyNo = qReplyNo;
		this.qReplyContent = qReplyContent;
		this.userId = userId;
		this.createDate = createDate;
	}



	public int getqReplyNo() {
		return qReplyNo;
	}

	public void setqReplyNo(int qReplyNo) {
		this.qReplyNo = qReplyNo;
	}

	public String getqReplyContent() {
		return qReplyContent;
	}

	public void setqReplyContent(String qReplyContent) {
		this.qReplyContent = qReplyContent;
	}

	public int getqReplyWriter() {
		return qReplyWriter;
	}

	public void setqReplyWriter(int qReplyWriter) {
		this.qReplyWriter = qReplyWriter;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRefQNo() {
		return refQNo;
	}

	public void setRefQNo(int refQNo) {
		this.refQNo = refQNo;
	}

	@Override
	public String toString() {
		return "Qreply [qReplyNo=" + qReplyNo + ", qReplyContent=" + qReplyContent + ", qReplyWriter=" + qReplyWriter
				+ ", createDate=" + createDate + ", status=" + status + ", refQNo=" + refQNo + "]";
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}
