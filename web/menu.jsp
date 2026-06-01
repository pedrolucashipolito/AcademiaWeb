<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>

	.navbar {
		background-color: #4da6ff;
		padding: 15px;
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 20px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	}

	.navbar a {
		color: white;
		text-decoration: none;
		font-weight: bold;
		padding: 10px 18px;
		border-radius: 6px;
		transition: 0.3s;
	}

	.navbar a:hover {
		background-color: #1f8cff;
	}

</style>

<div class="navbar">

	<a href="${pageContext.request.contextPath}/index.jsp">
		Home
	</a>

	<a href="${pageContext.request.contextPath}/CUsuario">
		Usuários
	</a>

	<a href="${pageContext.request.contextPath}/CAgendamento">
		Agendamentos
	</a>

</div>