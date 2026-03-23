<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Vinho" %>

<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes do Vinho</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-stone-950 via-zinc-950 to-rose-950 text-white">

    <div class="max-w-5xl mx-auto px-6 py-10">
        <div class="mb-8 flex flex-wrap items-center justify-between gap-4">
            <div>
                <p class="text-zinc-400 text-sm uppercase tracking-wider">Detalhes do vinho</p>
                <h1 class="text-4xl font-black text-amber-200 mt-2"><%= vinho.getNome() %></h1>
            </div>

            <div class="flex gap-3">
                <a href="<%= request.getContextPath() %>/vinho?acao=editar&id=<%= vinho.getId() %>"
                   class="px-5 py-3 rounded-2xl bg-rose-700 hover:bg-rose-600 transition font-semibold">
                    Editar
                </a>

                <a href="<%= request.getContextPath() %>/vinho?acao=listar"
                   class="px-5 py-3 rounded-2xl border border-white/15 hover:bg-white/10 transition font-semibold">
                    Voltar
                </a>
            </div>
        </div>

        <div class="grid lg:grid-cols-3 gap-6">
            <div class="lg:col-span-2 bg-white/10 border border-white/10 rounded-3xl p-8 shadow-2xl">
                <h2 class="text-2xl font-bold mb-6">Informações gerais</h2>

                <div class="grid sm:grid-cols-2 gap-5">
                    <div class="bg-black/20 rounded-2xl p-5 border border-white/10">
                        <p class="text-zinc-400 text-sm">Tipo</p>
                        <p class="text-xl font-bold mt-1"><%= vinho.getTipo() %></p>
                    </div>

                    <div class="bg-black/20 rounded-2xl p-5 border border-white/10">
                        <p class="text-zinc-400 text-sm">País</p>
                        <p class="text-xl font-bold mt-1"><%= vinho.getPais() %></p>
                    </div>

                    <div class="bg-black/20 rounded-2xl p-5 border border-white/10">
                        <p class="text-zinc-400 text-sm">Safra</p>
                        <p class="text-xl font-bold mt-1"><%= vinho.getSafra() %></p>
                    </div>

                    <div class="bg-black/20 rounded-2xl p-5 border border-white/10">
                        <p class="text-zinc-400 text-sm">Preço</p>
                        <p class="text-xl font-bold mt-1">R$ <%= String.format("%.2f", vinho.getPreco()) %></p>
                    </div>
                </div>

                <div class="mt-6 bg-black/20 rounded-2xl p-5 border border-white/10">
                    <p class="text-zinc-400 text-sm mb-2">Descrição</p>
                    <p class="text-zinc-200 leading-relaxed">
                        <%= (vinho.getDescricao() != null && !vinho.getDescricao().trim().isEmpty())
                                ? vinho.getDescricao()
                                : "Este vinho ainda não possui descrição cadastrada." %>
                    </p>
                </div>
            </div>

            <div class="bg-white/10 border border-white/10 rounded-3xl p-8 shadow-2xl flex flex-col justify-between">
                <div>
                    <span class="inline-block px-3 py-1 rounded-full bg-amber-300/15 text-amber-200 text-xs font-semibold mb-4">
                        ID #<%= vinho.getId() %>
                    </span>

                    <h3 class="text-2xl font-bold mb-3">Resumo do rótulo</h3>
                    <p class="text-zinc-300 leading-relaxed">
                        Um rótulo cadastrado no catálogo da WineHouse, pronto para consulta, edição e gerenciamento.
                    </p>
                </div>

                <div class="mt-8 space-y-3">
                    <a href="<%= request.getContextPath() %>/vinho?acao=editar&id=<%= vinho.getId() %>"
                       class="block w-full text-center px-5 py-3 rounded-2xl bg-rose-700 hover:bg-rose-600 transition font-semibold">
                        Editar este vinho
                    </a>

                    <a href="<%= request.getContextPath() %>/vinho?acao=excluir&id=<%= vinho.getId() %>"
                       onclick="return confirm('Deseja realmente excluir este vinho?');"
                       class="block w-full text-center px-5 py-3 rounded-2xl bg-red-700/80 hover:bg-red-600 transition font-semibold">
                        Excluir este vinho
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>