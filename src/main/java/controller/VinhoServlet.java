package controller;

// Importa a classe DAO responsável por acessar o banco de dados
import dao.VinhoDAO;

// Importa a classe modelo que representa um vinho
import model.Vinho;

// Importações necessárias para trabalhar com Servlets
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// Importações padrão do Java
import java.io.IOException;
import java.util.List;

// Define que essa classe será acessada pela URL /vinho
@WebServlet("/vinho")
public class VinhoServlet extends HttpServlet {

    // Identificador padrão de serialização (boa prática em Servlets)
    private static final long serialVersionUID = 1L;

    // Instancia o DAO para acessar o banco de dados
    private VinhoDAO dao = new VinhoDAO();

    // Método chamado quando a requisição é do tipo GET (ex: acessar URL no navegador)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Captura a ação enviada pela URL (ex: ?acao=listar)
        String acao = request.getParameter("acao");

        // Se não tiver ação ou for "listar"
        if (acao == null || acao.equals("listar")) {

            // Busca todos os vinhos no banco
            List<Vinho> vinhos = dao.listar();

            // Envia a lista para a página JSP
            request.setAttribute("vinhos", vinhos);

            // Encaminha para a página de listagem
            request.getRequestDispatcher("views/listar-vinhos.jsp").forward(request, response);

        } 
        // Se a ação for "novo" (abrir formulário vazio)
        else if (acao.equals("novo")) {

            // Apenas encaminha para o formulário
            request.getRequestDispatcher("views/form-vinho.jsp").forward(request, response);

        } 
        // Se a ação for "editar"
        else if (acao.equals("editar")) {

            // Pega o ID do vinho vindo da URL
            int id = Integer.parseInt(request.getParameter("id"));

            // Busca o vinho no banco
            Vinho vinho = dao.buscarPorId(id);

            // Envia o vinho para o formulário
            request.setAttribute("vinho", vinho);

            // Abre o formulário preenchido
            request.getRequestDispatcher("views/form-vinho.jsp").forward(request, response);

        } 
        // Se a ação for "excluir"
        else if (acao.equals("excluir")) {

            // Pega o ID do vinho
            int id = Integer.parseInt(request.getParameter("id"));

            // Remove o vinho do banco
            dao.excluir(id);

            // Redireciona para a listagem (evita reenvio da requisição)
            response.sendRedirect("vinho?acao=listar");

        } 
        // Se a ação for "detalhes"
        else if (acao.equals("detalhes")) {

            // Pega o ID do vinho
            int id = Integer.parseInt(request.getParameter("id"));

            // Busca o vinho no banco
            Vinho vinho = dao.buscarPorId(id);

            // Envia o vinho para a página de detalhes
            request.setAttribute("vinho", vinho);

            // Encaminha para a página de detalhes
            request.getRequestDispatcher("views/detalhes-vinho.jsp").forward(request, response);
        }
    }

    // Método chamado quando a requisição é do tipo POST (ex: envio de formulário)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Captura o ID (se existir, significa edição)
        String idParam = request.getParameter("id");

        // Captura os dados do formulário
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String pais = request.getParameter("pais");
        int safra = Integer.parseInt(request.getParameter("safra"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String descricao = request.getParameter("descricao");

        // Cria um objeto vinho com os dados recebidos
        Vinho vinho = new Vinho(nome, tipo, pais, safra, preco, descricao);

        // Se não tiver ID → é cadastro novo
        if (idParam == null || idParam.isEmpty()) {

            // Insere no banco
            dao.inserir(vinho);

        } else {
            // Se tiver ID → é edição

            // Define o ID no objeto
            vinho.setId(Integer.parseInt(idParam));

            // Atualiza no banco
            dao.atualizar(vinho);
        }

        // Redireciona para a listagem após salvar
        response.sendRedirect("vinho?acao=listar");
    }
}