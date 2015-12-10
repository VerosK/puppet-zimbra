puppet-zimbra
============

Zimbra module for Puppet based on [RobQuistNL module](https://github.com/RobQuistNL/puppet-zimbra)
with some random tweaks. 

**IMPORTANT**: You cannot have any other web server, database, LDAP, or MTA 
server running, when you install the Zimbra software. If you have installed any 
of the applications before you install Zimbra software, disable these 
applications. During the ZCS installation, Zimbra makes global system 
changes that may break applications that are on your server. 

I suggest that Zimbra is used on clear setup of the server.

Currently tested on clean CentOS6, with disabled Postfix.

**Usage**:


    class{"zimbra::params":
       # ... your params here ... # or in hiera
    }
    class{"zimbra":
    }

    zimbra::server_setting{"zimbraMtaMyNetworks": 
	value => "127.0.0.0/8 10.0.160.0/19"
    }
    
Optionally, you can use classes `zimbra::sudoers` to manage you `sudoers` file
and `zimbra::firewall` to manage iptables rules.  

You can use `zimbra::domains` and `zimbra::http_mode` to fine-tune your Zimbra.

Some facts on Zimbra are propagated to facter.    

**Random notes**

Don't forget to disable any MTA running to not interfere with Zimbra.

    service {'mta-disable':
       name => 'postfix',
       ensure => stopped,
       enable => false,
    }
