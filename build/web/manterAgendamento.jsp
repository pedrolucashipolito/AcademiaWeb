<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Manter Agendamento</title>

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
		max-width: 700px;
		margin: 30px auto;
		background: white;
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0px 0px 10px rgba(0,0,0,0.08);
	}

	h2 {
		color: #1f4e79;
		text-align: center;
		margin-top: 0;
		margin-bottom: 25px;
	}

	form p {
		margin-bottom: 5px;
		font-weight: bold;
		color: #1f4e79;
	}

	input[type="text"],
	input[type="date"] {
		width: 100%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #cce0ff;
		border-radius: 5px;
		box-sizing: border-box;
	}

	input[type="checkbox"] {
		margin-bottom: 15px;
	}

	.botoes {
		text-align: center;
		margin-top: 25px;
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

<div class="navbar">

	<a href="index.jsp">Home</a>

	<a href="CUsuario">Usuários</a>

</div>

<div class="container">

	<h2>Manter Agendamento</h2>

	<form method="POST" action="CAgendamento">

		<input type="hidden"
			   name="codigo"
			   value="${agendamento.codigo}">

		<p>Data</p>

		<input type="date"
			   name="data"
			   value="${agendamento.data}">

		<p>Hora</p>

		<input type="text"
			   name="hora"
			   value="${agendamento.hora}">

		<p>Ativo</p>

		<input type="checkbox"
			   name="ativo"
			   value="true"
			   <c:if test="${agendamento.ativo}">checked</c:if>>

		<p>Observação</p>

		<input type="text"
			   name="observacao"
			   value="${agendamento.observacao}">

		<p>Usuário</p>

		<input type="text"
			   name="usuario"
			   value="${agendamento.usuario.codigo}">

		<p>Aparelho</p>

		<input type="text"
			   name="aparelho"
			   value="${agendamento.aparelho.codigo}">

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
