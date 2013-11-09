puppet-zimbra
============

Zimbra module for Puppet

''IMPORTANT'': You cannot have any other web server, database, LDAP, or MTA 
server running, when you install the Zimbra software. If you have installed any 
of the applications before you install Zimbra software, disable these 
applications. During the ZCS installation, Zimbra makes global system 
changes that may break applications that are on your server. 

I suggest that Zimbra is used on initial setup of the server.

''FIREWALL:''
Zimbra uses the following ports:

| Service               | Port |
| --------------------- | ---- |
| Remote Queue Manager  | 22   |
| Postfix               | 25   |
| HTTP                  | 80   |
| POP3                  | 110  |
| IMAP                  | 143  |
| LDAP                  | 389  |
| HTTPS                 | 443  |
| Mailboxd IMAP SSL     | 993  |
| Mailboxd POP SSL      | 995  |
| Mailboxd LMTP         | 7025 |

DEPENDENCIES:
