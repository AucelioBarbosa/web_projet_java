<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Central de Agendamento</title>
</head>
<body>
	<div align="right">
		<form method="post" action="UsuarioCRUD">
			<input type="hidden" name="listar"> 
			<input type="submit"name="Funcionario" value="listar">
		</form>
	</div>
	<div align="center">
		<c:if test="${usuario.id == null}">
			<h2>Pre cadastro</h2>
		</c:if>
		<c:if test="${usuario.id != null}">
			<h2>Alteração de Pre cadastro</h2>
		</c:if>
		<font color="#FF0000">${erro}</font> 
		<font color="#00FF00">${sucesso}</font>
		<form method="post" action="UsuarioCRUD">
			<input type="hidden" name="acao" value="salvar" /> <input
				type="hidden" name="id" value="${usuario.id}" /> <label>Nome</label><br>
			<input type="text" name="nome" value="${usuario.nome}" size="50">
			<p>
				<label>Endereço</label><br> 
				<input type="text" name="endereco" value="${usuario.endereco}" size="50">
			<p>
				<label>Telefone</label><br> 
				<input type="text" name="telefone" value="${usuario.tel}">
			<p>
				<label>Data de nascimento</label><br> 
				<label>dd/mm/aaaa</label><br>
				<input type="text" name="dataNasc" value="${usuario.dataNasc}">
			<p>
				<label>Tipo Sanguíneo</label><br> <select name="tipoSanguinio">
					<option>A-</option>
					<option>A+</option>
					<option>B-</option>
					<option>B+</option>
					<option>AB-</option>
					<option>AB+</option>
					<option>O-</option>
					<option>O+</option>
				</select>
			<p>
				<input type="submit">
			<p>
		</form>
	</div>
</body>
</html>