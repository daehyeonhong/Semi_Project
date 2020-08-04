package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Gmail;
import util.SHA256;

@WebServlet("/mail")
public class MailSendAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = null;
		String host = "http://localhost:8181/TTMarket/",
				from = "notifyttmarket@gmail.com",
				to = "fholng@outlook.com",
				subject = "회원가입 인증 메일",
				content = "메롱 <a href='" + host + "welcome.jsp?code=" + new SHA256().getSHA256(to) + "'>되돌아 가기</a>";

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
			Session ses = Session.getInstance(properties, auth);
			ses.setDebug(true);
			MimeMessage message = new MimeMessage(ses);
			message.setSubject(subject);
			Address fromAddress = new InternetAddress(from);
			message.setFrom(fromAddress);
			Address toAddress = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, toAddress);
			message.setContent(content, "text/html;charset=UTF8");
			Transport.send(message);
			System.out.println();
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>alert('오류가 발생했습니다.');</script>");
			script.close();
			return;
		}
	}

}
