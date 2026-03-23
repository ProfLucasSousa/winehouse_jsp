<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Vinho" %>

<%
    Vinho vinho = (Vinho) request.getAttribute("vinho");
    boolean edicao = vinho != null;
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= edicao ? "Editar Vinho" : "Cadastrar Vinho" %></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-zinc-950 via-stone-950 to-rose-950 text-white">

    <div class="max-w-3xl mx-auto px-6 py-10">
        <div class="mb-8 flex items-center justify-between gap-4">
            <div>
                <h1 class="text-3xl md:text-4xl font-black text-amber-200">
                    <%= edicao ? "Editar vinho" : "Cadastrar vinho" %>
                </h1>
                <p class="text-zinc-300 mt-2">
                    <%= edicao ? "Atualize os dados do rótulo selecionado." : "Preencha os dados para adicionar um novo vinho ao catálogo." %>
                </p>
            </div>

            <a href="<%= request.getContextPath() %>/vinho?acao=listar"
               class="px-4 py-2 rounded-xl border border-white/15 hover:bg-white/10 transition whitespace-nowrap">
                Voltar
            </a>
        </div>

        <div class="bg-white/10 border border-white/10 rounded-3xl p-8 shadow-2xl backdrop-blur-sm">
            <form action="<%= request.getContextPath() %>/vinho" method="post" class="space-y-6">
                
                <input type="hidden" name="id" value="<%= edicao ? vinho.getId() : "" %>">

                <div>
                    <label class="block mb-2 text-sm text-zinc-300 font-medium">Nome do vinho</label>
                    <input
                        type="text"
                        name="nome"
                        required
                        value="<%= edicao ? vinho.getNome() : "" %>"
                        class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500"
                        placeholder="Ex: Cabernet Sauvignon Reserva">
                </div>

                <div class="grid md:grid-cols-2 gap-6">
                    <div>
                        <label class="block mb-2 text-sm text-zinc-300 font-medium">Tipo</label>
                        <select
                            name="tipo"
                            required
                            class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500">
                            <option value="">Selecione</option>
                            <option value="Tinto" <%= edicao && "Tinto".equals(vinho.getTipo()) ? "selected" : "" %>>Tinto</option>
                            <option value="Branco" <%= edicao && "Branco".equals(vinho.getTipo()) ? "selected" : "" %>>Branco</option>
                            <option value="Rosé" <%= edicao && "Rosé".equals(vinho.getTipo()) ? "selected" : "" %>>Rosé</option>
                            <option value="Espumante" <%= edicao && "Espumante".equals(vinho.getTipo()) ? "selected" : "" %>>Espumante</option>
                        </select>
                    </div>

                    <div>
                        <label class="block mb-2 text-sm text-zinc-300 font-medium">País</label>
                        <input
                            type="text"
                            name="pais"
                            required
                            value="<%= edicao ? vinho.getPais() : "" %>"
                            class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500"
                            placeholder="Ex: Chile">
                    </div>
                </div>

                <div class="grid md:grid-cols-2 gap-6">
                    <div>
                        <label class="block mb-2 text-sm text-zinc-300 font-medium">Safra</label>
                        <input
                            type="number"
                            name="safra"
                            required
                            min="1900"
                            max="2100"
                            value="<%= edicao ? vinho.getSafra() : "" %>"
                            class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500"
                            placeholder="Ex: 2021">
                    </div>

                    <div>
                        <label class="block mb-2 text-sm text-zinc-300 font-medium">Preço</label>
                        <input
                            type="number"
                            name="preco"
                            required
                            step="0.01"
                            min="0"
                            value="<%= edicao ? vinho.getPreco() : "" %>"
                            class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500"
                            placeholder="Ex: 89.90">
                    </div>
                </div>

                <div>
                    <label class="block mb-2 text-sm text-zinc-300 font-medium">Descrição</label>
                    <textarea
                        name="descricao"
                        rows="5"
                        class="w-full px-4 py-3 rounded-2xl bg-zinc-900/80 border border-white/10 focus:outline-none focus:ring-2 focus:ring-rose-500 resize-none"
                        placeholder="Descreva o vinho..."><%= edicao && vinho.getDescricao() != null ? vinho.getDescricao() : "" %></textarea>
                </div>

                <div class="flex flex-wrap gap-3 pt-2">
                    <button
                        type="submit"
                        class="px-6 py-3 rounded-2xl bg-rose-700 hover:bg-rose-600 transition font-semibold shadow-lg shadow-rose-950/40">
                        <%= edicao ? "Salvar alterações" : "Cadastrar vinho" %>
                    </button>

                    <a href="<%= request.getContextPath() %>/vinho?acao=listar"
                       class="px-6 py-3 rounded-2xl border border-white/15 hover:bg-white/10 transition font-semibold">
                        Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>