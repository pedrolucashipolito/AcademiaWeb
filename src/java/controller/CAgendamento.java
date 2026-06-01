package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Agendamento;
import model.Usuario;
import model.Aparelho;
import negocio.NAgendamento;

@WebServlet("/CAgendamento")
public class CAgendamento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String acao = request.getParameter("acao");
            NAgendamento n = new NAgendamento();

            if (acao == null || acao.equals("listar")) {

                request.setAttribute("lista", n.listar());
                request.getRequestDispatcher("listarAgendamento.jsp").forward(request, response);
                return;
            }

            if ("novo".equals(acao)) {

                request.setAttribute("agendamento", new Agendamento());
                request.getRequestDispatcher("manterAgendamento.jsp").forward(request, response);
                return;
            }

            if ("alterar".equals(acao)) {

                int codigo = Integer.parseInt(request.getParameter("codigo"));

                Agendamento ag = n.buscarPorCodigo(codigo);

                request.setAttribute("agendamento", ag);

                request.getRequestDispatcher("manterAgendamento.jsp").forward(request, response);
                return;
            }

            if ("excluir".equals(acao)) {

                int codigo = Integer.parseInt(request.getParameter("codigo"));

                n.excluir(codigo);

                response.sendRedirect(request.getContextPath() + "/CAgendamento?acao=listar");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Agendamento ag = new Agendamento();

            String codigo = request.getParameter("codigo");
            if (codigo != null && !codigo.isEmpty()) {
                ag.setCodigo(Integer.parseInt(codigo));
            }

            String data = request.getParameter("data");
            if (data != null && !data.isEmpty()) {
                ag.setData(java.sql.Date.valueOf(data));
            }

            ag.setHora(request.getParameter("hora"));
            ag.setObservacao(request.getParameter("observacao"));

            ag.setAtivo(request.getParameter("ativo") != null);

            String usuario = request.getParameter("usuario");
            if (usuario != null && !usuario.isEmpty()) {
                Usuario u = new Usuario();
                u.setCodigo(Integer.parseInt(usuario));
                ag.setUsuario(u);
            }

            String aparelho = request.getParameter("aparelho");
            if (aparelho != null && !aparelho.isEmpty()) {
                Aparelho a = new Aparelho();
                a.setCodigo(Integer.parseInt(aparelho));
                ag.setAparelho(a);
            }

            NAgendamento n = new NAgendamento();
            n.salvar(ag);

            response.sendRedirect(request.getContextPath() + "/CAgendamento?acao=listar");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}