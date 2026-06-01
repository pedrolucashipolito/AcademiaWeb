<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Listar Agendamentos</title>

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

	h4 {
		color: #1f4e79;
		font-size: 24px;
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

	<a href="CUsuario">Usuários</a>

</div>

<div class="container">

	<h4>Lista de Agendamentos</h4>

	<table>

		<tr>
			<th>Código</th>
			<th>Data</th>
			<th>Hora</th>
			<th>Ativo</th>
			<th>Observação</th>
			<th>Usuário</th>
			<th>Aparelho</th>
			<th>Ações</th>
		</tr>

		<c:forEach var="ag" items="${lista}">

			<tr>

				<td>${ag.codigo}</td>

				<td>${ag.data}</td>

				<td>${ag.hora}</td>

				<td>${ag.ativo}</td>

				<td>${ag.observacao}</td>

				<td>
					<c:if test="${not empty ag.usuario}">
						${ag.usuario.codigo}
					</c:if>
				</td>

				<td>
					<c:if test="${not empty ag.aparelho}">
						${ag.aparelho.codigo}
					</c:if>
				</td>

				<td>

					<a href="CAgendamento?acao=alterar&codigo=${ag.codigo}">
						Alterar
					</a>

					|

					<a href="CAgendamento?acao=excluir&codigo=${ag.codigo}"
					   onclick="return confirm('Deseja excluir?')">
						Excluir
					</a>

				</td>

			</tr>

		</c:forEach>

	</table>

	<div class="areaBotao">

		<a class="botaoNovo"
		   href="CAgendamento?acao=novo">
			Novo Agendamento
		</a>

	</div>

</div>

</body>

</html>
