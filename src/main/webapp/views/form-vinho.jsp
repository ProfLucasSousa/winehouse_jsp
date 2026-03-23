<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Vinho" %>
<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
    boolean edicao = vinho != null;
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= edicao ? "Editar" : "Cadastrar" %> Vinho</title>
</head>
<body>
    <h1><%= edicao ? "Editar" : "Cadastrar" %> Vinho</h1>

    <form action="vinho" method="post">
        <input type="hidden" name="id" value="<%= edicao ? vinho.getId() : "" %>">

        <label>Nome:</label><br>
        <input type="text" name="nome" value="<%= edicao ? vinho.getNome() : "" %>"><br><br>

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
    </form>

    <br>
    <a href="vinho?acao=listar">Voltar</a>
</body>
</html>