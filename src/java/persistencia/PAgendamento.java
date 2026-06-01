package persistencia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.*;
import util.Conexao;

public class PAgendamento {

    private Connection cnn;

    public PAgendamento() {
        cnn = Conexao.getConnection();
    }

    public void salvar(Agendamento ag) {

        try {

            if (ag.getCodigo() == 0) {

                String sql = "INSERT INTO agendamento (data, hora, ativo, observacao, usuario, aparelho) VALUES (?,?,?,?,?,?)";

                PreparedStatement prd = cnn.prepareStatement(sql);

                prd.setDate(1, ag.getData());
                prd.setString(2, ag.getHora());
                prd.setBoolean(3, ag.isAtivo());
                prd.setString(4, ag.getObservacao());
                prd.setInt(5, ag.getUsuario().getCodigo());
                prd.setInt(6, ag.getAparelho().getCodigo());

                prd.executeUpdate();
                prd.close();

            } else {

                String sql = "UPDATE agendamento SET data=?, hora=?, ativo=?, observacao=?, usuario=?, aparelho=? WHERE codigo=?";

                PreparedStatement prd = cnn.prepareStatement(sql);

                prd.setDate(1, ag.getData());
                prd.setString(2, ag.getHora());
                prd.setBoolean(3, ag.isAtivo());
                prd.setString(4, ag.getObservacao());
                prd.setInt(5, ag.getUsuario().getCodigo());
                prd.setInt(6, ag.getAparelho().getCodigo());
                prd.setInt(7, ag.getCodigo());

                prd.executeUpdate();
                prd.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Agendamento> listar() {

        List<Agendamento> lista = new ArrayList<>();

        try {

            String sql = "SELECT * FROM agendamento";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                Agendamento ag = new Agendamento();

                ag.setCodigo(rs.getInt("codigo"));
                ag.setData(rs.getDate("data"));
                ag.setHora(rs.getString("hora"));
                ag.setAtivo(rs.getBoolean("ativo"));
                ag.setObservacao(rs.getString("observacao"));

                Usuario u = new Usuario();
                u.setCodigo(rs.getInt("usuario"));
                ag.setUsuario(u);

                Aparelho a = new Aparelho();
                a.setCodigo(rs.getInt("aparelho"));
                ag.setAparelho(a);

                lista.add(ag);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void excluir(int codigo) {

        try {

            String sql = "DELETE FROM agendamento WHERE codigo=?";

            PreparedStatement prd = cnn.prepareStatement(sql);
            prd.setInt(1, codigo);

            prd.executeUpdate();
            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Agendamento buscarPorCodigo(int codigo) {

        Agendamento ag = null;

        try {

            String sql = "SELECT * FROM agendamento WHERE codigo=?";

            PreparedStatement prd = cnn.prepareStatement(sql);
            prd.setInt(1, codigo);

            ResultSet rs = prd.executeQuery();

            if (rs.next()) {

                ag = new Agendamento();

                ag.setCodigo(rs.getInt("codigo"));
                ag.setData(rs.getDate("data"));
                ag.setHora(rs.getString("hora"));
                ag.setAtivo(rs.getBoolean("ativo"));
                ag.setObservacao(rs.getString("observacao"));

                Usuario u = new Usuario();
                u.setCodigo(rs.getInt("usuario"));
                ag.setUsuario(u);

                Aparelho a = new Aparelho();
                a.setCodigo(rs.getInt("aparelho"));
                ag.setAparelho(a);
            }

            rs.close();
            prd.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ag;
    }
}