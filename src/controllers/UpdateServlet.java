package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DBUtil;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _token = request.getParameter("_token");
		if(_token != null && _token.equals(request.getSession().getId())) {
			EntityManager em = DBUtil.createEntityManager();

			//Acquire message's ID from session scope
			//and then acquire only one message with corresponding from the database
			Message m = em.find(Message.class, (Integer)(request.getSession().getAttribute("message_id")));

			//Overwrite contents of the form at each its field
			String title = request.getParameter("title");
			m.setTitle(title);

			String content = request.getParameter("content");
			m.setContent(content);

			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			m.setUpdated_at(currentTime);

			//Update database
			em.getTransaction().begin();
			em.getTransaction().commit();
			request.getSession().setAttribute("flush", "Update successfully.");
			em.close();

			//Remove obsolete data on session scope
			request.getSession().removeAttribute("message_id");

			//redirect to index page
			response.sendRedirect(request.getContextPath() + "/index");
		}
	}

}
