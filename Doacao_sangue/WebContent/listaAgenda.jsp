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
			<th width="250" align="center">Data</th>
			<th width="100" align="center">Pasciente</th>
			<th width="100" align="center">Statos</th>
			<th></th>
		</tr>
		<c:forEach var="curso" items="${agenda}" >
			<tr>
				<td align="left">${agenda.data}</td>
				<td align="center">${agenda.usuario}</td>
				<td align="center">${agena.status}</td>
				<td>
					<a href="AgendaCRUD?acao=consultar&id=${agenda.id}">editar</a>
					<a href="AgendaCRUD?acao=excluir&id=${agenda.id}">excluir</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="index.jsp">Incluir</a><p/>
</body>
</html>