<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<jsp:include page="../modulos/header-estrutura.jsp" />
<title>Buscar agendamento</title>
</head>
<body>

	<jsp:include page="../modulos/header.jsp" />

	<div class="container">
		<div class="buscar" align="left">

			<c:if test="${not empty erro }">
				<div class="alert alert-danger" role="alert">${erro}</div>
			</c:if>
			<c:if test="${not empty info }">
				<div class="alert alert-info" role="alert">${info}</div>
			</c:if>

			<form:form id="buscarPacienteForm" role="form"
				servletReltiveAction="/nutricao/buscar" method="POST"
				cssClass="form-horizontal" class="inline">
				<select name="tipoPesquisa" cssClass="form-control">
					<option value="nome">Nome</option>
					<option value="cpf">CPF</option>
				</select>
				<input id="campo" name="campo" cssClass="form-control"
					placeholder="Digite sua busca aqui" size="40" required="required" autofocus="true"/>
				<button class="btn btn-primary" name="submit" type="submit" class="btn btn-primary"
					value="Buscar" >
					 Buscar
					 <span class="glyphicon glyphicon-search"/> 
				</button>
				
 			</form:form>

			<c:if test="${not empty agendamentos}">
				<div class="panel panel-default">

					<div class="panel-heading" align="center"></div>
					<form:form action="#" modelAttribute="agendamentos"></form:form>
					<!-- Table -->
					<table class="table" id="table" >
						<thead>
							<tr>
								<th>Nome</th>
								<th>Data</th>
								<th>Consulta</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="agendamento" items="${agendamentos}">
								<tr class="linha">
									<td><a href="<c:url value="#"></c:url>">${agendamento.paciente.pessoa.nome}
										</a>
									</td>
									<td>
										<a href="<c:url value="#"></c:url>">
											<fmt:formatDate type="date" value="${agendamento.data}" />
											<fmt:formatDate type="time" value="${agendamento.hora}" />
										</a>
									</td>
									<td>
									</td>
									<td>
									
										<a
										<fmt:formatDate type="date" value="${agendamento.data}" var="dataFormatada" />
										<fmt:formatDate type="time" pattern="HH:mm" value="${agendamento.hora}" var="horaFormatada" />
										data-data="${ dataFormatada}"
										data-hora="${ horaFormatada}"
										data-id="${ agendamento.id}"
										data-status="${ agendamento.status}"
										data-paciente="${agendamento.paciente.pessoa.id}"
										class="edita btn btn-info" 
										data-toggle="modal">Editar agendamento de consulta
										</a>
									</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div id="myModalEditar" class="modal fade">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                <h4 class="modal-title">Editar agendamento de consulta</h4>
					            </div>
					            <div class="modal-body">
					                <form:form servletRelativeAction="editar_agendamento" class="form-horizontal">					                    
					                    <input type="hidden" name="status" class="form-control" id="inputStatus">
					                    <input type="hidden" name="id" class="form-control" id="inputId">
					                    <input type="hidden" name="idPaciente" class="form-control" id="idPaciente">
					                    <div class="form-group">
					                        <label for="inputData" class="control-label col-xs-2">Data</label>
					                        <div class="col-xs-10">
					                        
					                            <input type="text" name="data" class="form-control" id="inputData" value="" placeholder="data">
					                        </div>
					                    </div>
					
					                    <div class="form-group">
					                        <label for="inputHora" class="control-label col-xs-2">Hora</label>
					                        <div class="col-xs-10">
					                            <input type="time" name="hora" class="form-control" id="inputHora" value="" placeholder="hora">
					                        </div>
					                    </div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Fechar</button>
											<button type="submit" class="btn btn-primary">Salvar</button>
										</div>
									</form:form>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	
	<jsp:include page="../modulos/footer.jsp" />

<script type="text/javascript"> 
$(document).ready(function(){
	$("a#m").click(function(){
		 var ident = $(this).data("ident");
		 $("#form input[type='hidden']").val(ident);
	});
	
	$("input#inputData").datepicker({
		format : "dd/mm/yyyy",
		todayBtn : "linked",
		autoclose : true,
		language : "pt-BR",
		todayHighlight : true,
	});

    $("a.edita").on('click', function(event) {
		console.log("testando modal");
        $("#myModalEditar #inputId").val($(this).data('id'));
        $("#myModalEditar #inputStatus").val($(this).data('status'));
        $("#myModalEditar #inputData").val($(this).data('data'));
        $("#myModalEditar #inputHora").val($(this).data('hora'));
        $("#myModalEditar #idPaciente").val($(this).data('paciente'));
        $("#myModalEditar").modal('show');
    });

});
</script>

</body>
</html>