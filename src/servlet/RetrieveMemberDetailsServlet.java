package servlet;

import controller.EMF;
import controller.Navigator;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

/**
 * Created by User on 3/2/2016.
 */
@WebServlet(name = "RetrieveMemberDetailsServlet")
public class RetrieveMemberDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void onRetrieveSuccess(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
        try {
            Navigator.navigate(request, response, "/edit.jsp", context);
        }
        catch (Exception ex) {
            System.out.println(ex.getStackTrace().toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int teamId = Integer.parseInt(request.getParameter("teamId"));
        EntityManager em = EMF.get().createEntityManager();
        em.getTransaction().begin();
        String sql = "SELECT m FROM Member m WHERE m.teamId = :teamId";
        Query query = em.createQuery(sql);
        query.setParameter("teamId", teamId);

        List<Member> memberList = query.getResultList();
        em.getTransaction().commit();
        em.close();

        HttpSession session = request.getSession(true);
        session.setAttribute("mList",memberList);

        onRetrieveSuccess(request, response, getServletContext());
    }
}
