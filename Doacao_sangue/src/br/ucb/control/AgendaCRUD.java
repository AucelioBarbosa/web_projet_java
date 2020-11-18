package br.ucb.control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ucb.model.Agenda;
import br.ucb.model.dao.AgendaDAO;
import br.ucb.model.dao.UsuarioDAO;


@WebServlet("/agendaCRUD")
public class AgendaCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao"), destino= null;
		RequestDispatcher dispatcher;
		UsuarioDAO usuarioDAO;
		AgendaDAO agendaDAO;
		Agenda agenda;
		List<Agenda> agendas;
		long id;
		try {
			usuarioDAO = new UsuarioDAO();
			agendaDAO = new AgendaDAO();
			if((acao == null) || (acao.equals("listar"))) {
				agendas = agendaDAO.listar();
				request.setAttribute("agendas",agendas);
				destino ="listaAgenda.jsp";
			}else if(acao.equals("consultar")){
				id = Long.parseLong(request.getParameter("id"));
				agenda = agendaDAO.consultar(id);
				request.setAttribute("agenda",agenda);
				request.setAttribute("usuarios",usuarioDAO.listar());
				destino = "incluirAgenda.jsp";
			}else if(acao.equals("incluir")){
				request.setAttribute("usuarios",usuarioDAO.listar());
				destino = "incluirAgenda.jsp";
			}else if(acao.equals("excluir")){
				id = Long.parseLong(request.getParameter("id"));
				agenda = agendaDAO.consultar(id);
				if(agendaDAO.excluir(agenda) == 0)
					request.setAttribute("erro","erro ao excluir usuario");
				else
					request.setAttribute("Sucesso","usuario excluido");
				destino = "listaAgenda.jsp";
			}else if (acao.equals("salvar")) {
				agenda = new Agenda();		
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				agenda.setData(sdf.parse(request.getParameter("dataAgendamento")));
				agenda.setAgendado(request.getParameter("agendado") != null);
				agenda.setUsuario(usuarioDAO.consultar(Long.parseLong(request.getParameter("idusuario"))));
				if (request.getParameter("id").equals("")) { // n�o tem id
					if (agendaDAO.incluir(agenda) == 0)
						request.setAttribute("erro", "Erro na inclus�o. N�o incluido!");
					else
						request.setAttribute("sucesso", "Incluido com sucesso!");			
				}
				else { // tem id
					id = Long.parseLong(request.getParameter("id"));
					agenda.setId(id);
					if (agendaDAO.alterar(agenda) == 0)
						request.setAttribute("erro", "Erro na altera��o. N�o alterado!");
					else
						request.setAttribute("sucesso", "Alterado com sucesso!");
				}
				agendas = agendaDAO.listar();
				destino ="listaAgenda.jsp";
				request.setAttribute("agenda",agenda);
			}

		} catch (SQLException e) {
			request.setAttribute("erro", "Erro de banco de dados= " + e.getMessage());
			destino = "incluirAgenda.jsp";
		}
		catch (NumberFormatException e) {
			request.setAttribute("erro", "Erro de conversão de número"+ e.getMessage());
			destino = "incluirAgenda.jsp";
		} catch (ParseException e) {
			request.setAttribute("erro", "Erro de conversão da data");
			destino = "incluirAgenda.jsp";
		}
		dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
	}


}


