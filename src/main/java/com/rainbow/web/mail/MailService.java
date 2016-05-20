package com.rainbow.web.mail;

public interface MailService {
	public void sendMail(String toAddress, String fromAddress, String subject, String msgBody);
}
