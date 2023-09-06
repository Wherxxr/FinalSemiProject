package member.model.vo;

public class Attachment {
   
   private int fileNo;
   private String refNo;
   private String originName;
   private String changeName;
   private String filePath;
   private String uploadDate;
   private int fileLevel;
   private String staus;

   public Attachment() {}

   public Attachment(int fileNo, String refNo, String originName, String changeName, String filePath, String uploadDate,
         int fileLevel, String staus) {
      super();
      this.fileNo = fileNo;
      this.refNo = refNo;
      this.originName = originName;
      this.changeName = changeName;
      this.filePath = filePath;
      this.uploadDate = uploadDate;
      this.fileLevel = fileLevel;
      this.staus = staus;
   }
   public Attachment(int fileNo, String originName, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}
   public int getFileNo() {
      return fileNo;
   }

   public void setFileNo(int fileNo) {
      this.fileNo = fileNo;
   }

   public String getRefNo() {
      return refNo;
   }

   public void setRefNo(String refNo) {
      this.refNo = refNo;
   }

   public String getOriginName() {
      return originName;
   }

   public void setOriginName(String originName) {
      this.originName = originName;
   }

   public String getChangeName() {
      return changeName;
   }

   public void setChangeName(String changeName) {
      this.changeName = changeName;
   }

   public String getFilePath() {
      return filePath;
   }

   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }

   public String getUploadDate() {
      return uploadDate;
   }

   public void setUploadDate(String uploadDate) {
      this.uploadDate = uploadDate;
   }

   public int getFileLevel() {
      return fileLevel;
   }

   public void setFileLevel(int fileLevel) {
      this.fileLevel = fileLevel;
   }

   public String getStaus() {
      return staus;
   }

   public void setStaus(String staus) {
      this.staus = staus;
   }

   @Override
   public String toString() {
      return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
            + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
            + ", staus=" + staus + "]";
   }
   
}