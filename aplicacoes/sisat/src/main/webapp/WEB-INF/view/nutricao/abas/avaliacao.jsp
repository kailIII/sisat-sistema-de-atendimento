<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="col-sm-12">
	<label>Paciente</label> <br/>
	<div class="col-sm-3">
		<label>Altura</label><input type="text" name="paciente.altura" size="10" value="${consultaNutricional.paciente.altura}" onkeypress="return digitos(event, this);">
	</div>
	<div class="col-sm-3">
		<label>Peso</label><input type="text" name="peso" size="10" value="${ consultaNutricional.peso }" onkeypress="return digitos(event, this);">
	</div>
	<div class="col-sm-3">
		<label>CC</label><input type="text" name="circunferenciaCintura" size="10" value="${ consultaNutricional.circunferenciaCintura }" onkeypress="return digitos(event, this);">
	</div>
</div>

<div class="col-sm-12">
	<div style="cursor: pointer;"></div> <br/>
	<input type="checkbox" name="medicamento" id="checkMedicamento" onclick="habilitar();" ${consultaNutricional.medicamento == 'TRUE' ? 'checked' : ''}/><label>Medicamentos</label>
	<input type="text" name="medicamentoComentario" size='123' id="inputTextMedicamento" value="${ consultaNutricional.medicamentoComentario }" ${consultaNutricional.medicamento == 'TRUE' ? '' : 'disabled'}/> <br/><br/>
</div>

<div class="col-sm-12">
	<label>Alterações Gastrointestinais</label> <br/>
	<div class="col-sm-2"><input type="checkbox" name="disfagia" ${consultaNutricional.disfagia == 'TRUE' ? 'checked' : ''} /><label>Disfagia</label></div>
	<div class="col-sm-2"><input type="checkbox" name="pirose" ${consultaNutricional.pirose == 'TRUE' ? 'checked' : ''} /><label>Pirose</label></div>
	<div class="col-sm-2"><input type="checkbox" name="nausea" ${consultaNutricional.nausea == 'TRUE' ? 'checked' : ''} /><label>Náusea</label></div>
	<div class="col-sm-2"><input type="checkbox" name="vomito" ${consultaNutricional.vomito == 'TRUE' ? 'checked' : ''} /><label>Vômitos</label></div>
	<div class="col-sm-2"><input type="checkbox" name="diarreia" ${consultaNutricional.diarreia == 'TRUE' ? 'checked' : ''} /><label>Diarreia</label></div>
	<div class="col-sm-2"><input type="checkbox" name="constipacao" ${consultaNutricional.constipacao == 'TRUE' ? 'checked' : ''} /><label>Constipação</label></div>
	
	<div class="col-sm-12" style="cursor: pointer;">
		<input class="col-sm-0" type="checkbox" name="mastigacao" id="checkMastigacao" onclick="habilitar();" ${consultaNutricional.mastigacao == 'TRUE' ? 'checked' : ''} /><label>Mastigação</label>
		<input type=text name="mastigacaoComentario" size='123' id="inputTextMastigacao" value="${ consultaNutricional.mastigacaoComentario }" ${consultaNutricional.mastigacao == 'TRUE' ? '' : 'disabled'}/>
	</div>
</div>

<div class="col-sm-12">
	<div style="cursor: pointer;"></div> <br/>
	<input type="checkbox" name="alergia" id="checkAlergia" onclick="habilitar();" ${consultaNutricional.alergia == 'TRUE' ? 'checked' : ''} /><label>Alergia Alimentar</label>
	<textarea rows="2" cols="140" name="alergiaComentario" ${consultaNutricional.alergia == 'TRUE' ? '' : 'disabled'} id="inputTextAlergia">${ consultaNutricional.alergiaComentario }</textarea>
</div>

<div class="col-sm-12">
	<label>Consumo de água</label><input type="text" name="agua" size="10" value="${ consultaNutricional.agua }" onkeypress="return digitos(event, this);"> 
</div>



<div class="col-sm-12">
	<div style="cursor: pointer;"></div>
		<input type="checkbox" name="atividadeFisica" id="checkAtividadeFisica" onclick="habilitar();" ${consultaNutricional.atividadeFisica == 'TRUE' ? 'checked' : ''}/><label>Atividade Física</label>
		<input type=text name="atividadeFisicaComentario" size='20' id="inputTextAtividadeFisica" value="${ consultaNutricional.atividadeFisicaComentario }" ${consultaNutricional.atividadeFisica == 'TRUE' ? '' : 'disabled'}/>

	<label>Frequência em dias</label>
	<select name="atividadeFisicaFrequenciaSemanal" id="atividadeFisicaFrequenciaSemanal" style="width: 70px" class="form-control-inline">
		<option value="${consultaNutricional.atividadeFisicaFrequenciaSemanal}">${consultaNutricional.atividadeFisicaFrequenciaSemanal}</option>
		<option value="0">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
	</select>
	<label>/semana</label>
</div>

<div class="col-sm-12">
	<div style="cursor: pointer;"></div>
		<input type="checkbox" name="carneVermelha" id="checkCarneVermelha" onclick="habilitar();" ${consultaNutricional.carneVermelha == 'TRUE' ? 'checked' : ''}/><label>Carne Vermelha</label>
		<input type=text name="carneVermelhaComentario" size='20' id="inputTextCarneVermelha" value="${ consultaNutricional.carneVermelhaComentario }" ${consultaNutricional.carneVermelha == 'TRUE' ? '' : 'disabled'}/>
	
	<label>Frequência em dias</label>
	<select name="carneVermelhaFrequenciaSemanal" id="carneVermelhaFrequenciaSemanal" style="width: 70px" class="form-control-inline">
		<option value="${consultaNutricional.carneVermelhaFrequenciaSemanal}">${consultaNutricional.carneVermelhaFrequenciaSemanal}</option>
		<option value="0">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
	</select>
	<label>/semana</label>
</div>

<div class="col-sm-12">
	<div style="cursor: pointer;"></div>
	<input type="checkbox" name="bebidaAlcoolica" id="checkBebidaAlcoolica" onclick="habilitar();"${consultaNutricional.bebidaAlcoolica == 'TRUE' ? 'checked' : ''}/><label>Bebida alcoólica</label>
	<input type=text name="bebidaAlcoolicaComentario" size='20' id="inputTextBebidaAlcoolica" value="${ consultaNutricional.bebidaAlcoolicaComentario }" ${consultaNutricional.bebidaAlcoolica == 'TRUE' ? '' : 'disabled'}/>

	<label>Frequência em dias</label>
	<select name="bebidaAlcoolicaFrequenciaSemanal" id="bebidaAlcoolicaFrequenciaSemanal" style="width: 70px" class="form-control-inline">
		<option value="${consultaNutricional.bebidaAlcoolicaFrequenciaSemanal}">${consultaNutricional.bebidaAlcoolicaFrequenciaSemanal}</option>
		<option value="0">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
	</select>
	<label>/semana</label>
</div>	

<div class="col-sm-12">
	<div style="cursor: pointer;"></div> <br/>
	<input type="checkbox" name="outrasPatologias" id="checkPatologia" onclick="habilitar(); "${consultaNutricional.outrasPatologias == 'TRUE' ? 'checked' : ''}/><label>Patologias</label><br/>
	<textarea rows="2" cols="140" name="outrasPatologiasComentario" id="inputTextPatologia" ${consultaNutricional.outrasPatologias == 'TRUE' ? '' : 'disabled'}>${ consultaNutricional.outrasPatologiasComentario }</textarea> <br/><br/>
</div>

<div class="col-sm-12">
	<label>Objetivo da Consulta</label> <br/>
	<textarea rows="2" cols="140" name="objetivoConsulta">${ consultaNutricional.objetivoConsulta }</textarea> <br/><br/>
</div>
