# EasyMail v1.0.0

Neko based command line tool written in Haxe for sending mail to an SMTP server. 

## Windows

If you run EasyMail with no command line arguments, you should see the following message:
```
 EasyMail requires at least six arguments:
     [to], [from], [mailSubject], [mailText], [mailHtml], [smtpHost]
 Optional arguments: [port], [username], [password]
```

### Example usage
```
EasyMail you@service.com from@service.com "Hello" "Message Content" "" smtp.service.com 25 username password
```

### Non-authenticated example: (default Port 25)
```
EasyMail you@service.com from@service.com "Hello" "Message Content" "" smtp.service.com
```

### HTML Email example
```
EasyMail you@service.com from@service.com "Hello" "Your mail client doesn't support HTML" "<html><h1>Hello!</h1><p>Content</p></html>" smtp.service.com
```


## Neko Virtual Machine

`EasyMail.n` is the neko byte code for EasyMail. It can be run directly using neko VM; http://nekovm.org/

### Example usage:
```
neko EasyMail.n you@service.com from@service.com "Hello" "Message Content" "" smtp.service.com 25 username password
```

Neko is available on Windows, Linux, and OS X, and buildable for other operating systems from source.

## Known Issues

### Exceptions

Google mail example: (Failed on my system, Windows 7 64x, without error)
```
EasyMail you@service.com from@service.com "Hello" "Sending via google..." "" smtp.googlemail.com 465 GOOGLE_LOGIN@gmail.com GOOGLE_PASSWORD
```
