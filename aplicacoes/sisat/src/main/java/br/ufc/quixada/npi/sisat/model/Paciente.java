package br.ufc.quixada.npi.sisat.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import br.ufc.quixada.npi.sisat.model.Agendamento;


@Entity
public class Paciente implements Serializable {
	@Id
    private Long id;
	
	@MapsId
	@OneToOne(mappedBy = "paciente")
	@JoinColumn(name = "id")
	private Pessoa pessoa;
	
	
	private double altura;

	@OneToMany(mappedBy="paciente")
	private List<ConsultaNutricional> consultas;
	
	
	@OneToMany(mappedBy="paciente")
	private List<Agendamento> agendamentos;
	
	
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	public double getAltura() {
		return altura;
	}
	public void setAltura(double altura) {
		this.altura = altura;
	}
	public List<ConsultaNutricional> getConsultas() {
		return consultas;
	}
	public void setConsultas(List<ConsultaNutricional> consultas) {
		this.consultas = consultas;
	}
	public List<Agendamento> getAgendamentos() {
		return agendamentos;
	}
	public void setAgendamentos(List<Agendamento> agendamentos) {
		this.agendamentos = agendamentos;
	}
}