package model;

// Classe que representa um vinho no sistema
// É um "POJO" (Plain Old Java Object), usado para transportar dados
public class Vinho {

    // Atributos da classe (representam as colunas da tabela no banco)
    private int id;
    private String nome;
    private String tipo;
    private String pais;
    private int safra;
    private double preco;
    private String descricao;

    // Construtor vazio (necessário para frameworks, JSP e uso manual)
    public Vinho() {
    }

    // Construtor completo (inclui o ID)
    // Usado geralmente quando os dados vêm do banco
    public Vinho(int id, String nome, String tipo, String pais, int safra, double preco, String descricao) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.pais = pais;
        this.safra = safra;
        this.preco = preco;
        this.descricao = descricao;
    }

    // Construtor sem ID
    // Usado normalmente para criar novos registros antes de salvar no banco
    public Vinho(String nome, String tipo, String pais, int safra, double preco, String descricao) {
        this.nome = nome;
        this.tipo = tipo;
        this.pais = pais;
        this.safra = safra;
        this.preco = preco;
        this.descricao = descricao;
    }

    // ===== GETTERS E SETTERS =====
    // Métodos para acessar e modificar os atributos (encapsulamento)

    // Retorna o ID do vinho
    public int getId() {
        return id;
    }

    // Define o ID do vinho
    public void setId(int id) {
        this.id = id;
    }

    // Retorna o nome do vinho
    public String getNome() {
        return nome;
    }

    // Define o nome do vinho
    public void setNome(String nome) {
        this.nome = nome;
    }

    // Retorna o tipo do vinho (Tinto, Branco, etc)
    public String getTipo() {
        return tipo;
    }

    // Define o tipo do vinho
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    // Retorna o país de origem
    public String getPais() {
        return pais;
    }

    // Define o país de origem
    public void setPais(String pais) {
        this.pais = pais;
    }

    // Retorna a safra do vinho
    public int getSafra() {
        return safra;
    }

    // Define a safra do vinho
    public void setSafra(int safra) {
        this.safra = safra;
    }

    // Retorna o preço do vinho
    public double getPreco() {
        return preco;
    }

    // Define o preço do vinho
    public void setPreco(double preco) {
        this.preco = preco;
    }

    // Retorna a descrição do vinho
    public String getDescricao() {
        return descricao;
    }

    // Define a descrição do vinho
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}