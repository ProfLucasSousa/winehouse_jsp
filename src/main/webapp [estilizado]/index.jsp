<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WineHouse</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-rose-950 via-stone-950 to-zinc-900 text-white">

    <section class="min-h-screen flex items-center justify-center px-6">
        <div class="max-w-6xl w-full grid md:grid-cols-2 gap-10 items-center">
            
            <div class="space-y-6">
                <span class="inline-block px-4 py-1 rounded-full bg-white/10 text-amber-200 text-sm border border-white/10">
                    Sistema Web com JSP + Servlets + MySQL
                </span>

                <h1 class="text-4xl md:text-6xl font-black leading-tight">
                    WineHouse
                </h1>

                <p class="text-zinc-300 text-lg leading-relaxed max-w-xl">
                    Um sistema de gerenciamento de vinhos com cadastro, listagem, edição, exclusão e visualização de detalhes.
                    Simples de usar, bonito na medida e sem cara de formulário de 2009.
                </p>

                <div class="flex flex-wrap gap-4">
                    <a href="vinho?acao=listar"
                       class="inline-flex items-center justify-center px-6 py-3 rounded-xl bg-rose-700 hover:bg-rose-600 transition font-semibold shadow-lg shadow-rose-950/40">
                        Entrar no sistema
                    </a>

                    <a href="vinho?acao=novo"
                       class="inline-flex items-center justify-center px-6 py-3 rounded-xl border border-white/20 hover:bg-white/10 transition font-semibold">
                        Cadastrar vinho
                    </a>
                </div>
            </div>

            <div class="relative">
                <div class="absolute inset-0 bg-rose-700/20 blur-3xl rounded-full"></div>

                <div class="relative bg-white/10 backdrop-blur-md border border-white/10 rounded-3xl p-8 shadow-2xl">
                    <div class="grid gap-4">
                        <div class="bg-white/10 rounded-2xl p-5 border border-white/10">
                            <p class="text-sm text-zinc-300">Tipo</p>
                            <h3 class="text-2xl font-bold text-amber-200">Tinto</h3>
                        </div>

                        <div class="bg-white/10 rounded-2xl p-5 border border-white/10">
                            <p class="text-sm text-zinc-300">Safra em destaque</p>
                            <h3 class="text-2xl font-bold">2021</h3>
                        </div>

                        <div class="bg-white/10 rounded-2xl p-5 border border-white/10">
                            <p class="text-sm text-zinc-300">Experiência</p>
                            <h3 class="text-2xl font-bold">Catálogo elegante e funcional</h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

</body>
</html>