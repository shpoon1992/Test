package servlet;

import controller.Navigator;
import controller.EMF;
import model.Answer;
import model.Question;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by User on 11/12/2015.
 */
@WebServlet(name = "TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = EMF.get().createEntityManager();
        em.getTransaction().begin();

        Answer a1 = new Answer();
        a1.setAnswerId(1);
        a1.setAnswerDesc("Answer 1");
        a1.setQuestionId(null);

        Answer a2 = new Answer();
        a2.setAnswerId(2);
        a2.setAnswerDesc("Answer 2");
        a2.setQuestionId(null);

        Answer a3 = new Answer();
        a3.setAnswerId(3);
        a3.setAnswerDesc("Answer 3");
        a3.setQuestionId(null);

        Answer a4 = new Answer();
        a4.setAnswerId(4);
        a4.setAnswerDesc("Answer 4");
        a4.setQuestionId(null);

        Question qn = new Question();
        qn.setQuestionId(1);
        qn.setQuestionDesc("Please tell me your name:");
        qn.setAnswerId(null);

        em.persist(qn);
        em.persist(a1);
        em.persist(a2);
        em.persist(a3);
        em.persist(a4);


        em.getTransaction().commit();



        em.getTransaction().begin();

        Question question = em.find(Question.class, 1);
        question.setAnswerId(2);

        int qId = question.getQuestionId();

        Answer answer1 = em.find(Answer.class, 1);
        answer1.setQuestionId(qId);

        Answer answer2 = em.find(Answer.class, 2);
        answer2.setQuestionId(qId);

        Answer answer3 = em.find(Answer.class, 3);
        answer3.setQuestionId(qId);

        Answer answer4 = em.find(Answer.class, 4);
        answer4.setQuestionId(qId);

        em.getTransaction().commit();

        Navigator.navigate(request, response, "/index.jsp", getServletContext());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
