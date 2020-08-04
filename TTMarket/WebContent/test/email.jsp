<%@ page language="java" contentType="text/html; charset=UTF-8"
 
    pageEncoding="UTF-8"%>
 
<%@ page import="java.util.*"%>
 
<%@ page import="javax.activation.*"%>
 
<%@ page import="javax.mail.*"%>
 
<%@ page import="javax.mail.internet.*"%>
 
<%@ page import="init.Info"%>
 
<%@ page import="init.Members"%>
 
 
 
<%!
 
    public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
 
        PasswordAuthentication pa;
 
 
 
        public MyAuthentication(String mail, String pwd) {
 
            pa = new PasswordAuthentication(mail, pwd);
 
        }
 
 
 
        @Override
 
        protected PasswordAuthentication getPasswordAuthentication() {
 
            return pa;
 
        }
 
    }
 
%>
 
 
 
 
 
<%
 
    request.setCharacterEncoding("UTF-8");
 
    // SMTP 서버 주소
 
    //받는 사람의 정보
 
    String toEmail = request.getParameter("email");
 
    
 
        Info info = new Info();
 
 
 
        String fromName = info.getFromName();
 
        String fromEmail = info.getFromMail();
 
 
 
        try {
 
            Properties props = new Properties();
 
            props.put("mail.smtp.host", "smtp.worksmobile.com"); 
 
                       // 저는 네이버웍스 메일을 사용했어요.
 
            props.put("mail.smtp.port", "587");
 
            props.put("mail.smtp.auth", "true");
 
 
 
            // 메일 인증
 
            Authenticator myauth = new MyAuthentication("보낼 이메일", "비밀번호");
 
            Session sess = Session.getInstance(props, myauth);
 
 
 
            InternetAddress addr = new InternetAddress();
 
            addr.setPersonal(fromName, "UTF-8");
 
            addr.setAddress("보내는 이메일");
 
 
 
            Message msg = new MimeMessage(sess);
 
            msg.setFrom(addr);
 
            int auth_number = (int) ((Math.random() * 900000) + 100000);
 
            String auth_num = String.valueOf(auth_number);
 
            /*"AUTH_NUMBER : ["+auth_num+"]"  */
 
            msg.setSubject(MimeUtility.encodeText("JUMO authentication number", "utf-8", "B"));
 
            msg.setContent("AUTH_NUMBER : [" + auth_num + "]", "text/html;charset=utf-8");
 
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
 
 
 
            Transport.send(msg);
 
            String result = members.updateAuth(toEmail, auth_num);
 
            out.print(result);
 
        } catch (Exception e) {
 
            e.printStackTrace();
 
            return;
 
        }
 
    //보내는 사람의 정보
 
    
 
%> 