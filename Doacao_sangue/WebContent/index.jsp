<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Central de Agendamento</title>
</head>
<body>
<div align="right">
		<a href="login.jsp">Funcionario</a>
	</div>
	<div align="center">
		<h1>Pre cadastro</h1>
		${erro}
		<form method="post" action="UsuarioCRUD">
			<input type="hidden" name="acao" value="salvar"/>
			<input type="hidden" name="id" value="${usuario.id}"/>
			<label>Nome</label><br>
			<input type="text" name="nome" size="50"><p>
			<label>EndereÃ§o</label><br>
			<input type="text" name="endereco" size="50"><p>
			<label>Telefone</label><br>
			<input type="text" name="telefone"><p>
			<label>Data de nascimento</label><br>
			<label>dd/mm/aaaa</label><br>
			<input type="text" name="dataNasc"><p>
			<label>CPF</label><br>
			<input type="text" name="cpf"><p>
			<label>Tipo Sanguíneo</label><br>
			<select name="tipoSanguinio">
				<option>A-</option>
				<option>A+</option>
				<option>B-</option>
				<option>B+</option>
				<option>AB-</option>
				<option>AB+</option>
				<option>O-</option>
				<option>O+</option>
			</select>
			<input type="submit">
			<p>
		</form>
		<a href="UsuarioCRUD?acao=">Cadastrar</a>
	</div>	
</body>
</html>