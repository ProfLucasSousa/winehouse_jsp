<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Vinho" %>
<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
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

    <a href="vinho?acao=listar">Voltar</a>
</body>
</html>