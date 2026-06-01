<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Lista de Usuários</title>

<style>

	body {
		font-family: Arial, sans-serif;
		margin: 0;
		background-color: #f5f9ff;
	}

	.navbar {
		background-color: #4da6ff;
		padding: 12px;
		display: flex;
		justify-content: center;
		gap: 20px;
	}

	.navbar a {
		color: white;
		text-decoration: none;
		font-weight: bold;
		padding: 8px 15px;
		border-radius: 5px;
	}

	.navbar a:hover {
		background-color: #1f8cff;
	}

	.container {
		width: 90%;
		max-width: 1100px;
		margin: 30px auto;
		background: white;
		padding: 25px;
		border-radius: 10px;
		box-shadow: 0px 0px 10px rgba(0,0,0,0.08);
	}

	h2 {
		color: #1f4e79;
		text-align: center;
		margin-top: 0;
		margin-bottom: 25px;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	th {
		background-color: #d6ebff;
		color: #1f4e79;
	}

	th, td {
		border: 1px solid #cce0ff;
		padding: 10px;
		text-align: center;
	}

	tr:nth-child(even) {
		background-color: #f8fbff;
	}

	a {
		text-decoration: none;
		color: #1f8cff;
		font-weight: bold;
	}

	a:hover {
		text-decoration: underline;
	}

	.areaBotao {
		text-align: center;
		margin-top: 25px;
	}

	.botaoNovo {
		display: inline-block;
		padding: 10px 20px;
		background-color: #4da6ff;
		color: white;
		border-radius: 5px;
		text-decoration: none;
		font-weight: bold;
	}

	.botaoNovo:hover {
		background-color: #1f8cff;
		text-decoration: none;
	}

</style>

</head>

<body>

<div class="navbar">

	<a href="index.jsp">Home</a>

	<a href="CAgendamento">Agendamentos</a>

</div>

<div class="container">

	<h2>Lista de Usuários</h2>

	<table>

		<tr>
			<th>Código</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Idade</th>
			<th>Ativo</th>
			<th>Data Cadastro</th>
			<th>Ações</th>
		</tr>

		<c:forEach var="u" items="${lista}">

			<tr>

				<td>${u.codigo}</td>
				<td>${u.nome}</td>
				<td>${u.email}</td>
				<td>${u.idade}</td>
				<td>${u.ativo}</td>
				<td>${u.dataCadastro}</td>

				<td>

					<a href="CUsuario?acao=alterar&codigo=${u.codigo}">
						Alterar
					</a>

					|

					<a href="CUsuario?acao=excluir&codigo=${u.codigo}"
					   onclick="return confirm('Deseja excluir?')">
						Excluir
					</a>

				</td>

			</tr>

		</c:forEach>

	</table>

	<div class="areaBotao">

		<a class="botaoNovo"
		   href="CUsuario?acao=novo">
			Novo Usuário
		</a>

	</div>

</div>

</body>

</html>
