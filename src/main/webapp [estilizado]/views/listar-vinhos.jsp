<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Vinho" %>

<%
    List<Vinho> vinhos = (List<Vinho>) request.getAttribute("vinhos");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vinhos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-stone-950 via-zinc-950 to-rose-950 text-white">

    <header class="border-b border-white/10 bg-black/20 backdrop-blur-md sticky top-0 z-20">
        <div class="max-w-7xl mx-auto px-6 py-4 flex flex-col md:flex-row gap-4 md:items-center md:justify-between">
            <div>
                <h1 class="text-3xl font-black text-amber-200">WineHouse</h1>
                <p class="text-zinc-300">Catálogo de vinhos cadastrados</p>
            </div>

            <div class="flex flex-wrap gap-3">
                <a href="<%= request.getContextPath() %>/index.jsp"
                   class="px-4 py-2 rounded-xl border border-white/15 hover:bg-white/10 transition">
                    Início
                </a>
                <a href="<%= request.getContextPath() %>/vinho?acao=novo"
                   class="px-4 py-2 rounded-xl bg-rose-700 hover:bg-rose-600 transition font-semibold">
                    + Novo vinho
                </a>
            </div>
        </div>
    </header>

    <main class="max-w-7xl mx-auto px-6 py-10">
        <%
            if (vinhos == null || vinhos.isEmpty()) {
        %>
            <div class="bg-white/10 border border-white/10 rounded-3xl p-10 text-center shadow-xl">
                <h2 class="text-2xl font-bold text-amber-200 mb-2">Nenhum vinho cadastrado</h2>
                <p class="text-zinc-300 mb-6">Sua adega está mais vazia que geladeira de fim de mês.</p>
                <a href="<%= request.getContextPath() %>/vinho?acao=novo"
                   class="inline-flex px-6 py-3 rounded-xl bg-rose-700 hover:bg-rose-600 transition font-semibold">
                    Cadastrar primeiro vinho
                </a>
            </div>
        <%
            } else {
        %>
            <div class="grid sm:grid-cols-2 xl:grid-cols-3 gap-6">
                <%
                    for (Vinho vinho : vinhos) {
                %>
                    <div class="bg-white/10 border border-white/10 rounded-3xl p-6 shadow-xl hover:-translate-y-1 transition">
                        <div class="flex items-start justify-between gap-4 mb-4">
                            <div>
                                <span class="inline-block px-3 py-1 rounded-full bg-amber-300/15 text-amber-200 text-xs font-semibold mb-3">
                                    <%= vinho.getTipo() %>
                                </span>
                                <h2 class="text-2xl font-bold leading-tight"><%= vinho.getNome() %></h2>
                            </div>

                            <div class="text-right">
                                <p class="text-zinc-400 text-sm">Safra</p>
                                <p class="text-lg font-bold"><%= vinho.getSafra() %></p>
                            </div>
                        </div>

                        <div class="space-y-2 text-zinc-300 mb-6">
                            <p><span class="text-zinc-400">País:</span> <%= vinho.getPais() %></p>
                            <p><span class="text-zinc-400">Preço:</span> R$ <%= String.format("%.2f", vinho.getPreco()) %></p>
                        </div>

                        <div class="flex flex-wrap gap-2">
                            <a href="<%= request.getContextPath() %>/vinho?acao=detalhes&id=<%= vinho.getId() %>"
                               class="px-4 py-2 rounded-xl bg-amber-500 text-stone-950 font-semibold hover:bg-amber-400 transition">
                                Detalhes
                            </a>

                            <a href="<%= request.getContextPath() %>/vinho?acao=editar&id=<%= vinho.getId() %>"
                               class="px-4 py-2 rounded-xl border border-white/15 hover:bg-white/10 transition">
                                Editar
                            </a>

                            <a href="<%= request.getContextPath() %>/vinho?acao=excluir&id=<%= vinho.getId() %>"
                               onclick="return confirm('Deseja realmente excluir este vinho?');"
                               class="px-4 py-2 rounded-xl bg-red-700/80 hover:bg-red-600 transition">
                                Excluir
                            </a>
                        </div>
                    </div>
                <%
                    }
                %>
            </div>
        <%
            }
        %>
    </main>

</body>
</html>