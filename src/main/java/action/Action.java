package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    /**
     * Method are executes all requests and responses
     *
     * @param request
     * @param response
     * @return
     */
    ActionResult execute(HttpServletRequest request, HttpServletResponse response);
}
