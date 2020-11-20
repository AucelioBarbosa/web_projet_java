<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PT-BR" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agendamento</title>
</head>
<body>
<div align="center">
	<c:if test="${agenda.id == null}">
			<h2><label style="color:#483D8B"><b>Agendamento</b></label></h2>
		</c:if>
	<c:if test="${agenda.id != null}">
			<h2>Alteração</h2>
		</c:if>
	<font color="#FF0000">${erro}</font>
	<font color="#00FF00">${sucesso}</font>
</div>
	
	<div class="container">
			<form method="post" action="agendaCRUD">
				<input class="form-control" type="hidden" name="acao" value="salvar"/> <input
					type="hidden" name="id" value="${agenda.id}" /> 
					<label style="color:#483D8B"><b>Data do Agendamento</b> </label><br /> 
				<input placeholder ="DD/MM/AAAA" class="form-control" type="text"name="dataAgendamento" value="${agenda.data}" size="10" /><p>
			<div class="container">
				<label style="color:#483D8B"><b>Agedar</b></label>
				<c:if test="${agenda.agendado}">
					<input class="form-check-input" type="checkbox" name="agendado" checked="checked"/><p />
				</c:if>
					<c:if test="${!agenda.agendado}">
					<input cclass="form-check-input" type="checkbox" name="agendado" />	<p>
				</c:if>
			</div>
				
			<div class="container">	
			<label style="color:#483D8B"><b>Paciente</b></label><br> 
			<select class="form-control" name="idusuario">
				<c:forEach var="usuario" items="${usuarios}" >
					<c:if test="${usuaio.id == agenda.usuario.id}">
						<option value="${usuario.id}" selected="selected">${usuario.nome}
					</c:if>
					<c:if test="${usuairo.id != agenda.usuario.id}">
						<option value="${usuario.id}">${usuario.nome}
					</c:if>
				</c:forEach>
			</select>
			</div><p>
			
		   <div align="center" aclass="container">
				<p />
				<input class="btn btn-info" type="submit" value="Salvar"/>
			</form>
		</div>
	</div >
	
	<div align="center" class="container" >
		<a class="btn btn-primary"  href="agendaCRUD?acao=listar">Lista</a>
		<a class="btn btn-primary" href="UsuarioCRUD?acao=listar">volta</a>
	</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>