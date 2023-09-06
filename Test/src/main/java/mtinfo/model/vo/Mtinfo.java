package mtinfo.model.vo;

public class Mtinfo {
	private String mtName;
	private String mtAddress;
	private String mtPhone;
	private String mtPage;
	private String mtCourse;
	private String mtVehicle;
	private String mtDetailInfo;
	private String mtDetailAddress;
	private String mtWt;
	
	public Mtinfo() {}

	public Mtinfo(String mtName, String mtAddress, String mtPhone, String mtPage, String mtCourse, String mtVehicle,
			String mtDetailInfo, String mtDetailAddress, String mtWt) {
		super();
		this.mtName = mtName;
		this.mtAddress = mtAddress;
		this.mtPhone = mtPhone;
		this.mtPage = mtPage;
		this.mtCourse = mtCourse;
		this.mtVehicle = mtVehicle;
		this.mtDetailInfo = mtDetailInfo;
		this.mtDetailAddress = mtDetailAddress;
		this.mtWt = mtWt;
	}

	public Mtinfo(String mtName, String mtDetailAddress) {
		super();
		this.mtName = mtName;
		this.mtDetailAddress = mtDetailAddress;
	}

	public String getMtName() {
		return mtName;
	}

	public void setMtName(String mtName) {
		this.mtName = mtName;
	}

	public String getMtAddress() {
		return mtAddress;
	}

	public void setMtAddress(String mtAddress) {
		this.mtAddress = mtAddress;
	}

	public String getMtPhone() {
		return mtPhone;
	}

	public void setMtPhone(String mtPhone) {
		this.mtPhone = mtPhone;
	}

	public String getMtPage() {
		return mtPage;
	}

	public void setMtPage(String mtPage) {
		this.mtPage = mtPage;
	}

	public String getMtCourse() {
		return mtCourse;
	}

	public void setMtCourse(String mtCourse) {
		this.mtCourse = mtCourse;
	}

	public String getMtVehicle() {
		return mtVehicle;
	}

	public void setMtVehicle(String mtVehicle) {
		this.mtVehicle = mtVehicle;
	}

	public String getMtDetailInfo() {
		return mtDetailInfo;
	}

	public void setMtDetailInfo(String mtDetailInfo) {
		this.mtDetailInfo = mtDetailInfo;
	}

	public String getMtDetailAddress() {
		return mtDetailAddress;
	}

	public void setMtDetailAddress(String mtDetailAddress) {
		this.mtDetailAddress = mtDetailAddress;
	}

	public String getMtWt() {
		return mtWt;
	}

	public void setMtWt(String mtWt) {
		this.mtWt = mtWt;
	}

	@Override
	public String toString() {
		return "Mtinfo [mtName=" + mtName + ", mtAddress=" + mtAddress + ", mtPhone=" + mtPhone + ", mtPage=" + mtPage
				+ ", mtCourse=" + mtCourse + ", mtVehicle=" + mtVehicle + ", mtDetailInfo=" + mtDetailInfo
				+ ", mtDetailAddress=" + mtDetailAddress + ", mtWt=" + mtWt + "]";
	}

	

	
	
	
}
