package br.ucb.model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ucb.model.Usuario;

public class UsuarioDAO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;

	public UsuarioDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}

	public int incluir(Usuario usuario) throws SQLException{
		if(usuario == null)
			return 0;
		String sql = "ISERTE INTO agenda (nome, endereco, tel, dataNas, cpf, tipoSanguineo)value (?,?,?,?,?,?)";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getEndereco());
		stmt.setString(3, usuario.getTel());
		java.sql.Date data = new java.sql.Date(usuario.getdataNasc().getTime());
		stmt.setDate(4, data);		
		stmt.setString(5, usuario.getCpf());
		stmt.setString(6, usuario.getTipoSanguineo());
		int retorno = stmt.executeUpdate();
		return retorno;
	}

	public List<Usuario> listar() throws SQLException{
		String sql = "SELECT*FROM usuario";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Usuario> usuarios = new ArrayList<Usuario>();
		while(rs.next()) {
			Usuario usuario = new Usuario();
			usuario.setId(rs.getLong("id_usuario"));
			usuario.setNome(rs.getString("id_usuario"));
			usuario.setEndereco(rs.getString("endereco"));
			usuario.setTel(rs.getString("telefone"));
			usuario.setdataNasc(rs.getDate("dataNasc"));
			usuario.setCpf(rs.getString("cpf"));
			usuario.setTipoSanguineo(rs.getString("tipoSanquineo"));
			usuarios.add(usuario);
		}
		rs.close();
		stmt.close();
		return usuarios;	
	}
	
	public int alterar(Usuario usuario)throws SQLException{
		if(usuario == null)
			return 0;
		String sql = "UPDATE agenda SET nome=?, endereco=?, tel=?, dataNas=?, cpf=?, tipoSanguineo=?";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getEndereco());
		stmt.setString(3, usuario.getTel());
		java.sql.Date data = new java.sql.Date(usuario.getdataNasc().getTime());
		stmt.setDate(4, data);		
		stmt.setString(5, usuario.getCpf());
		stmt.setString(6, usuario.getTipoSanguineo());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;		
	}
	
	public Usuario consultar(Long id) throws SQLException{
		Usuario usuario = null;
		String sql = "SELECT*FROM usuario WHERE id_usuario";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,id);
		ResultSet rs = stmt.executeQuery();
		if(rs.first()) {
			usuario = new Usuario();
			usuario.setId(rs.getLong("id_usuario"));
			usuario.setNome(rs.getString("id_usuario"));
			usuario.setEndereco(rs.getString("endereco"));
			usuario.setTel(rs.getString("telefone"));
			usuario.setdataNasc(rs.getDate("dataNasc"));
			usuario.setCpf(rs.getString("cpf"));
			usuario.setTipoSanguineo(rs.getString("tipoSanquineo"));
		}
		rs.close();
		stmt.close();
		return usuario;
	}
		
	public int excluir(Usuario usuario)throws SQLException {
		if(usuario == null)
			return 0;
		String sql = "DELETE FROM usuario WHERE id_usuario";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,usuario.getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;
	}

}
