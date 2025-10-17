package net.java_school.commons;

public enum WebContants {

	USER_KEY("user"),
	UPLOAD_PATH("/var/lib/tomcat10/logs/upload/");
	
	private String value;
	
	WebContants(String value) {
		this.value = value;
	}
	
	public String value() {
		return value;
	}
}