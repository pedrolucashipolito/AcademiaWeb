package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import util.Conexao;

public class PUsuario {

    private Connection cnn;

    public PUsuario() {
        cnn = Conexao.getConnection();
    }

    public Usuario consultar(int codigo) {

        Usuario usuario = new Usuario();

        try {

            String sql = "SELECT * FROM usuario WHERE codigo = ?";
            PreparedStatement prd = this.cnn.prepareStatement(sql);
            prd.setInt(1, codigo);

            ResultSet rst = prd.executeQuery();

            if (rst.next()) {
                usuario.setCodigo(rst.getInt("codigo"));
                usuario.setNome(rst.getString("nome"));
                usuario.setEmail(rst.getString("email"));
                usuario.setIdade(rst.getInt("idade"));
                usuario.setAtivo(rst.getBoolean("ativo"));
                usuario.setDataCadastro(rst.getDate("dataCadastro"));
            }

            rst.close();
            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public List<Usuario> listar() {

        List<Usuario> lista = new ArrayList<>();

        try {

            String sql = "SELECT * FROM usuario";
            Statement prd = this.cnn.createStatement();

            ResultSet rst = prd.executeQuery(sql);

            while (rst.next()) {

                Usuario usuario = new Usuario();

                usuario.setCodigo(rst.getInt("codigo"));
                usuario.setNome(rst.getString("nome"));
                usuario.setEmail(rst.getString("email"));
                usuario.setIdade(rst.getInt("idade"));
                usuario.setAtivo(rst.getBoolean("ativo"));
                usuario.setDataCadastro(rst.getDate("dataCadastro"));

                lista.add(usuario);
            }

            rst.close();
            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void incluir(Usuario usuario) throws SQLException {

        try {

            cnn.setAutoCommit(false);

            String sql = "INSERT INTO usuario(nome, email, idade, ativo, dataCadastro) VALUES(?,?,?,?,?)";

            PreparedStatement prd = cnn.prepareStatement(sql);

            prd.setString(1, usuario.getNome());
            prd.setString(2, usuario.getEmail());
            prd.setInt(3, usuario.getIdade());
            prd.setBoolean(4, usuario.isAtivo());
            prd.setDate(5, usuario.getDataCadastro());

            prd.executeUpdate();

            cnn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            cnn.rollback();

        } finally {
            cnn.setAutoCommit(true);
        }
    }

    public void alterar(Usuario usuario) throws SQLException {

        try {

            String sql = "UPDATE usuario SET nome=?, email=?, idade=?, ativo=?, dataCadastro=? WHERE codigo=?";

            PreparedStatement prd = cnn.prepareStatement(sql);

            prd.setString(1, usuario.getNome());
            prd.setString(2, usuario.getEmail());
            prd.setInt(3, usuario.getIdade());
            prd.setBoolean(4, usuario.isAtivo());
            prd.setDate(5, usuario.getDataCadastro());
            prd.setInt(6, usuario.getCodigo());

            prd.executeUpdate();

            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void excluir(Usuario usuario) throws SQLException {

        try {

            String sql = "DELETE FROM usuario WHERE codigo=?";

            PreparedStatement prd = cnn.prepareStatement(sql);

            prd.setInt(1, usuario.getCodigo());

            prd.executeUpdate();

            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}