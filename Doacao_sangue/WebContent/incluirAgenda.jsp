<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PT-BR" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agendamento</title>
</head>
<body>
	<c:if test="${agenda.id == null}">
		<h2>Agendamento</h2>
	</c:if>
	<c:if test="${agenda.id != null}">
		<h2>Alteração</h2>
	</c:if>
	<font color="#FF0000">${erro}</font>
	<font color="#00FF00">${sucesso}</font>
	<form method="post" action="agendaCRUD">
		<input type="hidden" name="acao" value="salvar" /> <input
			type="hidden" name="id" value="${agenda.id}" /> 
			<label>Datado Agendamento (dd/mm/aaaa)</label><br /> 
			<input type="text"name="dataAgendamento" value="${agenda.data}" size="10"	maxlength="10"/>
		<p />
		<label>Agendado</label>
		<c:if test="${agenda.agendado}">
			<input type="checkbox" name="agendado" checked="checked" />
			<p />
		</c:if>
		<c:if test="${!agenda.agendado}">
			<input type="checkbox" name="agendado" />
			<p />
		</c:if>
		<label>Agenda</label><br /> 
	<select name="idusuario">
			<c:forEach var="usuario" items="${usuarios}" >
				<c:if test="${usuaio.id == agenda.usuario.id}">
					<option value="${usuario.id}" selected="selected">${usuario.nome}
				</c:if>
				<c:if test="${usuairo.id != agenda.usuario.id}">
					<option value="${usuario.id}">${usuario.nome}
				</c:if>
			</c:forEach>
		</select>
		<p />
		<input type="submit" value="Salvar"/>
	</form>
	<a href="agendaCRUD?acao=listar">Lista</a>
	<a href="UsuarioCRUD?acao=listar">volta</a>
	<br />
</body>
</html>