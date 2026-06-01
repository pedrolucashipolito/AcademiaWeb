package negocio;

import java.util.List;
import model.Agendamento;
import persistencia.PAgendamento;

public class NAgendamento {

    private PAgendamento p = new PAgendamento();

    public void salvar(Agendamento ag) throws Exception {
        p.salvar(ag);
    }

    public void excluir(int codigo) throws Exception {
        p.excluir(codigo);
    }

    public List<Agendamento> listar() throws Exception {
        return p.listar();
    }

    public Agendamento buscarPorCodigo(int codigo) throws Exception {
        return p.buscarPorCodigo(codigo);
    }
}