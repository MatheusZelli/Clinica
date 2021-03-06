<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="dao.CadastraPaciente, dao.LoginMedico"%>
<!DOCTYPE html>
<html>
<head>
<%
	String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
	String crm = String.valueOf(request.getSession().getAttribute("crm"));
	String nome = "";
	
	if(cpf.equals("null") && crm != "null"){
		LoginMedico loginMedico = new LoginMedico();
		nome = loginMedico.buscaNome(crm);
	}else if(crm.equals("null") && cpf != "null"){
		CadastraPaciente cp = new CadastraPaciente();
		nome = cp.buscaPaciente(cpf).getNome();
	} else if (cpf.equals("null") && crm.equals("null")){
		response.sendRedirect("index.jsp");
	}
%>
<title>Home</title>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="homeStyle.css" media="screen" />
</head>

<body>

<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>
	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<%
				if(cpf != "null"){
					
			%>
			<li><a href="agendamento.jsp?id=0">Agendamento Consulta</a>
			<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>
			<% }%>
			<li><a href="meusAgendamentos.jsp">Meus Agendamentos</a>
			<li><a href="sair">Sair</a>
		</ul>
	</nav>
    	<div id="fundo">
    		<div class="input">
				<div class="input-group">
					<h1>Bem Vindo, <%=nome%></h1>
				</div>
			</div>
    	</div>
</body>
</html>