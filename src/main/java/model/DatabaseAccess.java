package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.protobuf.Method;

public class DatabaseAccess {
	private static final String signIn="SELECT Username FROM userdetails WHERE Email=? AND Pass=?";
     private static final String mailCheck="SELECT Username FROM userdetails WHERE Email=?";
     private static final String signUp="INSERT INTO userdetails values (?,?,?)";
     private static final String resetPass="UPDATE userdetails SET  Pass=? WHERE Email=?";

     
     public static String checkMail (String  email)  {
    	 String result=null;
    	 
		try {
			Connection connection=DatabaseConnectivity.connect();
	    	 PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(mailCheck);
			preparedStatement.setString(1,email);
	    	 ResultSet resultSet=preparedStatement.executeQuery();
	    	 if(resultSet.next()) {
	    		 result=resultSet.getString(1);
	    		 System.out.println(resultSet.getString(1));
	    	 } else {
	    		 result=null;
	  			System.out.println(result);
	     	 }
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
    	 return result;
    	 }
     
	public static String signIn(UserDetails userDetails) {
		// TODO Auto-generated method stub
		String email=userDetails.getEmail();
		String password=userDetails.getPassword();
		System.out.println(email);
		String result=null;
		try {
			Connection connection=DatabaseConnectivity.connect();
			PreparedStatement preparedStatement=connection.prepareStatement(signIn);
			preparedStatement.setString(1,email);
			preparedStatement.setString(2,password);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.next()){
			  result=resultSet.getString(1);
			  System.out.println(resultSet.getString(1));
			}
		else {
			result=null;
			System.out.println(result);
		}
	} catch (SQLException sqlException) {
		sqlException.printStackTrace();
	}
return result;
}
	public static String signUp(UserDetails userDetails) {
		// TODO Auto-generated method stub
		String email=userDetails.getEmail();
		String password=userDetails.getPassword();
		String name=userDetails.getUserName();
		 
			Connection connection=DatabaseConnectivity.connect();
			PreparedStatement preparedStatement;
			try {
				preparedStatement = connection.prepareStatement(signUp);
				preparedStatement.setString(1,name);
				preparedStatement.setString(2,email);
				preparedStatement.setString(3, password);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return name;
			
	}
	public static String resetPassword(UserDetails userDetails) {
		// TODO Auto-generated method stub
		String email=userDetails.getEmail();
		String pass=userDetails.getPassword();
		System.out.println(pass);
		System.out.println(email);
		String result=null;
		try {
			Connection connection=DatabaseConnectivity.connect();
			PreparedStatement preparedStatement=connection.prepareStatement(resetPass);
			preparedStatement.setString(1,pass);
			preparedStatement.setString(2, email);
		    int i=preparedStatement.executeUpdate();
		    if(i!=0) {
		    	result="Yes";
		    }
		    else {
		    	result=null;
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		
		return result;// Thambi..run
	}
	public static void main(String[] args) {
		UserDetails details=new UserDetails();
		details.setPassword("1234");
		details.setEmail("ranjitsimbu99@gmail.com");
		String result=DatabaseAccess.resetPassword(details);
		System.out.println(result);
	}
	
}





