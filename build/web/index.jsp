<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Home</title>

<style>

	body {
		font-family: Arial, sans-serif;
		margin: 0;
		min-height: 100vh;

		background:
			linear-gradient(
				rgba(245,249,255,0.90),
				rgba(245,249,255,0.90)
			),
			url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48');

		background-size: cover;
		background-position: center;
		background-attachment: fixed;
	}

	.container {
		width: 90%;
		max-width: 1100px;
		margin: 40px auto;
		background: rgba(255,255,255,0.92);
		padding: 40px;
		border-radius: 15px;
		box-shadow: 0px 0px 15px rgba(0,0,0,0.10);
		text-align: center;
	}

	h1 {
		color: #1f4e79;
		margin-bottom: 20px;
		font-size: 36px;
	}

	p {
		font-size: 18px;
		color: #555;
	}

	.cards {
		display: flex;
		justify-content: center;
		gap: 30px;
		margin-top: 40px;
		flex-wrap: wrap;
	}

	.card {
		background-color: #d6ebff;
		width: 280px;
		padding: 25px;
		border-radius: 12px;
		text-align: center;
		box-shadow: 0px 3px 8px rgba(0,0,0,0.08);
	}

	.card h3 {
		color: #1f4e79;
		margin-top: 0;
		margin-bottom: 15px;
	}

	.card p {
		font-size: 15px;
		color: #444;
	}

	.card a {
		text-decoration: none;
		color: white;
		background-color: #4da6ff;
		padding: 10px 20px;
		border-radius: 5px;
		display: inline-block;
		margin-top: 15px;
		font-weight: bold;
	}

	.card a:hover {
		background-color: #1f8cff;
	}

</style>

</head>

<body>

<div class="container">

	<h1>Sistema Academia</h1>

	<p>Use os atalhos abaixo para navegar pelo sistema.</p>

	<div class="cards">

		<div class="card">
			<h3>Usuários</h3>
			<p>Gerenciar usuários cadastrados.</p>
			<a href="CUsuario">Acessar</a>
		</div>

		<div class="card">
			<h3>Agendamentos</h3>
			<p>Gerenciar agendamentos da academia.</p>
			<a href="CAgendamento">Acessar</a>
		</div>

	</div>

</div>

</body>

</html>
