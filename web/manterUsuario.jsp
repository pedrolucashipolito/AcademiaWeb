<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Manter Usuário</title>

	<style>

		body {
			font-family: Arial, sans-serif;
			margin: 0;
			background-color: #f5f9ff;
		}

		.container {
			width: 90%;
			max-width: 700px;
			margin: 30px auto;
			background: white;
			padding: 25px;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0,0,0,0.08);
		}

		h2 {
			color: #1f4e79;
			margin-top: 0;
			text-align: center;
		}

		table {
			width: 100%;
		}

		td {
			padding: 8px;
		}

		input[type="text"],
		input[type="number"],
		input[type="date"] {
			width: 100%;
			padding: 10px;
			border: 1px solid #cce0ff;
			border-radius: 5px;
			box-sizing: border-box;
		}

		input[type="checkbox"] {
			transform: scale(1.2);
		}

		.botoes {
			text-align: center;
			margin-top: 20px;
		}

		input[type="submit"],
		input[type="button"] {
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			background-color: #4da6ff;
			color: white;
			font-weight: bold;
			cursor: pointer;
			margin: 0 5px;
		}

		input[type="submit"]:hover,
		input[type="button"]:hover {
			background-color: #1f8cff;
		}

	</style>

</head>

<body>

	<jsp:include page="menu.jsp"/>

	<div class="container">

		<h2>Manter Usuário</h2>

		<form method="POST" action="CUsuario">

			<table>

				<tr>
					<td>Código</td>
					<td>
						<input type="text"
							   name="codigo"
							   readonly="readonly"
							   value="${usuario.codigo}">
					</td>
				</tr>

				<tr>
					<td>Nome</td>
					<td>
						<input type="text"
							   name="nome"
							   value="${usuario.nome}">
					</td>
				</tr>

				<tr>
					<td>Email</td>
					<td>
						<input type="text"
							   name="email"
							   value="${usuario.email}">
					</td>
				</tr>

				<tr>
					<td>Idade</td>
					<td>
						<input type="number"
							   name="idade"
							   value="${usuario.idade}">
					</td>
				</tr>

				<tr>
					<td>Ativo</td>
					<td>
						<input type="checkbox"
							   name="ativo"
							   value="true"
							   <c:if test="${usuario.ativo}">
							   		checked
							   </c:if>>
					</td>
				</tr>

				<tr>
					<td>Data Cadastro</td>
					<td>
						<input type="date"
							   name="dataCadastro"
							   value="${usuario.dataCadastro}">
					</td>
				</tr>

			</table>

			<div class="botoes">

				<input type="submit" value="Salvar">

				<input type="button"
					   value="Voltar"
					   onclick="history.go(-1)">

			</div>

		</form>

	</div>

</body>

</html>