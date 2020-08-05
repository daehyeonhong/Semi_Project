package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Gmail;
import util.SHA256;

@WebServlet("*.mail")
public class MailSendAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello, Mail!");
		String requestURI = request.getRequestURI(),
				contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length());

		/* 문자셋 설정 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><bodt>" + request.getRequestURL() + "<br />" + requestURI + "<br />" + contextPath + "<br />"
				+ command + "<br />" + "</body></html>");

		/* 요청 command에 따른 분기 작업 */
		RequestDispatcher requestDispatcher = null;
		switch (command) {
		case "/mail/EmailCheck.mail":
			mailSender(request, response);
			requestDispatcher = request.getRequestDispatcher("HaHa.mail");
			break;
		case "/mail/Send.mail": requestDispatcher = request.getRequestDispatcher("./successSendEMail.jsp");
			break;
		case "/mail/HaHa.mail": requestDispatcher = request.getRequestDispatcher("./success.jsp");
			break;
		default:
			break;
		}
		requestDispatcher.forward(request, response);
	}

	private void mailSender(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		StringBuffer temp = new StringBuffer();
		Random random = new Random();

		for (int i = 0; i < 20; i++) {
		    int randomIndex = random.nextInt(3);
		    switch (randomIndex ) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (random.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (random.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((random.nextInt(10)));
		        break;
		    }
		}
		
		String authenticode = temp.toString();
		request.getSession().setAttribute("presentCode", authenticode);
		System.out.println(authenticode);
		String host = "http://localhost:8181/TTMarket/", 
				from = "notifyttmarket@gmail.com", 
				to = request.getSession().getAttribute("email").toString(),
				subject = "TTMarket 회원가입 이메일 인증", 
				content = "안녕하십니까 인증을 위해서 입력창에 [" + authenticode + "]을(를) 입력해주세요. <a href='" + host
						+ "welcome.jsp'>TTMarket</a>";
		System.out.println(to);

		Properties properties = new Properties();
		properties.put("mail.smtp.user", from);
		properties.put("mail.smtp.host", "smtp.googlemail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.post", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses= Session.getInstance(properties, auth);
			ses.setDebug(true);
			MimeMessage message = new MimeMessage(ses);
			message.setSubject(subject);
			Address fromAddress = new InternetAddress(from);
			message.setFrom(fromAddress);
			Address toAddress = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, toAddress);
			message.setContent(content, "text/html;charset=UTF8");
			Transport.send(message);
			PrintWriter script = response.getWriter();
			script.println("<script>alert('인증 메일이 발송되었습니다.');</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>alert('오류가 발생했습니다.');</script>");
			script.close();
			return;
		}

	}

}