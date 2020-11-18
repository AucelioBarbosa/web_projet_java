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
	<h1>Listagem de Pre-doadores</h1>
	<font color="#FF0000">${erro}</font>
	<font color="#00FF00">${sucesso}</font>
	<table border="1">
		<tr bgcolor="#AAAAAA">
			<th width="250" align="center">Nome</th>
			<th width="100" align="center">Endereço</th>
			<th width="100" align="center">Telefoner</th>
			<th width="100" align="center">Nascimento</th>
			<th width="100" align="center">Sangue</th>
			<th></th>
		</tr>
		<c:forEach var="usuario" items="${usuarios}" >
			<tr>
				<td align="left">${usuario.nome}</td>
				<td align="center">${usuario.endereco}</td>
				<td align="center">${usuario.tel}</td>
				<td align="center">${usuario.dataNasc}</td>
				<td align="center">${usuario.tipoSanguineo}</td>
				<td>
					<a href="UsuarioCRUD?acao=consultar&id=${usuario.id}">editar</a>
					<a href="UsuarioCRUD?acao=excluir&id=${usuario.id}">excluir</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="index.jsp">Voltar</a><p/>
	<a href="agendaCRUD?acao=listar">Agendar</a>
</body>
</html>