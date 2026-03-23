<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Define que a página retorna HTML com encoding UTF-8 -->

<%@ page import="model.Vinho" %>
<!-- Importa a classe Vinho para poder usar no JSP -->

<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
    // Recupera o objeto "vinho" enviado pelo Servlet via request
%>

<!DOCTYPE html>
<html>
<head>
    <title>Detalhes do Vinho</title>
</head>
<body>
    <h1>Detalhes do Vinho</h1>

    <p><strong>Nome:</strong> <%= vinho.getNome() %></p>
    <p><strong>Tipo:</strong> <%= vinho.getTipo() %></p>
    <p><strong>País:</strong> <%= vinho.getPais() %></p>
    <p><strong>Safra:</strong> <%= vinho.getSafra() %></p>
    <p><strong>Preço:</strong> R$ <%= vinho.getPreco() %></p>
    <p><strong>Descrição:</strong> <%= vinho.getDescricao() %></p>
    <!-- Exibe os dados do vinho usando Expressões JSP -->

    <a href="vinho?acao=listar">
    <!-- Link que chama a Servlet para voltar à listagem -->
        Voltar
    </a>
</body>
</html>