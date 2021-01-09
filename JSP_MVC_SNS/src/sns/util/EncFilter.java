package sns.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncFilter
 */
@WebFilter("/EncFilter")
public class EncFilter implements Filter {

	private String encoding = null;
	private FilterConfig f = null;
    /**
     * Default constructor. 
     */
    public EncFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		f = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		//캐릭터 인코딩 설정이 없는 경우에만 실행
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(encoding);
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.f = fConfig;
		
		//초기화 파라미터 에서 인코딩 정보 가져와서 설정
		this.encoding = f.getInitParameter("encoding");
	}

}
