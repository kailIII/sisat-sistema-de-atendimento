package br.ufc.quixada.npi.sisat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.npi.service.GenericService;
import br.ufc.quixada.npi.sisat.enumeration.Classificacao;
import br.ufc.quixada.npi.sisat.model.Agendamento;
import br.ufc.quixada.npi.sisat.model.Alimentacao;
import br.ufc.quixada.npi.sisat.model.ConsultaNutricional;
import br.ufc.quixada.npi.sisat.model.FrequenciaAlimentar;
import br.ufc.quixada.npi.sisat.model.FrequenciaAlimentar.Refeicoes;
import br.ufc.quixada.npi.sisat.model.Paciente;
import br.ufc.quixada.npi.sisat.model.Pessoa;
import br.ufc.quixada.npi.sisat.service.ConsultaNutricionalService;
import br.ufc.quixada.npi.sisat.service.PacienteService;
import br.ufc.quixada.npi.sisat.service.PessoaService;

@Controller
@RequestMapping("nutricao")
public class NutricaoController {
	
	@Inject
	private PacienteService pacienteService;
	
	@Inject
	private PessoaService pessoaService;
	
	@Inject
	private ConsultaNutricionalService consultaNutricionalService;
	
	@Inject
	private GenericService<Agendamento> serviceAgendamento;
	
	@Inject
	private GenericService<FrequenciaAlimentar> frequenciaService;
	
	@Inject
	private GenericService<Alimentacao> alimentacaoService;
	
	@Inject
	private GenericService<Agendamento> agendamentoService;

	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String index() {
		return "nutricao/buscar";
	}
	
	@RequestMapping(value = {"/buscar"}, method = RequestMethod.GET)
	public String buscarPaciente(Model model) {	
		model.addAttribute("agendamento", new Agendamento());
		return "nutricao/buscar";
	}
	
	@RequestMapping(value = "/buscar", method = RequestMethod.POST)
	public String buscarPaciente(@RequestParam("tipoPesquisa") String tipoPesquisa, @RequestParam("campo") String campo, ModelMap map, RedirectAttributes redirectAttributes) {
		List<Pessoa> pessoas = null;
		map.addAttribute("agendamento", new Agendamento());
		if(tipoPesquisa.equals("cpf")){
			pessoas = pessoaService.getPessoasByCpf(campo);
		}else {
			pessoas = pessoaService.getPessoasByNome(campo);
		}
		if(!pessoas.isEmpty()){
			map.addAttribute("pessoas",pessoas); 
		}else{
			redirectAttributes.addFlashAttribute("erro", "Paciente de " + tipoPesquisa + " " + campo + " não encontrado.");
			return "redirect:/nutricao/buscar";
		}
		return "/nutricao/buscar";
	}
	
	@RequestMapping(value = {"{id}/agendar_consulta"}, method = RequestMethod.GET)
	public String agendamento(Model model, @PathVariable("id") Long id) {
		model.addAttribute("agendamento", new Agendamento());
		model.addAttribute("paciente", new Pessoa());
		return "nutricao/agendar_consulta";
	}
	
//	@RequestMapping(value = {"{id}/age"}, method = RequestMethod.GET)
//	public String agendamentoEdita(Model model, @PathVariable("id") Long id) {
//		model.addAttribute("agendamento", serviceAgendamento.find(Agendamento.class, id));
//		return "nutricao/agendar_consulta";
//	}
	
	@RequestMapping(value = "/agendar_buscar", method = RequestMethod.POST)
	public String buscarPessoa(@RequestParam("identificar") Long id, @Valid @ModelAttribute("agendamento") Agendamento agendamento, BindingResult result) {
		Paciente paciente = pacienteService.find(Paciente.class, id);
		if(paciente == null){
			paciente = new Paciente();
			paciente.setPessoa(pessoaService.find(Pessoa.class, id));
			pacienteService.save(paciente);
		} 
		agendamento.setPaciente(paciente);
		serviceAgendamento.save(agendamento);
		return "redirect:/nutricao/buscar";
	}
	
	/*
	@RequestMapping(value = {"/agendar"}, method = RequestMethod.POST)
	public String agendamento(@ModelAttribute("paciente") Pessoa paciente, @ModelAttribute("agendamento") Agendamento agendamento ) {
		System.out.println(paciente.toString());
		return "nutricao/agendar_consulta";
	}
	*/

	@RequestMapping(value = {"/{id}/editarAgendamento"}, method = RequestMethod.GET)
	public String editarAgendamento(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes){
		Agendamento agendamento = agendamentoService.find(Agendamento.class, id);
		model.addAttribute("agendamento", agendamento);
		return "/nutricao/editarAgendamento";
	}
	
	@RequestMapping(value = {"/editarAgendamento"}, method = RequestMethod.POST)
	public String editarAgendamento(@ModelAttribute("agendamento") Agendamento agendamento, @RequestParam("id") Long id){
		agendamentoService.update(agendamento);
		return "/nutricao/editarAgendamento";
	}
	
	@RequestMapping(value = {"/deletarAgendamento"}, method = RequestMethod.POST)
	public String deletarAgendamento(@ModelAttribute("agendamento") Agendamento agendamento, RedirectAttributes redirectAttributes){
		agendamento = agendamentoService.find(Agendamento.class, agendamento.getId());
		agendamentoService.delete(agendamento);
		redirectAttributes.addFlashAttribute("success", "Agendamento deletado com sucesso");
		return "redirect:/nutricao/buscar_agendamento";
	}
	
	//buscar agendamento	//IsmaelRS
	@RequestMapping(value = {"/buscar_agendamento"}, method = RequestMethod.GET)
	public String buscarAgendamento(Model model) {	
		model.addAttribute("agendamento", new Agendamento());
		return "nutricao/buscar_agendamento";
	}
	//buscar agendamento	//IsmaelRS
	@RequestMapping(value = "/buscar_agendamento", method = RequestMethod.POST)
	public String buscarAgendamento(@RequestParam("tipoPesquisa") String tipoPesquisa, @RequestParam("campo") String campo, ModelMap map, RedirectAttributes redirectAttributes) {
		List<Pessoa> pessoas = null;
		map.addAttribute("agendamento", new Agendamento());
		if(tipoPesquisa.equals("cpf")){
			pessoas = pessoaService.getPessoasByCpf(campo);
		}else {
			pessoas = pessoaService.getPessoasByNome(campo);
		}
		if(pessoas.isEmpty()){
			redirectAttributes.addFlashAttribute("erro", "Paciente de " + tipoPesquisa + " " + campo + " não encontrado.");
			return "redirect:/nutricao/buscar_agendamento";
		}
		List<Agendamento> agendamentos = new ArrayList<Agendamento>();
		for (Pessoa pessoa : pessoas) {
			if(pessoa.getPaciente() != null && !pessoa.getPaciente().getAgendamentos().isEmpty()){
				agendamentos.addAll(pessoa.getPaciente().getAgendamentos());
			}

		}
		System.out.println("agendamenstos: " + agendamentos.toString());
		map.addAttribute("agendamentos", agendamentos); 
		return "/nutricao/buscar_agendamento";
	}

	@RequestMapping(value = {"/{id}/detalhes"})
	public String getDetalhes(Pessoa p, @PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes){
		Pessoa pessoa = pessoaService.find(Pessoa.class, id);
		if(pessoa == null){
			redirectAttributes.addFlashAttribute("erro", "Paciente não encontrado.");
			return "redirect:/nutricao/buscar";
		}
		model.addAttribute("pessoa", pessoa);
		return "nutricao/detalhes";
	}
	
	@RequestMapping(value = {"/consulta"}, method = RequestMethod.GET)
	public String consulta(Model model, HttpSession session) {	
		model.addAttribute("consulta", new ConsultaNutricional());
		model.addAttribute("classificacao", Classificacao.values());
		model.addAttribute("refeicoes", Refeicoes.values());
		return "nutricao/consulta";
	}

	@RequestMapping(value = {"/{id}/realizar"}, method = RequestMethod.GET)
	public void realizarConsulta(Model model, @PathVariable("id") Long id) {
		Pessoa pessoa = pessoaService.find(Pessoa.class, id);
		Paciente paciente = new Paciente();
		paciente.setPessoa(pessoa);
		pacienteService.save(paciente);
	}

	@RequestMapping(value = {"/consulta"}, method = RequestMethod.POST)
	public String consulta(@ModelAttribute("consulta") ConsultaNutricional consulta, BindingResult result) {
		if (result.hasErrors()) {
			return ("/paciente/cadastrar");
		}
		if(consulta.getAgua().length()==0){
			consulta.setAgua(null);
		}
		if(consulta.getMedicamentoComentario()!=null && consulta.getMedicamentoComentario().isEmpty()){
			consulta.setMedicamentoComentario(null);
		}
		if(consulta.getMastigacaoComentario()!=null && consulta.getMastigacaoComentario().isEmpty()){
			consulta.setMastigacaoComentario(null);
		}
		if(consulta.getAlergiaComentario()!=null && consulta.getAlergiaComentario().isEmpty()){
			consulta.setAlergiaComentario(null);
		}
		if(consulta.getCarneVermelhaComentario()!=null && consulta.getCarneVermelhaComentario().isEmpty()){
			consulta.setCarneVermelhaComentario(null);
		}
		if(consulta.getAtividadeFisicaComentario()!=null && consulta.getAtividadeFisicaComentario().isEmpty()){
			consulta.setAtividadeFisicaComentario(null);
		}
		if(consulta.getBebidaAlcoolicaComentario()!=null && consulta.getBebidaAlcoolicaComentario().isEmpty()){
			consulta.setBebidaAlcoolicaComentario(null);
		}
		consultaNutricionalService.save(consulta);
		if (consulta.getFrequencias() != null) {
			for (FrequenciaAlimentar frequenciaAlimentar : consulta.getFrequencias()){
				frequenciaAlimentar.setConsultaNutricional(consulta);
				frequenciaService.update(frequenciaAlimentar );
				for (Alimentacao alimentacao : frequenciaAlimentar.getAlimentos()) {
					alimentacao.setFrequenciaAlimentar(frequenciaAlimentar);
					alimentacaoService.update(alimentacao);
				}
			}
		}
		return "nutricao/consulta";
	}
}