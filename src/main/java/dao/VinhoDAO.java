package dao;

// Importa a classe modelo que representa um vinho
import model.Vinho;

// Classe responsável por fornecer conexão com o banco
import util.ConnectionFactory;

// Importações JDBC
import java.sql.*;

// Lista para armazenar resultados
import java.util.ArrayList;
import java.util.List;

// Classe DAO responsável por todas as operações no banco relacionadas a vinhos
public class VinhoDAO {

    // Método para inserir um novo vinho no banco
    public void inserir(Vinho vinho) {

        // Comando SQL com parâmetros (evita SQL Injection)
        String sql = "INSERT INTO vinhos (nome, tipo, pais, safra, preco, descricao) VALUES (?, ?, ?, ?, ?, ?)";

        // try-with-resources → fecha automaticamente conexão e statement
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Define os valores dos parâmetros do SQL
            stmt.setString(1, vinho.getNome());
            stmt.setString(2, vinho.getTipo());
            stmt.setString(3, vinho.getPais());
            stmt.setInt(4, vinho.getSafra());
            stmt.setDouble(5, vinho.getPreco());
            stmt.setString(6, vinho.getDescricao());

            // Executa o INSERT
            stmt.executeUpdate();

        } catch (Exception e) {
            // Lança erro personalizado em caso de falha
            throw new RuntimeException("Erro ao inserir vinho: " + e.getMessage());
        }
    }

    // Método para listar todos os vinhos do banco
    public List<Vinho> listar() {

        // Lista que armazenará os resultados
        List<Vinho> lista = new ArrayList<>();

        // Comando SQL
        String sql = "SELECT * FROM vinhos";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // Percorre os resultados retornados
            while (rs.next()) {

                // Cria um novo objeto vinho
                Vinho vinho = new Vinho();

                // Preenche os dados com base nas colunas do banco
                vinho.setId(rs.getInt("id"));
                vinho.setNome(rs.getString("nome"));
                vinho.setTipo(rs.getString("tipo"));
                vinho.setPais(rs.getString("pais"));
                vinho.setSafra(rs.getInt("safra"));
                vinho.setPreco(rs.getDouble("preco"));
                vinho.setDescricao(rs.getString("descricao"));

                // Adiciona o vinho na lista
                lista.add(vinho);
            }

        } catch (Exception e) {
            // Tratamento de erro
            throw new RuntimeException("Erro ao listar vinhos: " + e.getMessage());
        }

        // Retorna a lista completa
        return lista;
    }

    // Método para buscar um vinho pelo ID
    public Vinho buscarPorId(int id) {

        // SQL com parâmetro
        String sql = "SELECT * FROM vinhos WHERE id = ?";

        // Inicializa como null (caso não encontre)
        Vinho vinho = null;

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Define o ID na query
            stmt.setInt(1, id);

            // Executa a consulta
            ResultSet rs = stmt.executeQuery();

            // Se encontrou resultado
            if (rs.next()) {

                // Cria objeto vinho
                vinho = new Vinho();

                // Preenche os dados
                vinho.setId(rs.getInt("id"));
                vinho.setNome(rs.getString("nome"));
                vinho.setTipo(rs.getString("tipo"));
                vinho.setPais(rs.getString("pais"));
                vinho.setSafra(rs.getInt("safra"));
                vinho.setPreco(rs.getDouble("preco"));
                vinho.setDescricao(rs.getString("descricao"));
            }

        } catch (Exception e) {
            // Tratamento de erro
            throw new RuntimeException("Erro ao buscar vinho: " + e.getMessage());
        }

        // Retorna o vinho encontrado ou null
        return vinho;
    }

    // Método para atualizar um vinho existente
    public void atualizar(Vinho vinho) {

        // SQL de UPDATE
        String sql = "UPDATE vinhos SET nome=?, tipo=?, pais=?, safra=?, preco=?, descricao=? WHERE id=?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Define os novos valores
            stmt.setString(1, vinho.getNome());
            stmt.setString(2, vinho.getTipo());
            stmt.setString(3, vinho.getPais());
            stmt.setInt(4, vinho.getSafra());
            stmt.setDouble(5, vinho.getPreco());
            stmt.setString(6, vinho.getDescricao());

            // Define qual registro será atualizado
            stmt.setInt(7, vinho.getId());

            // Executa o UPDATE
            stmt.executeUpdate();

        } catch (Exception e) {
            // Tratamento de erro
            throw new RuntimeException("Erro ao atualizar vinho: " + e.getMessage());
        }
    }

    // Método para excluir um vinho pelo ID
    public void excluir(int id) {

        // SQL de DELETE
        String sql = "DELETE FROM vinhos WHERE id=?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Define o ID do vinho a ser removido
            stmt.setInt(1, id);

            // Executa o DELETE
            stmt.executeUpdate();

        } catch (Exception e) {
            // Tratamento de erro
            throw new RuntimeException("Erro ao excluir vinho: " + e.getMessage());
        }
    }
}