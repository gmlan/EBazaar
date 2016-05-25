package edu.mum.cs425.filter;

import edu.mum.cs425.domain.User;
import edu.mum.cs425.util.Constants;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class loginFilter
 */
@WebFilter("/loginFilter")
public class loginFilter implements Filter {

    /**
     * Default constructor.
     */
    public loginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        chain.doFilter(request, response);      
   /*     User user = (User) req.getSession().getAttribute(Constants.CURRENT_USER);
        if ((user != null && user.isLoggedIn())
                || req.getRequestURI().startsWith(req.getContextPath() + "/login")
                || req.getRequestURI().startsWith(req.getContextPath() + "/static")) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }*/
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}
