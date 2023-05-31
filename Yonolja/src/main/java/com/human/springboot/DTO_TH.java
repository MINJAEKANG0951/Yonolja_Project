package com.human.springboot;

import lombok.Data;

@Data
public class DTO_TH {
	// 회원관리
	int USER_SEQ; // 회원번호
	String USER_ID; // 회원 아이디
	String USER_PASSWORD; // 회원 타입
	String USER_NAME;
	String USER_MOBILE;
	String USER_EMAIL;
	String USER_GENDER;
	String USER_TYPE;
	String USER_SIGNINTYPE; // 네이버 카카오 노멀인지 확인
	
	// 회원게시판 관리
	int POST_SEQ;
	int POST_CATEGORY;
	String POST_TITLE;
	String POST_CONTENT;
	String POST_DATE;
	String POST_COMMENT;
	
	
	public int getUSER_SEQ() {
		return USER_SEQ;
	}
	public void setUSER_SEQ(int uSER_SEQ) {
		USER_SEQ = uSER_SEQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}
	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_MOBILE() {
		return USER_MOBILE;
	}
	public void setUSER_MOBILE(String uSER_MOBILE) {
		USER_MOBILE = uSER_MOBILE;
	}
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getUSER_GENDER() {
		return USER_GENDER;
	}
	public void setUSER_GENDER(String uSER_GENDER) {
		USER_GENDER = uSER_GENDER;
	}
	public String getUSER_TYPE() {
		return USER_TYPE;
	}
	public void setUSER_TYPE(String uSER_TYPE) {
		USER_TYPE = uSER_TYPE;
	}
	public String getUSER_SIGNINTYPE() {
		return USER_SIGNINTYPE;
	}
	public void setUSER_SIGNINTYPE(String uSER_SIGNINTYPE) {
		USER_SIGNINTYPE = uSER_SIGNINTYPE;
	}
	public int getPOST_SEQ() {
		return POST_SEQ;
	}
	public void setPOST_SEQ(int pOST_SEQ) {
		POST_SEQ = pOST_SEQ;
	}
	public int getPOST_CATEGORY() {
		return POST_CATEGORY;
	}
	public void setPOST_CATEGORY(int pOST_CATEGORY) {
		POST_CATEGORY = pOST_CATEGORY;
	}
	public String getPOST_TITLE() {
		return POST_TITLE;
	}
	public void setPOST_TITLE(String pOST_TITLE) {
		POST_TITLE = pOST_TITLE;
	}
	public String getPOST_CONTENT() {
		return POST_CONTENT;
	}
	public void setPOST_CONTENT(String pOST_CONTENT) {
		POST_CONTENT = pOST_CONTENT;
	}
	public String getPOST_DATE() {
		return POST_DATE;
	}
	public void setPOST_DATE(String pOST_DATE) {
		POST_DATE = pOST_DATE;
	}
	public String getPOST_COMMENT() {
		return POST_COMMENT;
	}
	public void setPOST_COMMENT(String pOST_COMMENT) {
		POST_COMMENT = pOST_COMMENT;
	}
	
	
	
	
}
