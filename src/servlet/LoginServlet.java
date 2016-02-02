package servlet;

import controller.EMF;
import controller.Navigator;
import model.Account;
import model.Team;

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
import java.util.List;

/**
 * Created by User on 26/1/2016.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (!username.equals("") && !password.equals("")) {
            EntityManager em = EMF.get().createEntityManager();
            em.getTransaction().begin();
            String sql = "SELECT a FROM Account a WHERE a.accountUsername=:username AND a.accountPassword=:password";
            Query query = em.createQuery(sql);
            query.setParameter("username", username);
            query.setParameter("password", password);

            List<Account> results = query.getResultList();

            em.getTransaction().commit();

            if (results.size() > 0) {
                Account currentAccount = results.get(0);

                em.getTransaction().begin();
                query = em.createQuery("SELECT t FROM Team t WHERE t.teamId = :teamId");
                query.setParameter("teamId", currentAccount.getTeamId());

                List<Team> teamList = query.getResultList();
                em.getTransaction().commit();
                em.close();
                if (teamList != null && teamList.size() > 0) {
                    Team currentTeam = teamList.get(0);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("team",currentTeam);
                    onLoginSucceed(request, response, getServletContext());
                }
                else {
                    onLoginFailed(request, response, getServletContext());
                }
                em.close();
            }
            else {
                onLoginFailed(request, response, getServletContext());
                em.close();
            }
        }
        else {
            onLoginFailed(request, response, getServletContext());
        }
    }

    private void onLoginSucceed(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
        try {
            Navigator.navigate(request, response, "/home.jsp", context);
        }
        catch (Exception ex) {
            System.out.println(ex.getStackTrace().toString());
        }
    }

    private void onLoginFailed(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
        try {
            Navigator.navigate(request, response, "/login_fail.jsp", context);
        }
        catch (Exception ex) {
            System.out.println(ex.getStackTrace().toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
