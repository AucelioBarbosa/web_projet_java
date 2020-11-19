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
		<h1>Listagem de Agenda</h1>
		<font color="#FF0000">${erro}</font>
		<font color="#00FF00">${sucesso}</font>

	</div>
	
 <div class="container">		
	<table class="table table-striped">
	
	<div class="container">
		<div class="container">
			<div class="row row-cols-4">
				<tr bgcolor="#AAAAAA">
					<th align="center">Doador</th>
					<th align="center">Agendado</th>
					<th align="center">Data</th>
					<th align="center">Opção</th>	
				</tr>
			</div>
		</div>
		
		<div class="container">
				<div class="row row-cols-4">	
					<c:forEach var="agenda" items="${agendas}" >
						<tr>
							<td align="center">${agenda.usuario.nome}</td>
							<td align="center">
								<c:if test="${agenda.agendado}">sim</c:if>
								<c:if test="${!agenda.agendado}">não</c:if>
							</td>
							<td align="left">${agenda.data}</td>
							<td>
								<a class="btn btn-success"href="agendaCRUD?acao=consultar&id=${agenda.id}">editar</a>
								<a class="btn btn-danger" href="agendaCRUD?acao=excluir&id=${agenda.id}">excluir</a>
							</td>
						</tr>
					</c:forEach>
				</div>
		</table>
	</div>

<div align="center">
	<a class="btn btn-primary" href="agendaCRUD?acao=incluir" role="button">Incluir</a>
	<a class="btn btn-primary" href="index.jsp" role="button">Sair</a>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>