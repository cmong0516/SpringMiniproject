package miniproject.servlet.web.frontcontroller;

import miniproject.servlet.web.frontcontroller.controller.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "frontControllerServlet", urlPatterns = "/miniproject/*")
public class FrontControllerServlet extends HttpServlet {
    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerServlet() {
        controllerMap.put("/miniproject/best", new BestServlet());
        controllerMap.put("/miniproject/best2", new Best2Servlet());
        controllerMap.put("/miniproject/complit", new CompliteServlet());
        controllerMap.put("/miniproject/login", new LoginServlet());
        controllerMap.put("/miniproject/rentbook", new RentbookServlet());
        controllerMap.put("/miniproject/search", new SearchServlet());
        controllerMap.put("/miniproject/signin", new SigninServlet());
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("FrontControllerServlet.service");

        String requestURI = request.getRequestURI();

        Controller controller = controllerMap.get(requestURI);
        if (controller == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        controller.process(request, response);
    }
}
