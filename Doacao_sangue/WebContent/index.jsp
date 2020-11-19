<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Central de Agendamento</title>
</head>
<body>
	<div align="center">
		<c:if test="${usuario.id == null}">
		<h1><label for="exampleInputEmail1">Pre cadastro</label></h1>
		</c:if>
		<c:if test="${usuario.id != null}">
			<label for="exampleInputEmail1">Alteração de Pre cadastro</label>
		</c:if>
		<font color="#FF0000">${erro}</font> <font color="#00FF00">${sucesso}</font>
		<div class="conteiner col-sm-6">
			<form method="post" action="UsuarioCRUD">

				<input type="hidden" name="acao" value="salvar" /> 
				<input type="hidden" name="id" value="${usuario.id}" />
				<div class="form-group">
					<label>Nome</label><br> 
					<input type="text"class="form-control" name="nome" value="${usuario.nome}" size="50">
				</div>
				<p>
					<label>Endereço</label><br> <input type="text" name="endereco"
						class="form-control" value="${usuario.endereco}" size="50">
				<p>
					<label>Telefone</label><br> <input type="text"
						class="form-control" name="telefone" value="${usuario.tel}">
				<p>
					<label>Data de nascimento</label><br>
				 	<label>dd/mm/aaaa</label><br>
				 	
					<input type="text" class="form-control" value="${usuario.dataNascDMA}" name="dataNasc"/>
				<p>
					<label>Tipo Sanguíneo</label><br> 
					<select name="tipoSanguinio"
						class="form-control">
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
					<input class="btn btn-primary" type="submit">
				<p>
			</div>
		</form>
	</div>
	
		<div align="center">
			<form method="post" action="UsuarioCRUD">	
			<input  class="btn btn-success" type="submit"name="list" value="Funcionario">	
		</form>
	</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</html>