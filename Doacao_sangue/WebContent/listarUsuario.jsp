<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doadores</title>
</head>
<body>
	<div align="center">
	<h1>Listagem de Pre-doadores</h1>
		<font color="#FF0000">${erro}</font>
		<font color="#00FF00">${sucesso}</font>
	</div>
	<div align="center">
	<table class="table table-striped">
	 <thead>
		<tr bgcolor="#AAAAAA">
			<th width="200" align="center">Nome</th>
			<th width="100" align="center">Endere�o</th>
			<th width="100" align="center">Telefoner</th>
			<th width="100" align="center">Nascimento</th>
			<th width="100" align="center">Sangue</th>
			<th width="100" align="center">Op��o</th>
		</tr>
		</thead>
		<c:forEach var="usuario" items="${usuarios}" >
			<tr>
				<td align="left">${usuario.nome}</td>
				<td align="center">${usuario.endereco}</td>
				<td align="center">${usuario.tel}</td>
				<td align="center">${usuario.dataNasc}</td>
				<td align="center">${usuario.tipoSanguineo}</td>
				<td>
					<a class="btn btn-success" href="UsuarioCRUD?acao=consultar&id=${usuario.id}">editar</a>
					<a class="btn btn-danger" href="UsuarioCRUD?acao=excluir&id=${usuario.id}">excluir</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div align="center">
		<a class="btn btn-primary" href="index.jsp">Voltar</a>
		<a class="btn btn-primary" href="agendaCRUD?acao=listar">Agendar</a>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>