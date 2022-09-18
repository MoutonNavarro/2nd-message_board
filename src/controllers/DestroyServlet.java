package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DBUtil;

/**
 * Servlet implementation class SestroyServlet
 */
@WebServlet("/destroy")
public class DestroyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DestroyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _token = request.getParameter("_token");
		if (_token != null && _token.equals(request.getSession().getId())){
			EntityManager em = DBUtil.createEntityManager();

			//Acquire message's ID from session scope
			//and then acquire only one message with corresponding ID from database
			Message m = em.find(Message.class, (Integer)(request.getSession().getAttribute("message_id")));

			em.getTransaction().begin();
			em.remove(m);
			em.getTransaction().commit();
			request.getSession().setAttribute("flush", "Remove successfully.");
			em.close();

			//Remove obsolete data on session scope
			request.getSession().removeAttribute("message_id");

			//Redirect to index page
			response.sendRedirect(request.getContextPath() + "/index");
		}
	}

}
