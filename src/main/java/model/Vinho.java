package model;

public class Vinho {
    private int id;
    private String nome;
    private String tipo;
    private String pais;
    private int safra;
    private double preco;
    private String descricao;

    public Vinho() {
    }

    public Vinho(int id, String nome, String tipo, String pais, int safra, double preco, String descricao) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.pais = pais;
        this.safra = safra;
        this.preco = preco;
        this.descricao = descricao;
    }

    public Vinho(String nome, String tipo, String pais, int safra, double preco, String descricao) {
        this.nome = nome;
        this.tipo = tipo;
        this.pais = pais;
        this.safra = safra;
        this.preco = preco;
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getSafra() {
        return safra;
    }

    public void setSafra(int safra) {
        this.safra = safra;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}