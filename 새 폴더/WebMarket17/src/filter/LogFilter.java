package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
//로그기록객체 생성	
PrintWriter writer;
	public void destroy() {
		//자원해제 처리
		writer.close();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        writer.println("접속한 클라이언트 IP:"+request.getRemoteAddr());
        long start=System.currentTimeMillis();
        writer.println("요청방식:"+((HttpServletRequest)request).getMethod());
        writer.println("접근한 URL 경로:"+getURLPath(request));
        writer.println("요청 처리 시작 시각:"+getCurrentTime());
		chain.doFilter(request, response);
		long end=System.currentTimeMillis();
		writer.println(" 요청 처리 종료시각:"+getCurrentTime());
		writer.println(" 요청 처리 소요 시간:"+(end-start)+"ms");
		writer.println("========================================");
	}

	private String getCurrentTime() {
		//날짜출력포맷객체 생성
		DateFormat formatter = 
				     new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
		//달력정보 얻기
		Calendar calendar = Calendar.getInstance();
		//달역객체에 현재날짜시간정보 설정
		calendar.setTimeInMillis(System.currentTimeMillis());
		//현재 날짜정보를 format형식으로 리턴
		return formatter.format(calendar.getTime());
	}

	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String queryString="";
		if(request instanceof HttpServletRequest) {
			req=(HttpServletRequest)request;//casting
			currentPath=req.getRequestURI();
			queryString=req.getQueryString();
			queryString=queryString==null?"":"?"+queryString;
		}
		System.out.println("url:"+currentPath+queryString);
		return currentPath+queryString;
	}

	public void init(FilterConfig fConfig) throws ServletException {
      //로그기록할 파일정보 얻기
		String filename=fConfig.getInitParameter("filename");
	  if(filename==null) 
		  throw new ServletException("로그파일 이름을 찾을 수 없습니다.");
     try {
    	 //로그기록할 파일객체 생성
    	  writer=new PrintWriter(new FileWriter(filename,true),true);
     }catch(IOException e) {
    	 throw new ServletException("로그파일을 열 수 없습니다.");
     }
	}
}
