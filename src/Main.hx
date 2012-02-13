package ;

import haxe.io.Error;
import neko.Lib;
import neko.Sys;

/**
 * Entry point for Easy Mail program
 * Translates command line arguments into mail...
 * @author John Beech
 */

class Main {
	
	static function main() {
		try {
			handleEasyMail();
		}
		catch (e:String) {
			Lib.println(e);
		}
	}
	
	static function handleEasyMail():Void {
		var args:Array<String> = Sys.args();
		
		var mail:EasyMail = new EasyMail(true);
		
		var to:String;
		var from:String;
		var mailSubject:String;
		var mailText:String;
		var mailHtml:String;
		
		var smtpHost:String;
		var port:Int = 25;
				
		var username:String = "";
		var password:String = "";
		
		// read required arguments
		if(args.length >= 6) {
			to = args[0];
			from = args[1];
			mailSubject = args[2];
			mailText = args[3];
			mailHtml = args[4];
			smtpHost = args[5];
		}
		else {
			throw new String("\nEasyMail requires at least six arguments: \n"
				+ "    [to], [from], [mailSubject], [mailText], [mailHtml], [smtpHost].\n"
				+ "Optional arguments: [port], [username], [password].\n");
		}
		
		// read optional arguments
		if (args.length >= 7) {
			port = Std.parseInt(args[6]);
		}
		
		// read even more optional arguments
		if(args.length >= 9) {
			username = args[7];
			password = args[8];
		}
		
		if (mailHtml == "") {
			mailHtml = mailText;
		}
		
		if (mailText == "") {
			throw "Could not send mail; no message text set.";
		}
		
		mail.compose(mailSubject, mailText, mailHtml);
		mail.send(from, to, smtpHost, port, username, password);
	}
}