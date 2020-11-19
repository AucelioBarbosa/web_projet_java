package br.ucb.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.ucb.model.Funcionario;
import br.ucb.model.dao.FuncionarioDAO;



@WebServlet("/funcionarioCRUD")
public class FuncionarioCRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao"), destino= null;
		RequestDispatcher dispatcher;
		FuncionarioDAO funcionarioDAO;
		List<Funcionario> funcionarios;
		Funcionario funcionario;
		try {
			funcionarioDAO = new FuncionarioDAO();
			if((acao == null) || (acao.equals("listar"))) {
				funcionarios = funcionarioDAO.listar();
				request.setAttribute("funcionarios",funcionarios);
				destino ="listarUsuario.jsp";
			}else if(acao.equals("consultar")){				
				funcionario = funcionarioDAO.consultar(request.getParameter("login"),request.getParameter("senha"));		
				request.setAttribute("funcionario",funcionario);
				destino = "listarUsuario.jsp";	
			}else if(acao.equals("excluir")){
				funcionario = funcionarioDAO.consultar(request.getParameter("login"),request.getParameter("senha"));
				funcionarios= funcionarioDAO.listar();
				request.setAttribute("funcionarios", funcionarios);
				if(funcionarioDAO.excluir(funcionario) == 0)
					request.setAttribute("erro","erro ao excluir funcionario");
				else
					request.setAttribute("Sucesso","funcionario excluido");
				destino = "listarUsuario.jsp";
			}else if (acao.equals("salvar")) {
				funcionario = new Funcionario();
				funcionario.setLogin(request.getParameter("login"));
				funcionario.setSenha(request.getParameter("senha"));
				if (request.getParameter("id").equals("")) { // n�o tem id
					if (funcionarioDAO.incluir(funcionario) == 0)
						request.setAttribute("erro", "Erro na inclus�o. N�o incluido!");
					else
						request.setAttribute("sucesso", "Incluido com sucesso!");			
				}
				funcionarios = funcionarioDAO.listar();
				destino ="";
				request.setAttribute("funcionarios",funcionario);
			}

		} catch (SQLException e) {
			request.setAttribute("erro", "Erro de banco de dados= ");
			destino = "index.jsp";
		}
		catch (NumberFormatException e) {
			request.setAttribute("erro", "Erro de convers�o de n�mero");
			destino = "index.jsp";

		}
		dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
	}
}