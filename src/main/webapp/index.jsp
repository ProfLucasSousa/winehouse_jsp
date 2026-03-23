<%@ page contentType="text/html;charset=UTF-8" %> 
<!-- Define que a resposta da página será HTML e usa UTF-8 (evita problema com acentos) -->

<!DOCTYPE html>
<html>
<head>
    <title>WineHouse</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>WineHouse</h1>
        <p>Catálogo de vinhos com cadastro, edição e busca.</p>

        <a href="vinho?acao=listar">
        <!-- Link que chama a Servlet (/vinho) com a ação "listar", iniciando o fluxo do sistema -->
            Entrar no sistema
        </a>

    </div>
</body>
</html>