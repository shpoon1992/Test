package servlet;

import controller.Navigator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by User on 2/2/2016.
 */
@WebServlet(name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void onLogout(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
        try {
            Navigator.navigate(request, response, "/test.jsp", context);
        }
        catch (Exception ex) {
            System.out.println(ex.getStackTrace().toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.removeAttribute("team");
        session.invalidate();
        onLogout(request, response, getServletContext());
    }
}
