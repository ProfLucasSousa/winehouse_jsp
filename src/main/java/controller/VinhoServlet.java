package controller;

import dao.VinhoDAO;
import model.Vinho;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/vinho")
public class VinhoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private VinhoDAO dao = new VinhoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao == null || acao.equals("listar")) {
            List<Vinho> vinhos = dao.listar();
            request.setAttribute("vinhos", vinhos);
            request.getRequestDispatcher("views/listar-vinhos.jsp").forward(request, response);

        } else if (acao.equals("novo")) {
            request.getRequestDispatcher("views/form-vinho.jsp").forward(request, response);

        } else if (acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vinho vinho = dao.buscarPorId(id);
            request.setAttribute("vinho", vinho);
            request.getRequestDispatcher("views/form-vinho.jsp").forward(request, response);

        } else if (acao.equals("excluir")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("vinho?acao=listar");

        } else if (acao.equals("detalhes")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vinho vinho = dao.buscarPorId(id);
            request.setAttribute("vinho", vinho);
            request.getRequestDispatcher("views/detalhes-vinho.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String pais = request.getParameter("pais");
        int safra = Integer.parseInt(request.getParameter("safra"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String descricao = request.getParameter("descricao");

        Vinho vinho = new Vinho(nome, tipo, pais, safra, preco, descricao);

        if (idParam == null || idParam.isEmpty()) {
            dao.inserir(vinho);
        } else {
            vinho.setId(Integer.parseInt(idParam));
            dao.atualizar(vinho);
        }

        response.sendRedirect("vinho?acao=listar");
    }
}