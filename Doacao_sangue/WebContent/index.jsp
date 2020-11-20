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
<body style="background-image: url('teladefundo.png')" >
	<div align="right">
			<form method="post" action="login.jsp">
			<input  class="btn btn-danger" type="submit"name="list" value="Acesso Restrito">	
		</form>
		</div>  
		
<div class="container" >
	



  <div class="row">  	
    <div class="col">
        
    <div align="center">
		<c:if test="${usuario.id == null}">
		<h1 style="color:#483D8B" ><label for="exampleInputEmail1"> Agende sua <b>doação</b></label></h1>
		</c:if>
		<c:if test="${usuario.id != null}">
			<label for="exampleInputEmail1">Alteração de Pre cadastro</label>
		</c:if>
		<font color="#FF0000">${erro}</font> <font color="#00FF00">${sucesso}</font>
		<div class="conteiner">
			<form method="post" action="UsuarioCRUD">
			

				<input type="hidden" name="acao" value="salvar" /> 
				<input type="hidden" name="id" value="${usuario.id}" />
				<div class="form-group">
					<div align="left" style="color:#483D8B" >
					<label><b>Nome </b></label>					
					</div>
					<input type="text"class="form-control" name="nome" value="${usuario.nome}" size="50">
				</div><p>
			
					<div align="left" style="color:#483D8B" >
					<label><b>Endereço </b></label>					
					</div>
					<input type="text" name="endereco"
						class="form-control" value="${usuario.endereco}" size="50">
				<p>
				
					<div align="left" style="color:#483D8B" >
					<label><b>Telefone </b></label>
					
					</div><input type="text"
						class="form-control" name="telefone" value="${usuario.tel}">
				<p>
				
					<div align="left" style="color:#483D8B" >
					<label><b>Data de Nascimento </b></label>					
					</div>			 	
					<input placeholder ="DD/MM/AAAA" type="text" class="form-control" name="dataNasc"/>
				<p>
					<div align="left" style="color:#483D8B" >
					<label><b>Tipo Sanguineo</b></label>
					
					</div> 
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
				<p>
					<input class="btn btn-primary"  type="submit" value="Enviar">
				<p>
			</form>
			</div>
	
	</div>
    
	</div>
	
	<div class="col" >
	
	<h1 align="center" style="color:#483D8B" ><label for="exampleInputEmail1"> <b>Orientações</b></label></h1>
	<div class="p-3 mb-2 bg-white text-dark"  >
	
	<label style="color:#483D8B">
	Estar em boas condições de saúde, não estar gripado ou com outra infecção;
	</label>
	
	<label style="color:#483D8B">
		Ter entre 16 e 69 anos (se tiver menos de 18 anos, deve vir junto do pai ou responsável, se o doador não tiver realizado uma doação anterior aos 60 anos, ele não pode doar);
	</label>
	
	<label style="color:#483D8B">
	Pesar mais de 50 Kg. (O volume de sangue total a ser coletado deve ser, no máximo, de 8(oito) mL/Kg para as mulheres e de 9 (nove) mL/Kg para homens).
	</label>
	
	<label style="color:#483D8B">
	Estar descansado no mínimo 6h de sono na noite que antecede a doação e alimentado. Não ingerir alimentação gordurosa nas 3 horas que antecedem a doação. (leite, manteiga, queijo, frituras e etc.);
	</label>
	
	<label style="color:#483D8B">
	Apresentar documento original com foto emitido por órgão oficial (crachás e documentos funcionais não são aceitos);
	</label>
	
	<label style="color:#483D8B">	
	Evitar bebidas alcoólicas doze horas antes da doação  não doar em 24 horas, se houver ingestão de grandes volumes de bebida alcóolica;
	</label>
	
	<label style="color:#483D8B">
	Não fumar 1 hora antes da doação;
	</label>
	
	<label style="color:#483D8B"><b>
	ATENÇÃO: Doador que comparecer ao Banco de Sangue da Hemoclínica com criança de colo, só poderá doar se estiver acompanhado de outra pessoa capaz de cuidar da criança e que não irá doar no dia;
	</b>
	</label>
	
	
	</div>
	
	</div>
	
		
	</div>
	
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