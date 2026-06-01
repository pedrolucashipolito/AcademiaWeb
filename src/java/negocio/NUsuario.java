/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.SQLException;
import java.util.List;
import model.Usuario;
import persistencia.PUsuario;

/**
 *
 * @author heube
 */
public class NUsuario {

    PUsuario persistencia;

    public NUsuario() {
        persistencia = new PUsuario();
    }

    public void salvar(Usuario usuario) throws SQLException, Exception {

        //Método para validar se o objeto marca está correto
        validar(usuario);

        if (usuario.getCodigo() == 0) {
            persistencia.incluir(usuario);
        } else {
            persistencia.alterar(usuario);
        }

    }

    
    public void excluir(Usuario usuario) throws SQLException{
        persistencia.excluir(usuario);
    }
    
    public Usuario consultar(int codigo){
        return persistencia.consultar(codigo);
    }
    
    public List<Usuario> listar(){
        return persistencia.listar();
    }
    
    
    
    private void validar(Usuario usuario) throws Exception {

        if (usuario.getNome() == null) {
            throw new Exception("É necessário informar o nome do usuário.");
        }

        if (usuario.getNome().isEmpty()) {
            throw new Exception("É necessário informar o nome do usuário.");
        }
    }

}
