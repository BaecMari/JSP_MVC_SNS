package sns.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter implements Filter {

	String encoding;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("filter destroy 실행");

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//한글 처리 (POST 방식만)
		arg0.setCharacterEncoding(encoding);
		
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		encoding = arg0.getInitParameter("encoding");
	}

}
