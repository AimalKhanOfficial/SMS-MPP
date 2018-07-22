package com.SMS.utility;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.apache.tomcat.util.codec.binary.Base64;

public class Utility {

	public static int SelectedProductId;

	public static int GenerateVerificationCode() {
		Random rand = new Random();
		return rand.nextInt(99999) + 1;
	}

	public static String GetCurrentDateTimeForDB() {
		java.util.Date dt = new java.util.Date();

		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		return sdf.format(dt);
	}

	public static ArrayList<String> SaveImagesToDirectory(String[] productImages) {
		productImages[0] = productImages[0].replace("[\"", "").replace("\"]",
				"");
		String[] base64Images = productImages[0].replace("\"", "")
				.replace("[", "").replace("]", "").split(",");
		Base64 codec = new Base64();
		ArrayList<String> image = new ArrayList<String>();
		for (int i = 0; i < base64Images.length; i++) {
			String imageName = "img_" + Utility.GenerateVerificationCode()
					+ "_prod_" + Utility.GenerateVerificationCode() + ".jpg";
			String address = "C:\\Users\\Aimal\\git\\SMS-MUM\\ShoppingSystem\\WebContent\\images\\"
					+ imageName;
			image.add(imageName);
			String toDecode = base64Images[i];
			FileOutputStream fos;
			try {
				fos = new FileOutputStream(address);
				fos.write(codec.decode(toDecode));
				fos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return image;
	}

	public static boolean convertToBoolean(String value) {
		boolean returnValue = false;
		if ("1".equalsIgnoreCase(value) || "yes".equalsIgnoreCase(value)
				|| "true".equalsIgnoreCase(value)
				|| "on".equalsIgnoreCase(value))
			returnValue = true;
		return returnValue;
	}

	public static void SendEmail(String[] to, String subject, String body) {

		try {
			String from = "sms.mum.mpp@gmail.com";
			String pass = "sms.mum.mpp@123";
			Properties props = System.getProperties();

			String host = "smtp.gmail.com";

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.user", "sms.mum.mpp@gmail.com");
			props.put("mail.smtp.password", "sms.mum.mpp@123");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");

			Session session = Session.getDefaultInstance(props);

			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress(from));

			InternetAddress[] toAddress = new InternetAddress[to.length];

			// To get the array of addresses
			for (int i = 0; i < to.length; i++) {
				toAddress[i] = new InternetAddress(to[i]);
			}

			for (int i = 0; i < toAddress.length; i++) {
				message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			}

			message.setSubject(subject);
			message.setText(body, "utf-8", "html");
			Transport transport = session.getTransport("smtp");

			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			System.out.println("Error AddressException" + e);
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("Error MessagingException" + e);
			e.printStackTrace();
		}
	}
}
