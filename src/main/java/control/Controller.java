package control;


import javax.mail.MessagingException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseAccess;
import model.UserDetails;
@WebServlet("/")

public class Controller<HttpServeletRequest> extends HttpServlet 
{
 private static final long serialVerisonUID = 1L;


 public Controller() {
	 super();
 }
 protected void doGet(HttpServletRequest req, HttpServletResponse res)
       throws ServletException, IOException{
	String action=req.getServletPath();
	 switch(action) {
	 case "/login":signIn(req,res);
	 break;
	 case "/signOut":signOut(req,res);
	 break;
	 
	 }
	 
 }
 private void signOut(HttpServletRequest req, HttpServletResponse res) throws IOException {
	// TODO Auto-generated method stub
	 HttpSession httpSession=req.getSession();
		httpSession.removeAttribute("userName");
		httpSession.invalidate();
		res.sendRedirect("SignIn.jsp");
	
}
private void generateOtp(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException, MessagingException {
	String email=req.getParameter("Email");
	String name=req.getParameter("Name");
	String result=DatabaseAccess.checkMail(email);
	System.out.println(result);
	UserDetails userDetails=new UserDetails();
	if(result!=null) {
		
		RequestDispatcher reqDispatcher=req.getRequestDispatcher("SignUp.jsp");
		reqDispatcher.forward(req,res);
		
	}
	else {
		String otp =Mail.sendEmail(email);
		userDetails.setEmail(email);
		userDetails.setPassword(otp);
		userDetails.setUserName(name);
        String flag = DatabaseAccess.signUp(userDetails);
			
		if(flag!=null){
			RequestDispatcher reqDispatcher=req.getRequestDispatcher("SignIn.jsp");
			reqDispatcher.forward(req,res);
		}
		
	}
	
 }
 //
private void signIn(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
	// TODO Auto-generated method stub
	String email=req.getParameter("Email");
	String password=req.getParameter("Password");
	UserDetails userDetails=new UserDetails();
	userDetails.setEmail(email);
	userDetails.setPassword(password);
	String result=DatabaseAccess.signIn(userDetails);
	System.out.println(result);
	if(result!=null) {
		HttpSession httpSession=req.getSession();
		httpSession.setAttribute("userName",result);
		RequestDispatcher reqDispatcher=req.getRequestDispatcher("Home.jsp");
		reqDispatcher.forward(req, res);
	}
	else {
		RequestDispatcher reqDispatcher=req.getRequestDispatcher("SignIn.jsp");
		req.setAttribute("msg","Invalid email or Password");
		reqDispatcher.forward(req, res);
}
	}
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
	doGet(req,res);
	String action=req.getServletPath();
	 switch(action) {
	 case "/generateOtp":try {
			generateOtp(req,res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 break;
	 
	 }
	switch(action) {
	case "/forgotPassword": try {
			forgotPassword(req,res);
		} catch (IOException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	break;
	
	}
	switch(action) {
	case "/resetPassword": resetPassword(req,res);
	}
	
}
private void resetPassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String inputOtp=req.getParameter("otp");
	String Password=req.getParameter("password");
	HttpSession httpSession=req.getSession();
	String otp=(String)httpSession.getAttribute("otp");
	String Email=(String)httpSession.getAttribute("email");
	System.out.println("Emal in ctrl"+Email);
	if(inputOtp.equals(otp)) 
	{	
		
		UserDetails userDetails=new UserDetails();
		userDetails.setEmail(Email);
		userDetails.setPassword(Password);
        String result=DatabaseAccess.resetPassword(userDetails);	
        req.setAttribute("msg","pasisword reseted sucessfully..!");
		RequestDispatcher dispatcher=req.getRequestDispatcher("SignIn.jsp");
		dispatcher.forward(req, res);
        
	}
	else 
	{
		System.out.println("No");
		req.setAttribute("msg", "Invalid OTP");
		RequestDispatcher dispatcher=req.getRequestDispatcher("reset.jsp");
		dispatcher.forward(req, res);
		
	}
	

}
	

private void forgotPassword(HttpServletRequest req, HttpServletResponse res) throws IOException, MessagingException, ServletException {
	// TODO Auto-generated method tub
    String Email=req.getParameter("Email");
    String result=DatabaseAccess.checkMail(Email);
    
    if(result!=null) {
    	String otp=Mail.sendEmail(Email);
    	if(otp!=null) {
    		HttpSession httpSession=req.getSession();
    		httpSession.setAttribute("otp",otp);
    		httpSession.setAttribute("email",Email);
    		RequestDispatcher requestDispatcher=req.getRequestDispatcher("reset.jsp");
    		requestDispatcher.forward(req, res);
    	}
    
    }
    else {
    	req.setAttribute("msg","Mail Id Not Exit");
    	RequestDispatcher requestDispatcher=req.getRequestDispatcher("forgot.jsp");
        requestDispatcher.forward(req, res);
    }   
	//String otp =Mail.sendEmail(Email);
	
}
}






