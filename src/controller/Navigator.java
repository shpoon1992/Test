package controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by User on 13/12/2015.
 */
public class Navigator {
    public Navigator() {}

    public void navigate(HttpServletRequest request,
                         HttpServletResponse response, String url, ServletContext context)
            throws IOException, ServletException {
        context.getRequestDispatcher(url)
                .forward(request, response);
    }
}