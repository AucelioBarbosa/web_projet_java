package br.ucb.control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.ucb.model.Funcionario;
import br.ucb.model.dao.LoginDAO;




@WebServlet("/controleLogin")
public class ControleLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		LoginDAO loginDAO;

		Funcionario funcionario = new Funcionario();	

		try {
			loginDAO = new LoginDAO();				
			loginDAO.validarFuncionario(funcionario);
			request.setAttribute("funcionario", funcionario);
			dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
			dispatcher.forward(request, response);
		}
		catch (Exception e) {
			// TODO: handle exception
		}

	}
}
