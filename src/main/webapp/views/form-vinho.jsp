<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Define que a página retorna HTML com UTF-8 -->

<%@ page import="model.Vinho" %>
<!-- Importa a classe Vinho -->

<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
    // Recupera o objeto vinho enviado pelo Servlet

    boolean edicao = vinho != null;
    // Define se é edição (true) ou cadastro (false)
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= edicao ? "Editar" : "Cadastrar" %> Vinho</title>
    <!-- Título dinâmico dependendo da ação -->
</head>
<body>
    <h1><%= edicao ? "Editar" : "Cadastrar" %> Vinho</h1>
    <!-- Texto do formulário muda conforme edição ou cadastro -->

    <form action="vinho" method="post">
    <!-- Envia os dados para a Servlet via POST -->

        <input type="hidden" name="id" value="<%= edicao ? vinho.getId() : "" %>">
        <!-- Campo oculto para enviar o ID na edição -->

        <label>Nome:</label><br>
        <input type="text" name="nome" value="<%= edicao ? vinho.getNome() : "" %>"><br><br>
        <!-- Preenche automaticamente se for edição -->

        <label>Tipo:</label><br>
        <input type="text" name="tipo" value="<%= edicao ? vinho.getTipo() : "" %>"><br><br>

        <label>País:</label><br>
        <input type="text" name="pais" value="<%= edicao ? vinho.getPais() : "" %>"><br><br>

        <label>Safra:</label><br>
        <input type="number" name="safra" value="<%= edicao ? vinho.getSafra() : "" %>"><br><br>

        <label>Preço:</label><br>
        <input type="number" step="0.01" name="preco" value="<%= edicao ? vinho.getPreco() : "" %>"><br><br>

        <label>Descrição:</label><br>
        <textarea name="descricao"><%= edicao ? vinho.getDescricao() : "" %></textarea><br><br>

        <button type="submit">Salvar</button>
        <!-- Envia o formulário -->
    </form>

    <br>
    <a href="vinho?acao=listar">
    <!-- Volta para a listagem chamando a Servlet -->
        Voltar
    </a>
</body>
</html>