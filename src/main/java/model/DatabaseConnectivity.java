package model;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class DatabaseConnectivity {

	private static final Throwable classNotfoundException = null;

	public static Connection connect(){//acessspecif acessmodif returntype methodname(type var-name);
		Connection connection=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weather","root","Dhanya@123");
		 System.out.println("Connected");
	}catch (ClassNotFoundException classNotFoundException) {
		classNotfoundException.printStackTrace();	
	}catch (SQLException sqlException) {
		sqlException.printStackTrace();
	}
		return connection;
		
	}
	public static void main(String[] args) {
     Connection connection=connect();
	}
}

