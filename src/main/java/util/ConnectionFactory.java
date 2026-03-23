package util;

// Importa classes necessárias para conexão com banco
import java.sql.Connection;
import java.sql.DriverManager;

// Classe responsável por criar conexões com o banco de dados
public class ConnectionFactory {

    // URL de conexão com o MySQL
    // jdbc:mysql://host:porta/nome_do_banco
    private static final String URL = "jdbc:mysql://localhost:3306/winehouse";

    // Usuário do banco
    private static final String USER = "root";

    // Senha do banco (no XAMPP geralmente é vazio)
    private static final String PASSWORD = "";

    // Método estático para obter uma conexão
    public static Connection getConnection() {

        try {
            // Carrega o driver do MySQL (necessário em alguns ambientes)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Retorna a conexão com o banco
            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (Exception e) {
            // Lança erro caso não consiga conectar
            throw new RuntimeException("Erro ao conectar com o banco: " + e.getMessage());
        }
    }
}