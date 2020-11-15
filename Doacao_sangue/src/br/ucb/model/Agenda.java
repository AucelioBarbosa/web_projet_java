package br.ucb.model;

import java.io.Serializable;
import java.util.Date;

public class Agenda implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long codigo;
	private Date data;
	private Usuario usuarios;
	
	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Usuario getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(Usuario usuarios) {
		this.usuarios = usuarios;
	}

	public Agenda() {
		
	}


	
}
