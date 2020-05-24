<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8"
import="dao.BuscaAgendamento , java.util.* , controller.CancelarConsultaS,model.Agendamento"
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>


<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />

<title>Meus Agendamentos</title>
<script>

function selectId(id){
	
	document.getElementById('idagenda').value = id;

}
</script>

</head>
<body>
<%
String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Cancelamento Indisponível');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Cancelado com sucesso');"); 
	out.print("</script>");

}else{
	
}
res = null;
%>

<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<li><a href="agendamento.jsp?id=0">Agendamento Consulta</a>
			<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>
			<li><a href="meusAgendamentos.jsp">Meus Agendamentos</a>
			<li><a href="sair">Sair</a>
		</ul>
	</nav>
	<br>
	<br>
	<br>
<section class="form">
<center>
	<div class="section-title">
	       <h3>Meus Agendamentos</h3>
	</div>
	<br>
	<form action="cancelar" method="POST">
	<input type="hidden" name="idagenda" id="idagenda" value="">
	
	<table border=1><tr><th>Data Consulta</th><th>Horário</th><th>Nome Médico</th><th>Nome Especialidade</th><th>Status</th><th>Cancelar</th></tr>
	<%

		String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
		ArrayList<Agendamento> agenda = new ArrayList<Agendamento>();
		
		
		BuscaAgendamento bt = new BuscaAgendamento();
		
		agenda = bt.buscaAgendamento(cpf);
		
		String status = "Cancelado";		
		for(int i=0;i<agenda.size();i++) {
			
	%>
		 

		<tr>
	            <td><%=agenda.get(i).getDataformatada()%></td>
				<td><%=agenda.get(i).getHorario()%></td>
				<td><%=agenda.get(i).getNomeMedico()%></td>
				<td><%=agenda.get(i).getEspecialidade()%></td>
				<td><%=agenda.get(i).getStatus()%></td>
				<% if(agenda.get(i).getStatus().equals("Cancelado")){ %>
					<td></td>
				<% } else { %>
					<td><input type="submit" name="cancelar" value="Cancelar Agendamento" onclick="selectId('<%=agenda.get(i).getIdAgendamento()%>')"></td>
				<% } %>
		</tr>
		
	<% } %>

	</table>
	</form>
</center>
</section>

</body>
</html>