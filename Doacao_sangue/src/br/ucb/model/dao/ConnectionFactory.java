package br.ucb.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static Connection con=null;
	  
	  public static Connection getConnection() throws SQLException {
	    if (con == null) {
	      try {
	        Class.forName("com.mysql.jdbc.Driver");
	        String sql = "jdbc:mysql://localhost/hemo_clinica";
	        con = DriverManager.getConnection(sql, "root", "chucknoia");
	      }
	      catch (ClassNotFoundException e) {
	        throw new SQLException("Driver n�o localizado");
	      }
	    }
	    return con;
	  }

}
