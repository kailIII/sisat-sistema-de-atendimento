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
	
	//gets and sets
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
	
	@Override
	public String toString() {
		return "Paciente [id=" + id + ", pessoa=" + pessoaToString() + ", consultas="
				+ consultas + ", altura=" + altura + "]";
	}

	private String pessoaToString() {
		return "Pessoa [id=" + id + ", login=" + pessoa.getLogin()
				+ ", password=" + pessoa.getPassword() + ", papeis="
				+ pessoa.getPapeis() + ", servidores=" + pessoa.getServidores()
				+ ", cpf=" + pessoa.getCpf() + ", nome=" + pessoa.getNome()
				+ ", email=" + pessoa.getEmail() + ", sexo=" + pessoa.getSexo()
				+ ", dataNascimento=" + pessoa.getDataNascimento()
				+ ", telefone=" + pessoa.getTelefone() + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
}