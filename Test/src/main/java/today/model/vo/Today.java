package today.model.vo;

public class Today {
	private String todayNo;
	private String todayTitle;
	private String todayContent;
	private String todayWriter;
	private String todayTip;
	private String hashtag;
	private String todayName;
	private String todayDate;
	private String todayTime;
	private String todayCourse;
	private String lev;
	private String todayVehicle;
	private String todayType;
	private int count;
	private int countLike;
	private String titleImg;
	private String createDate;
	private String profileImg;
	private int memCount;
	private int replyCount;
	private int userNo;
	private String member;
	private int fileLevel;
	private String weekClimb;
	
	
	public Today() {
	}

	public Today(String todayNo, String todayTitle, String todayContent, String todayTip, String hashtag,
			String todayName, String todayDate, String todayTime, String todayCourse, String lev, String todayVehicle,
			String todayWriter, String todayType, int count, int countLike, String titleImg, String createDate) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayTip = todayTip;
		this.hashtag = hashtag;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.todayWriter = todayWriter;
		this.todayType = todayType;
		this.count = count;
		this.countLike = countLike;
		this.titleImg = titleImg;
		this.createDate = createDate;
	}

	public Today(String todayNo, String todayTitle, String todayContent, String todayWriter, String todayTip,
			String hashtag, String todayName, String todayDate, String todayTime, String todayCourse, String lev,
			String todayVehicle, String createDate, int count) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.todayTip = todayTip;
		this.hashtag = hashtag;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.createDate = createDate;
		this.count = count;
	}

	public Today(String todayNo, String todayTitle, String todayContent, String todayWriter, String todayTip,
			String hashtag, String todayName, String todayDate, String todayTime, String todayCourse, String lev,
			String todayVehicle, String createDate, int count, int replyCount) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.todayTip = todayTip;
		this.hashtag = hashtag;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.createDate = createDate;
		this.count = count;
		this.replyCount = replyCount;
	}

	public Today(String todayNo, String todayTitle, String todayContent, String todayWriter, int count) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.count = count;
	}

	public Today(String todayNo, String todayTitle, String todayContent, int count, String titleImg, int countLike) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.count = count;
		this.titleImg = titleImg;
		this.countLike = countLike;
	}

	public Today(String todayNo, String todayTitle, String todayName, String todayTime, String todayWriter,
			int memCount, String lev, String todayDate) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayName = todayName;
		this.todayTime = todayTime;
		this.todayWriter = todayWriter;
		this.memCount = memCount;
		this.lev = lev;
		this.todayDate = todayDate;
	}

	public Today(String todayNo, String todayTitle, String todayContent, String todayName, String todayDate,
			String todayTime, String todayCourse, String lev, String todayVehicle, String todayWriter,
			String createDate, int memCount, int replyCount, int userNo) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.todayWriter = todayWriter;
		this.createDate = createDate;
		this.memCount = memCount;
		this.replyCount = replyCount;
		this.userNo = userNo;
	}

	public Today(String todayTitle, String todayContent, String todayName, String todayDate, String todayTime,
			String todayCourse, String lev, String todayVehicle, String todayWriter) {
		super();
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.todayWriter = todayWriter;
	}

	public Today(int userNo,String todayNo, String todayTitle, String todayContent, String todayWriter,String todayTip, String hashtag,
			String todayName, String todayDate, String todayTime, String todayCourse, String lev, String todayVehicle,
			 int count, String createDate, int replyCount,int countLike) {
		super();
		this.userNo = userNo;
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.todayTip = todayTip;
		this.hashtag = hashtag;
		this.todayName = todayName;
		this.todayDate = todayDate;
		this.todayTime = todayTime;
		this.todayCourse = todayCourse;
		this.lev = lev;
		this.todayVehicle = todayVehicle;
		this.count = count;
		this.createDate = createDate;
		this.replyCount = replyCount;
		this.countLike = countLike;
	}

	

	public Today(String todayNo, String todayTitle, String todayContent, String todayWriter,
			String createDate, String profileImg, String titleImg) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.createDate = createDate;
		this.profileImg = profileImg;
		this.titleImg = titleImg;
	}
	
	
	public Today(String todayNo, String todayTitle, String todayContent, String todayWriter,String createDate, String profileImg, 
			String titleImg, int count, int countLike, int fileLevel) {
		super();
		this.todayNo = todayNo;
		this.todayTitle = todayTitle;
		this.todayContent = todayContent;
		this.todayWriter = todayWriter;
		this.createDate = createDate;
		this.profileImg = profileImg;
		this.titleImg = titleImg;
		this.count = count;
		this.countLike = countLike;
		this.fileLevel = fileLevel;
	}
	
	public Today(String todayNo, String weekClimb) {
		super();
		this.todayNo = todayNo;
		this.weekClimb = weekClimb;
	}

	public String getTodayNo() {
		return todayNo;
	}

	public void setTodayNo(String todayNo) {
		this.todayNo = todayNo;
	}

	public String getTodayTitle() {
		return todayTitle;
	}

	public void setTodayTitle(String todayTitle) {
		this.todayTitle = todayTitle;
	}

	public String getTodayContent() {
		return todayContent;
	}

	public void setTodayContent(String todayContent) {
		this.todayContent = todayContent;
	}

	public String getTodayTip() {
		return todayTip;
	}

	public void setTodayTip(String todayTip) {
		this.todayTip = todayTip;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getTodayName() {
		return todayName;
	}

	public void setTodayName(String todayName) {
		this.todayName = todayName;
	}

	public String getTodayDate() {
		return todayDate;
	}

	public void setTodayDate(String todayDate) {
		this.todayDate = todayDate;
	}

	public String getTodayTime() {
		return todayTime;
	}

	public void setTodayTime(String todayTime) {
		this.todayTime = todayTime;
	}

	public String getTodayCourse() {
		return todayCourse;
	}

	public void setTodayCourse(String todayCourse) {
		this.todayCourse = todayCourse;
	}

	public String getLev() {
		return lev;
	}

	public void setLev(String lev) {
		this.lev = lev;
	}

	public String getTodayVehicle() {
		return todayVehicle;
	}

	public void setTodayVehicle(String todayVehicle) {
		this.todayVehicle = todayVehicle;
	}

	public String getTodayWriter() {
		return todayWriter;
	}

	public void setTodayWriter(String todayWriter) {
		this.todayWriter = todayWriter;
	}

	public String getTodayType() {
		return todayType;
	}

	public void setTodayType(String todayType) {
		this.todayType = todayType;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getMemCount() {
		return memCount;
	}

	public void setMemCount(int memCount) {
		this.memCount = memCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "Today [todayNo=" + todayNo + ", todayTitle=" + todayTitle + ", todayContent=" + todayContent
				+ ", todayWriter=" + todayWriter + ", todayTip=" + todayTip + ", hashtag=" + hashtag + ", todayName="
				+ todayName + ", todayDate=" + todayDate + ", todayTime=" + todayTime + ", todayCourse=" + todayCourse
				+ ", lev=" + lev + ", todayVehicle=" + todayVehicle + ", todayType=" + todayType + ", count=" + count
				+ ", countLike=" + countLike + ", titleImg=" + titleImg + ", createDate=" + createDate + ", profileImg="
				+ profileImg + ", memCount=" + memCount + ", replyCount=" + replyCount + ", userNo=" + userNo
				+ ", member=" + member + ", fileLevel=" + fileLevel + "]";
	}

	public String getWeekClimb() {
		return weekClimb;
	}

	public void setWeekClimb(String weekClimb) {
		this.weekClimb = weekClimb;
	}
	

}