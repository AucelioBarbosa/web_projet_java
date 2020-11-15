package br.ucb.model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ucb.model.Conta;

public class ContaDAO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;

	public ContaDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}

	public int incluir(Conta conta) throws SQLException{
		if(conta == null)
			return 0;
		String sql = "INSERT INTO conta VALUES(login, senha) VALUES (?,?)";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1,conta.getLogin());
		stmt.setString(2,conta.getSenha());
		int retorno = stmt.executeUpdate();
		return retorno;
	}
	
	public List<Conta> listar() throws SQLException{
		String sql = "SELECT*FROM Conta";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Conta> contas = new ArrayList<Conta>();
		while(rs.next()) {
			Conta conta = new Conta();
			conta.setId(rs.getLong("id"));
			conta.setLogin(rs.getString("login"));
			conta.setSenha(rs.getString("senha"));
			contas.add(conta);
		}
		rs.close();
		stmt.close();
		return contas;	
	}
	public int alterar(Conta conta)throws SQLException{
		if(conta == null)
			return 0;
		String sql = "UPDATE conta SET login=?, senha=? WHERE id=?";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1, conta.getLogin());
		stmt.setString(2, conta.getSenha());
				int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;		
	}
	
	public Conta consultar(Long id) throws SQLException{
		Conta conta = null;
		String sql = "SELECT*FROM conta WHERE id ";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,id);
		ResultSet rs = stmt.executeQuery();
		if(rs.first()) {
			conta = new Conta();
			conta.setId(rs.getLong("id"));
			conta.setLogin(rs.getString("nome"));
			conta.setSenha(rs.getString("endereco"));
			
		}
		rs.close();
		stmt.close();
		return conta;
	}
	
	public int excluir(Conta conta)throws SQLException {
		if(conta == null)
			return 0;
		String sql = "DELETE FROM conta WHERE id";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,conta.getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;
	}
	
}
