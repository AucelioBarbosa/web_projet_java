<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Login</h1>
		<form method="post" action="funcionarioCRUD">
			<input type="hidden" name="listar"> 
			<label>Usuário</label><br>
			<input type="text" name="login" size="50"><p>
			<label>Senha</label><br>
			<input type="password" name="senha" size="50"><p>
			
			<input type="submit"name="Funcionario" value="listar">
		</form>
	</div>
</body>
</html>