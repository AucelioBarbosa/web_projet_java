<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doadores</title>
</head>
<body>
	<h1>Listagem de Agenda</h1>
	<font color="#FF0000">${erro}</font>
	<font color="#00FF00">${sucesso}</font>
	<table border="1">
		<tr bgcolor="#AAAAAA">
			<th width="250" align="center">Doador</th>
			<th width="100" align="center">Agendado</th>
			<th width="100" align="center">Data</th>
			<th></th>	
		</tr>
		<c:forEach var="agenda" items="${agendas}" >
			<tr>
				<td align="center">${agenda.usuario.nome}</td>
				<td align="center">
					<c:if test="${agenda.agendado}">sim</c:if>
					<c:if test="${!agenda.agendado}">não</c:if>
				</td>
				<td align="left">${agenda.data}</td>
				<td>
					<a href="agendaCRUD?acao=consultar&id=${agenda.id}">editar</a>
					<a href="agendaCRUD?acao=excluir&id=${agenda.id}">excluir</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="agendaCRUD?acao=incluir">Incluir</a><p/>
	<a href="index.jsp">Sair</a>
</body>
</html>