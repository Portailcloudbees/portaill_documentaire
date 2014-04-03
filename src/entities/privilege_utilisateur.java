package entities;

public class privilege_utilisateur {
	private boolean uploadFile;
	private boolean deleteFile;
	private boolean sendFile;
	private boolean downloadFile;
	private boolean sendSms;
	private boolean sendEmail;
	private boolean viewStat;
	private boolean answerNotif;
	private boolean export;
	
	
	
    public privilege_utilisateur(){
		
	}

	public boolean isUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(boolean uploadFile) {
		this.uploadFile = uploadFile;
	}
	public boolean isDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(boolean removeFile) {
		this.deleteFile = removeFile;
	}
	public boolean isSendFile() {
		return sendFile;
	}
	public void setSendFile(boolean sendFile) {
		this.sendFile = sendFile;
	}
	public boolean isDownloadFile() {
		return downloadFile;
	}
	public void setDownloadFile(boolean downloadFile) {
		this.downloadFile = downloadFile;
	}
	public boolean isSendSms() {
		return sendSms;
	}
	public void setSendSms(boolean sendSms) {
		this.sendSms = sendSms;
	}
	public boolean isSendEmail() {
		return sendEmail;
	}
	public void setSendEmail(boolean sendEmail) {
		this.sendEmail = sendEmail;
	}
	public boolean isExport() {
		return export;
	}
	public void setExport(boolean export) {
		this.export = export;
	}
	public boolean isViewStat() {
		return viewStat;
	}
	public void setViewStat(boolean viewStat) {
		this.viewStat = viewStat;
	}
	public boolean isAnswerNotif() {
		return answerNotif;
	}
	public void setAnswerNotif(boolean answerNotif) {
		this.answerNotif = answerNotif;
	}
	
		
}
