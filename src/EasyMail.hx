package ;

import mtwin.mail.Exception;
import mtwin.mail.Part;
import mtwin.mail.Smtp;
import neko.Lib;

/**
 * EasyMail mail functions...
 * @author John Beech
 */

class EasyMail {

	public var logging:Bool;
	
	private var subject:String;
	private var plainText:String;
	private var htmlText:String;
	
	public function new(logging:Bool=false) {
		this.logging = logging;
	}
		
	public function compose(subject:String, plainText:String, htmlText:String):Void {
		this.subject = subject;
		this.plainText = plainText;
		this.htmlText = htmlText;
	}
	
	public function send(from:String, to:String, smtpHost:String, port:Int=25, username:String="", password:String=""):Void {
		var mail = new mtwin.mail.Part("multipart/alternative");
		mail.setHeader("From", from);
		mail.setHeader("To", to);
		mail.setDate();
		mail.setHeader("Subject", subject);
		
		var header = mail.newPart("text/html");
		var text = mail.newPart("text/plain");
		
		header.setContent(htmlText);
		text.setContent(plainText);

		if (logging) {
			Lib.println("Sending mail to: " + to + " from: " + from + " at " + mail.getDate().toString());
		}
		
		try {
			mtwin.mail.Smtp.send(smtpHost, from, to, mail.get(), port, username, password);
		}
		catch (e:Exception) {
			switch(e) {
				case ConnectionError(host, port): throw "Could not send mail, error connecting to: ("  + host + ") on port: (" + port + ")";
				default: throw e;
			}
		}
		
		if(logging) {
			Lib.println("Mail subject: (" + subject + ") sent! Completed at: " + mail.getDate().toString());
		}
	}
	
}