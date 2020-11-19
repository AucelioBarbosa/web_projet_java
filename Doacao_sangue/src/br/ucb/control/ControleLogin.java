package br.ucb.control;

import java.io.IOException;
import java.sql.SQLException;

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
    	String acao = request.getParameter("acao"), destino= null;
    	RequestDispatcher dispatcher;
    	LoginDAO loginDAO;
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Funcionario funcionario = new Funcionario();
        funcionario.setLogin(login);
        funcionario.setSenha(senha);        
        try {
        	loginDAO = new LoginDAO();
        	if((acao == null)||(acao.equals("logar")))
        	       if (loginDAO.validacao(funcionario)) {
	            	request.setAttribute("funcionario", funcionario);
	              destino = "listarUsuario.jsp";
	            } else {
	                request.setAttribute("funcionario", funcionario);
	               destino ="login.jsp";
	            }
	        } catch (SQLException e1) {
				e1.printStackTrace();
			}
	        dispatcher = request.getRequestDispatcher(destino);
			dispatcher.forward(request, response);
	    }
	}
