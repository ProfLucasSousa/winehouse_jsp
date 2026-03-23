<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Vinho" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Vinhos</title>
</head>
<body>
    <h1>Lista de Vinhos</h1>
    <a href="vinho?acao=novo">Cadastrar novo vinho</a>
    <br><br>

    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Tipo</th>
            <th>País</th>
            <th>Safra</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>

        <%
            List<Vinho> vinhos = (List<Vinho>) request.getAttribute("vinhos");
            for (Vinho vinho : vinhos) {
        %>
        <tr>
            <td><%= vinho.getId() %></td>
            <td><%= vinho.getNome() %></td>
            <td><%= vinho.getTipo() %></td>
            <td><%= vinho.getPais() %></td>
            <td><%= vinho.getSafra() %></td>
            <td>R$ <%= vinho.getPreco() %></td>
            <td>
                <a href="vinho?acao=detalhes&id=<%= vinho.getId() %>">Detalhes</a>
                <a href="vinho?acao=editar&id=<%= vinho.getId() %>">Editar</a>
                <a href="vinho?acao=excluir&id=<%= vinho.getId() %>">Excluir</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>