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

import br.ucb.model.Usuario;
import br.ucb.model.dao.UsuarioDAO;


@WebServlet("/UsuarioCRUD")
public class UsuarioCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao"), destino= null;
		RequestDispatcher dispatcher;
		UsuarioDAO usuarioDAO;
		List<Usuario> usuarios;
		Usuario usuario;
		long id;

		try {
			usuarioDAO = new UsuarioDAO();
			if((acao == null) || (acao.equals("listar"))) {
				usuarios = usuarioDAO.listar();
				destino ="listaAgenda.jsp";
			}else if(acao.equals("consultar")){
				id = Long.parseLong(request.getParameter("id"));
				usuario = usuarioDAO.consultar(id);
				destino = "listaAgenda.jsp";	
			}else if(acao.equals("excluir")){
				id = Long.parseLong(request.getParameter("id"));
				usuario =  usuarioDAO.consultar(id);
				usuarios = usuarioDAO.listar();
				request.setAttribute("usuarios", usuarios);
				if(usuarioDAO.excluir(usuario)==0)
					request.setAttribute("erro","erro ao excluir usuario");
				else
					request.setAttribute("Sucesso","usuario excluido");
				destino = "listaAgenda.jsp";
			}else if (acao.equals("salvar")){
				usuario = new Usuario();
				usuario.setNome(request.getParameter("nome"));
				usuario.setTel(request.getParameter("tel"));
				usuario.setEndereco(request.getParameter("endereco"));
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				usuario.setdataNasc(sdf.parse(request.getParameter("dataNasc")));
				if (request.getParameter("id").equals("")) { // n�o tem id
					if (usuarioDAO.incluir(usuario) == 0)
						request.setAttribute("erro", "Erro na inclus�o. N�o incluido!");
					else
						request.setAttribute("sucesso", "Incluido com sucesso!");			
				}
			}

		} catch (SQLException e) {
			request.setAttribute("erro", "Erro de banco de dados");
			destino = "alunoLista.jsp";
		}
		catch (NumberFormatException e) {
			request.setAttribute("erro", "Erro de convers�o de n�mero");
			destino = "alunoEntrada.jsp";
		} catch (ParseException e) {
			request.setAttribute("erro", "Erro de convers�o da data");
			destino = "alunoEntrada.jsp";
		}
		dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
	}


}


