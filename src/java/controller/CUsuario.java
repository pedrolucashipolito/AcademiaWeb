package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import model.Usuario;
import negocio.NUsuario;

@WebServlet("/CUsuario")
public class CUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String acao = request.getParameter("acao");
            NUsuario nUsuario = new NUsuario();

            // LISTAR
            if (acao == null || acao.equals("listar")) {

                request.setAttribute("lista", nUsuario.listar());
                request.getRequestDispatcher("listarUsuario.jsp").forward(request, response);
            }

            // NOVO
            else if (acao.equals("novo")) {

                request.setAttribute("usuario", new Usuario());
                request.getRequestDispatcher("manterUsuario.jsp").forward(request, response);
            }

            // ALTERAR
            else if (acao.equals("alterar")) {

                int codigo = Integer.parseInt(request.getParameter("codigo"));

                Usuario usuario = nUsuario.consultar(codigo);

                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("manterUsuario.jsp").forward(request, response);
            }

            // EXCLUIR
            else if (acao.equals("excluir")) {

                int codigo = Integer.parseInt(request.getParameter("codigo"));

                Usuario usuario = new Usuario();
                usuario.setCodigo(codigo);

                nUsuario.excluir(usuario);

                response.sendRedirect("CUsuario?acao=listar");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Usuario usuario = new Usuario();

            String codigo = request.getParameter("codigo");

            if (codigo != null && !codigo.isEmpty()) {
                usuario.setCodigo(Integer.parseInt(codigo));
            }

            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));

            String idade = request.getParameter("idade");
            if (idade != null && !idade.isEmpty()) {
                usuario.setIdade(Integer.parseInt(idade));
            }

            String ativo = request.getParameter("ativo");
            if (ativo != null) {
                usuario.setAtivo(Boolean.parseBoolean(ativo));
            }

            String dataCadastro = request.getParameter("dataCadastro");
            if (dataCadastro != null && !dataCadastro.isEmpty()) {
                usuario.setDataCadastro(java.sql.Date.valueOf(dataCadastro));
            }

            NUsuario nUsuario = new NUsuario();
            nUsuario.salvar(usuario);

            response.sendRedirect("CUsuario?acao=listar");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}