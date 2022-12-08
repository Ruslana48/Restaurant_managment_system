package action;

import com.example.servlets.LoginServlet;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;
import java.util.Locale;

public class SetLocaleAction  implements Action{
    private static final Logger log = Logger.getLogger(SetLocaleAction.class);

    @Override
    public ActionResult execute(HttpServletRequest request, HttpServletResponse response) {
        String lang = request.getParameter(ActionConstants.LANG);
        Config.set(request.getSession(), Config.FMT_LOCALE, new Locale(lang));
        request.getSession().setAttribute(ActionConstants.LANG, lang);
        log.info("The selected language is " + lang);
        return new ActionResult(request.getHeader(ActionConstants.REFERER), ActionConstants.isRedirect);
    }
}
