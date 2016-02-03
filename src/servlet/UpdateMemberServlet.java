package servlet;

import controller.EMF;
import controller.Navigator;
import model.Member;

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
import java.io.InterruptedIOException;
import java.util.InputMismatchException;
import java.util.List;

/**
 * Created by User on 3/2/2016.
 */
@WebServlet(name = "UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hiddenField = request.getParameter("hidden");
        String name = request.getParameter("name");
        String phoneString = request.getParameter("phone");
        try {
            int memberId = Integer.parseInt(hiddenField.split(";")[0]);
            int teamId = Integer.parseInt(hiddenField.split(";")[1]);
            int phone = Integer.parseInt(phoneString);

            EntityManager em = EMF.get().createEntityManager();
            em.getTransaction().begin();
            Member member = em.find(Member.class, memberId);
            member.setMemberName(name);
            member.setMemberPhone(phone);
            em.getTransaction().commit();
            em.close();
            onUpdateSuccess(request, response, getServletContext(), teamId);
        }
        catch (InputMismatchException e) {
            e.printStackTrace();
        }
    }

    private void onUpdateSuccess(HttpServletRequest request, HttpServletResponse response, ServletContext context, int teamId) {
        EntityManager em = EMF.get().createEntityManager();
        em.getTransaction().begin();
        String sql = "SELECT m FROM Member m WHERE m.teamId = :teamId";
        Query query = em.createQuery(sql);
        query.setParameter("teamId", teamId);
        List<java.lang.reflect.Member> memberList = query.getResultList();
        em.getTransaction().commit();
        em.close();

        HttpSession session = request.getSession(true);
        session.removeAttribute("mList");
        session.setAttribute("mList",memberList);
        try {
            Navigator.navigate(request, response, "/edit.jsp", context);
        }
        catch (Exception ex) {
            System.out.println(ex.getStackTrace().toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
