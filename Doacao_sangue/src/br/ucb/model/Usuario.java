package br.ucb.model;

import java.io.Serializable;
import java.util.Date;

public class Usuario implements Serializable{
	private static final long serialVersionUID = 1L;
	
	 private long id;
	 private String nome;
	 private String endereco;
	 private String tel;
	 private Date dataNasc;
	 private String tipoSanguineo;
	 private String cpf;
	 
	 public Usuario() {
		 
	 }

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getdataNasc() {
		return dataNasc;
	}

	public void setdataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public String getTipoSanguineo() {
		return tipoSanguineo;
	}

	public void setTipoSanguineo(String tipoSanguineo) {
		this.tipoSanguineo = tipoSanguineo;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	 
}
