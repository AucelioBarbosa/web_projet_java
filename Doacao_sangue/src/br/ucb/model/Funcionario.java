package br.ucb.model;

import java.io.Serializable;

public class Funcionario implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long id;
	private String login;
	private String senha;

	
	public Funcionario() {
		
	}
	
	public boolean logar (String login, String senha) {
		boolean logar = true;		
		if((!login.equals(this.login)) & (!senha.equals(this.senha)))
			 logar= false;
		return logar;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
