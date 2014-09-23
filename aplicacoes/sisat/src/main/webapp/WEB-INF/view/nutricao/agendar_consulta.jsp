<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta charset="UTF-8"/>
	<jsp:include page="../modulos/header-estrutura.jsp" />
	<title>Agendar consulta</title>
</head>

<body>
	<jsp:include page="../modulos/header.jsp" />
	<div class="container">
		<div align="center">
			<div class="col-sm-12">
				<h1><strong>Agendamento de Consulta</strong></h1>
			</div>
	
			<form:form servletRelativeAction="agendar_buscar" method="POST">
			<div class="col-sm-12">
				<div class="col-sm-12">
				<select name="tipoPesquisa" cssClass="form-control">
					<option value="nome">Nome</option>
					<option value="cpf">CPF</option>
				</select>
					<input type="text" name="campo" size="28"/>
					<button class="btn">Pesquisar</button>
				</div>
			</div>
			</form:form>
						
<table class="table">
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="pessoa" items="${pessoas}">
				<tr class="linha">
					<td><a href="">${pessoa.nome}</a></td>
					<td>${pessoa.nome}</td>
					<td>${pessoa.cpf}</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>

			<form:form servletRelativeAction="agendar" method="POST" >			
			<div>
				<div class="col-sm-12">
					<div class="col-sm-12">
						<label>Nome</label><input type="text" name="nome" size="48"/>
						<input type="hidden" name="status" value="00"/>
					</div>
				</div>
				<div class="col-sm-12">
					<label>Data</label><input type="date" name="data">		
					<label>Hora</label><input type="time" name="hora">
				</div>
			</div>
				<button type="submit" class="btn btn-success">Enviar</button>
				<button type="submit" class="btn">Limpar</button>
				</form:form>
				
		</div>
	</div>
</body>

</html>