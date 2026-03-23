<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Define que a página retorna HTML com UTF-8 -->

<%@ page import="java.util.List" %>
<!-- Importa a interface List -->

<%@ page import="model.Vinho" %>
<!-- Importa a classe Vinho -->

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Vinhos</title>
</head>
<body>
    <h1>Lista de Vinhos</h1>

    <a href="vinho?acao=novo">
    <!-- Chama a Servlet para abrir o formulário de cadastro -->
        Cadastrar novo vinho
    </a>

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
            // Recupera a lista de vinhos enviada pelo Servlet

            for (Vinho vinho : vinhos) {
            // Percorre a lista de vinhos
        %>

        <tr>
            <td><%= vinho.getId() %></td>
            <td><%= vinho.getNome() %></td>
            <td><%= vinho.getTipo() %></td>
            <td><%= vinho.getPais() %></td>
            <td><%= vinho.getSafra() %></td>
            <td>R$ <%= vinho.getPreco() %></td>
            <!-- Exibe os dados de cada vinho -->

            <td>
                <a href="vinho?acao=detalhes&id=<%= vinho.getId() %>">Detalhes</a>
                <!-- Abre a página de detalhes -->

                <a href="vinho?acao=editar&id=<%= vinho.getId() %>">Editar</a>
                <!-- Abre o formulário preenchido -->

                <a href="vinho?acao=excluir&id=<%= vinho.getId() %>">Excluir</a>
                <!-- Remove o vinho -->
            </td>
        </tr>

        <%
            }
        %>
    </table>
</body>
</html>