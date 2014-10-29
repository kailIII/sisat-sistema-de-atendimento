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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Agendamento</title>
</head>
<body>

	<form:form servletRelativeAction="/nutricao/editarAgendamento" method="POST" modelAttribute="agendamento">
		<div class="col-sm-12">
			<label>Data</label><input type="text" name="data" class="data" value="${ agendamento.data}">		
			<label>Hora</label><input type="time" name="hora" value="${ agendamento.hora}">
	    </div>
	
		<div class="col-xs-offset-0 col-xs-10" align="center">
				<button type="submit" class="btn btn-success">Editar</button>
		</div>
	</form:form>
	
</body>
</html>