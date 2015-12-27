package servlet;

import controller.Navigator;
import controller.EMF;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by User on 13/12/2015.
 */
@WebServlet(name = "AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameterMap().containsKey("question")) {
            String question = request.getParameter("question");
            EntityManager em = EMF.get().createEntityManager();
            em.getTransaction().begin();

            String query = "Select Count(q) From Question q";
            Query q = em.createQuery(query);
            long count = (long) q.getSingleResult();
            int id = (int)++count;

            PrintWriter out = response.getWriter();
            out.println("next id is: " + id);
        }
        else {
            Navigator navigator = new Navigator();
            navigator.navigate(request, response, "", getServletContext());
            PrintWriter out = response.getWriter();
            out.println("nth");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
