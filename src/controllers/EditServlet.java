package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DBUtil;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		//Acquire only one message with the corresponding ID from the database
		Message m = em.find(Message.class, Integer.parseInt(request.getParameter("id")));

		em.close();

		//Register message information and session ID at the request scope
		request.setAttribute("message", m);
		request.setAttribute("_token", request.getSession().getId());

		//Register message ID at the session scope
		request.getSession().setAttribute("message_id", m.getId());

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/messages/edit.jsp");
		rd.forward(request, response);

	}

}
