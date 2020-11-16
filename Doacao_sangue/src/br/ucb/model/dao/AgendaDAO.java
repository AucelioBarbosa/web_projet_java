package br.ucb.model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import br.ucb.model.Agenda;

public class AgendaDAO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;

	public AgendaDAO() throws SQLException{
		this.con = ConnectionFactory.getConnection();
	}

	public int incluir(Agenda agenda) throws SQLException{
		if(agenda == null)
			return 0;
		String sql = "INSERT INTO agenda (data,status,usuario_id)VALUES (?,?,?)";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		java.sql.Date data = new java.sql.Date(agenda.getData().getTime());
		stmt.setDate(1, data);
		stmt.setBoolean(2, agenda.isAgendado());
		stmt.setLong(3, agenda.getUsuarios().getId());
		int retorno = stmt.executeUpdate();
		return retorno;
	}

	public List<Agenda> listar() throws SQLException{
		String sql = "SELECT*FROM agenda";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Agenda> agendas = new ArrayList<Agenda>();
		UsuarioDAO usuarioDAO = new UsuarioDAO();	
		while(rs.next()) {
			Agenda agenda = new Agenda();
			agenda.setData(rs.getDate("data"));
			agenda.setAgendado(rs.getBoolean("Agendado"));
			agenda.setUsuarios(usuarioDAO.consultar(rs.getLong("id")));
			agendas.add(agenda);
		}
		rs.close();
		stmt.close();
		return agendas;	
	}
	
	public int alterar(Agenda agenda)throws SQLException{
		if(agenda == null)
			return 0;
		String sql = "UPDATE agenda SET data=?,status=?,usuario=?,_id=? WHERE id=?";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		java.sql.Date data = new java.sql.Date(agenda.getData().getTime());
		stmt.setDate(1, data);
		stmt.setBoolean(2, agenda.isAgendado());
		stmt.setLong(3, agenda.getUsuarios().getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;		
	}
	
	public Agenda consultar(Long id) throws SQLException{
		Agenda agenda = null;
		String sql = "SELECT*FROM agenda WHERE id ";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,id);
		ResultSet rs = stmt.executeQuery();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		if(rs.first()) {
			agenda = new Agenda();
			agenda.setData(rs.getDate("data"));
			agenda.setAgendado(rs.getBoolean("Agendado"));
			agenda.setUsuarios(usuarioDAO.consultar(rs.getLong("id")));
		}
		rs.close();
		stmt.close();
		return agenda;
	}
		
	public int excluir(Agenda agenda)throws SQLException {
		if(agenda == null)
			return 0;
		String sql = "DELETE FROM agenda WHERE id";
		PreparedStatement stmt = this.con.prepareStatement(sql);
		stmt.setLong(1,agenda.getId());
		int retorno = stmt.executeUpdate();
		stmt.close();
		return retorno;
	}

}

