package controllers;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		//Acquire number of page for open(Default: page 1)
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {}

		//Get messages by specifying maximum number and start position
		List<Message> messages = em.createNamedQuery("getAllMessages", Message.class)
			 .setFirstResult(16 * (page - 1))
			 .setMaxResults(16)
			 .getResultList();

		//Acquire number of all
		long messages_count = (long)em.createNamedQuery("getMessagesCount", Long.class).getSingleResult();

		em.close();

		request.setAttribute("messages", messages);
		request.setAttribute("messages_count", messages_count);
		request.setAttribute("page", page);

		//If set flush message at sessions cope
		//then save it to request scope (remove from session scope)
		if (request.getSession().getAttribute("flush") != null ){
			request.setAttribute("flush", request.getSession().getAttribute("flush"));
			request.getSession().removeAttribute("flush");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/messages/index.jsp");
		rd.forward(request, response);

	}

}
