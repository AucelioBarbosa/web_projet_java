package br.ucb.model;

import java.io.Serializable;
import java.util.Date;

public class Agenda implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long id;
	private Date data;
	private boolean agendado;
	private Usuario usuario;
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public boolean isAgendado() {
		return agendado;
	}

	public void setAgendado(boolean agendado) {
		this.agendado = agendado;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
