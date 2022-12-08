package filters;

import org.omg.Dynamic.RequestContextHelper;
import org.primefaces.context.RequestContext;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Filter;
import java.util.logging.LogRecord;

//@WebFilter(filterName = "DefaultLocaleFilter", urlPatterns = {"/app"})

