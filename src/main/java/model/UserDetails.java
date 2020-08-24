package model;

public class UserDetails {
private String userName;
private String email;
private String password;

private String otp;


public String getOtp() {
	return otp;
}
public void setOtp(String otp) {
	this.otp = otp;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public UserDetails(String userName, String email, String password) {
	super();
	this.userName = userName;
	this.email = email;
	this.password = password;
}
public UserDetails() {
	// TODO Auto-generated constructor stub
}

}
