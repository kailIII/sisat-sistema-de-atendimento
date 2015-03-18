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
<jsp:include page="../../modulos/header-estrutura.jsp" />
<title>Cadastro de Projetos</title>
</head>
<body>

	<jsp:include page="../../modulos/header.jsp" />



	<div class="container">
		<div class="novo-paciente" align="left">

			<c:if test="${not empty erro }">
				<div class="alert alert-danger" role="alert">${erro}</div>
			</c:if>
			<c:if test="${not empty info }">
				<div class="alert alert-info" role="alert">${info}</div>
			</c:if>

			<form:form id="adicionarPacienteForm" role="form"
				commandName="paciente"
				servletRelativeAction="/nutricao/paciente/cadastrar" method="POST"
				cssClass="form-horizontal">

				<div class="form-group">
					<label for="pessoa.cpf" class="col-sm-2 control-label">Cpf:</label>
					<div class="col-sm-10">
						<form:input id="pessoa.cpf" path="pessoa.cpf"
							cssClass="form-control" placeholder="Cpf do paciente" />
					</div>
				</div>

				<div class="form-group">
					<label for="altura" class="col-sm-2 control-label">Altura:</label>
					<div class="col-sm-10">
						<form:input type="number" id="altura" path="altura" cssClass="form-control" onkeypress="return digitos(event, this);"
							placeholder="Altura do paciente" />
					</div>
				</div>

				<div class="controls">
					<input name="submit" type="submit" class="btn btn-primary"
						value="Cadastrar" /> <a href="<c:url value="/nutricao/"></c:url>"
						class="btn btn-default">Cancelar</a>
				</div>

			</form:form>



		</div>
	</div>







	<jsp:include page="../../modulos/footer.jsp" />
	
	<script type="text/javascript">
	function digitos(event){
		  if (window.event) {
		    // IE
		    key = event.keyCode;
		  } 
		  else if (event.which) {
		    // netscape
		    key = event.which;
		  }
		  if (key != 8 || key != 13 || key < 48 || key > 57)
		    return (((key > 47) && (key < 58)) || (key == 8 ) || (key == 13) || (key == 46));
		    return true;
		}
	</script>

</body>
</html>