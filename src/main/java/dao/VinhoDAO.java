package dao;

import model.Vinho;
import util.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VinhoDAO {

    public void inserir(Vinho vinho) {
        String sql = "INSERT INTO vinhos (nome, tipo, pais, safra, preco, descricao) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, vinho.getNome());
            stmt.setString(2, vinho.getTipo());
            stmt.setString(3, vinho.getPais());
            stmt.setInt(4, vinho.getSafra());
            stmt.setDouble(5, vinho.getPreco());
            stmt.setString(6, vinho.getDescricao());

            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Erro ao inserir vinho: " + e.getMessage());
        }
    }

    public List<Vinho> listar() {
        List<Vinho> lista = new ArrayList<>();
        String sql = "SELECT * FROM vinhos";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Vinho vinho = new Vinho();
                vinho.setId(rs.getInt("id"));
                vinho.setNome(rs.getString("nome"));
                vinho.setTipo(rs.getString("tipo"));
                vinho.setPais(rs.getString("pais"));
                vinho.setSafra(rs.getInt("safra"));
                vinho.setPreco(rs.getDouble("preco"));
                vinho.setDescricao(rs.getString("descricao"));

                lista.add(vinho);
            }

        } catch (Exception e) {
            throw new RuntimeException("Erro ao listar vinhos: " + e.getMessage());
        }

        return lista;
    }

    public Vinho buscarPorId(int id) {
        String sql = "SELECT * FROM vinhos WHERE id = ?";
        Vinho vinho = null;

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                vinho = new Vinho();
                vinho.setId(rs.getInt("id"));
                vinho.setNome(rs.getString("nome"));
                vinho.setTipo(rs.getString("tipo"));
                vinho.setPais(rs.getString("pais"));
                vinho.setSafra(rs.getInt("safra"));
                vinho.setPreco(rs.getDouble("preco"));
                vinho.setDescricao(rs.getString("descricao"));
            }

        } catch (Exception e) {
            throw new RuntimeException("Erro ao buscar vinho: " + e.getMessage());
        }

        return vinho;
    }

    public void atualizar(Vinho vinho) {
        String sql = "UPDATE vinhos SET nome=?, tipo=?, pais=?, safra=?, preco=?, descricao=? WHERE id=?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, vinho.getNome());
            stmt.setString(2, vinho.getTipo());
            stmt.setString(3, vinho.getPais());
            stmt.setInt(4, vinho.getSafra());
            stmt.setDouble(5, vinho.getPreco());
            stmt.setString(6, vinho.getDescricao());
            stmt.setInt(7, vinho.getId());

            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Erro ao atualizar vinho: " + e.getMessage());
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM vinhos WHERE id=?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Erro ao excluir vinho: " + e.getMessage());
        }
    }
}