package br.ucb.model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.ucb.model.Funcionario;

public class LoginDAO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;

	public LoginDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}
	
	public Boolean validacao(Funcionario funcionario) throws SQLException{
		boolean status = false;
		String sql = "SELECT * FROM funcionario WHERE login=?, senha=?"  ;
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setString(1,funcionario.getLogin());
		stmt.setString(2,funcionario.getSenha());
		ResultSet rs = stmt.executeQuery();
        status = rs.next();
		if(rs.first()) {
			funcionario = new Funcionario();
			funcionario.setLogin(rs.getString("login"));
			funcionario.setSenha(rs.getString("senha"));
		}
		rs.close();
		stmt.close();
		return status;
	}	

}


