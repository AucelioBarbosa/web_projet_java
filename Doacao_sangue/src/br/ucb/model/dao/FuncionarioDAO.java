package br.ucb.model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ucb.model.Funcionario;

public class FuncionarioDAO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;

	public FuncionarioDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}

	public int incluir(Funcionario funcionario) throws SQLException{
		if(funcionario == null)
			return 0;
		String sql = "INSERT INTO funcionario (login, senha) VALUES (?,?)";
	
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1, funcionario.getLogin());
		stmt.setString(2, funcionario.getSenha());
		int retorno = stmt.executeUpdate();
		return retorno;
	}

	public List<Funcionario> listar() throws SQLException{
		String sql = "SELECT*FROM funcionario";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();
	
		while(rs.next()) {
			Funcionario funcionario = new Funcionario();
			funcionario.setId(rs.getLong("id"));
			funcionario.setLogin(rs.getString("login"));
			funcionario.setSenha(rs.getString("senha"));
			funcionarios.add(funcionario);
		}
		rs.close();
		stmt.close();
		return funcionarios;	
	}
	
	public int alterar(Funcionario funcionario)throws SQLException{
		if(funcionario == null)
			return 0;
		String sql = "UPDATE funcionario SET login=?, senha=? WHERE id=?";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1, funcionario.getLogin());
		stmt.setString(2, funcionario.getSenha());
		stmt.setLong(3, funcionario.getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;		
	}
	
	public Funcionario consultar(String login, String senha) throws SQLException{
		Funcionario funcionario = null;
		String sql = "SELECT * FROM funcionario WHERE login=?, senha=?"  ;
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setString(1,login);
		stmt.setString(2, senha);
		ResultSet rs = stmt.executeQuery();
		if(rs.first()) {
			funcionario = new Funcionario();
			funcionario.setLogin(rs.getString("login"));
			funcionario.setSenha(rs.getString("senha"));
		}
		rs.close();
		stmt.close();
		return funcionario;
	}	
	public int excluir(Funcionario funcionario)throws SQLException {
		if(funcionario == null)
			return 0;
		String sql = "DELETE FROM funcionario WHERE id=?";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,funcionario.getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;
	}


}
