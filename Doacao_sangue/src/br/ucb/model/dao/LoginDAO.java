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
	int r = 0;

	public LoginDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}
	
	public int validarFuncionario(Funcionario funcionario) throws SQLException {
		String sql = "select * from funcionario where matr = ? AND senha= ?";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setString(1, funcionario.getLogin());
		stmt.setString(2, funcionario.getSenha());
		ResultSet rs = stmt.executeQuery();
		Funcionario funcionariobean = new Funcionario();
		while (rs.next()) {
			r++;
			funcionariobean.setId(rs.getLong("id"));
			funcionariobean.setLogin(rs.getString("login"));
			funcionariobean.setSenha(rs.getString("senha"));
		}
		if(r==1) {
			return 1;
		}else{
			return 0;
		}
	}
}	

