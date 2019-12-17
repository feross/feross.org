---
layout: post
class: post
title: "How To Set Up Your Linode For Maximum Awesomeness"
tags:
- web-dev
hn: "http://news.ycombinator.com/item?id=4618808"
---

*This guide was last updated in December 2019. View [the full changelog](https://github.com/feross/feross.org/commits/master/_posts/2012-10-05-how-to-setup-your-linode.md).*

So, you followed the advice in my [Linode Hosting Review](/linode-vps-hosting-review/) and decided to host your website with [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767). Excellent choice!

But, if you're new to the command line (perhaps you are familiar with CPanel or Plesk?) or you've never setup a server from scratch before, you may be wondering what dark magic vudu is required to get up and running.

Well, you've come to the right place!


## The Command Line Is Hard (...at first)

I've set up at least five new servers with [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767) and each time I complete the ritual, I learn new incantations that make the Linux angels sing. I'm pretty happy with my current recipe.

Setting up a new server can be confusing, so using a tutorial like this one is a good idea the first time you do it.


## Tutorial: How To Set Up Your Linode

In this guide, I will demonstrate how to set up a fresh Ubuntu server from scratch, update everything, install essential software, lock down the server to make it more resilient against basic attacks and denial-of-service, improve server stability, setup automatic backups to another server, and finally install common software like Nginx, MySQL, Python, Node, etc.


### A Note About This Guide

I originally compiled this guide as a .txt file of notes for myself, but decided to share it in case anyone finds it useful. If you're looking for something straight from the horse's mouth, Linode also [offers guides](http://library.linode.com/) that cover how to set up a new server.

Let's get started!


### Provision a New Linode

First, you need to provision a new [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767). Using Linode's web UI, it's quite easy. Select your desired Linode size. If you're unsure, choose the smallest size. You can always resize it later. You also need to select a location for the server. I usually select "Fremont, CA" since that is closest to my location and the location of most of my users (United States, west coast).

Next, let's install an OS. Select the "Rebuild" tab. Pick "Ubuntu 18.04 LTS" for the OS image. Use 256MB as the swap disk size (it is default). You'll be asked to create a password for the `root` user.

After a few minutes, your server will be ready. Now, click "Boot" to get things started!

Next, let's connect to the server.


### Connecting to Your Server

First, open Terminal on your Mac. On Windows, you'll want to use [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) or install the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to get a proper Terminal.

To connect to your server, type this into your terminal and hit Enter:

{% highlight bash %}
ssh root@<your server ip>
{% endhighlight %}

Of course, replace `<your server ip>` with your Linode's actual IP address, which you can find on the "Remote Access" tab in the control panel.

This command launches the <abbr title="Secure Shell">SSH</abbr> program and asks it to connect to your server with the username `root`, which is the default Ubuntu user. You will be prompted for the `root` password you created earlier.


## Basic Ubuntu Setup

To set up your new server, execute the following commands.

### Set the hostname

Set the server hostname. Any name will do &mdash; just make it memorable. In this example, I chose "future".

{% highlight bash %}
echo "future" > /etc/hostname
hostname -F /etc/hostname
{% endhighlight %}

Let's verify that it was set correctly:

{% highlight bash %}
hostname
{% endhighlight %}


### Set the fully-qualified domain name

Set the <abbr title="Fully-qualified domain name">FQDN</abbr> of the server by editing the `/etc/hosts` file:

{% highlight bash %}
vim /etc/hosts
{% endhighlight %}

Make sure the following line is in the `/etc/hosts` file (after anything that's in there by default):

{% highlight bash %}
<your server ip>   future.<your domain>.net       future
{% endhighlight %}

It is useful if you add an A record that points from some domain you control (in this case I used "future.&lt;your domain&gt;.net") to your server IP address. This way, you can easily reference the IP address of your server when you SSH into it, like so:

{% highlight bash %}
ssh future.<your domain>.net
{% endhighlight %}

If you're curious, you can [read more](http://en.wikipedia.org/wiki/Hosts_\(file\)) about the `/etc/hosts` file.


### Set the time

Set the server timezone:

{% highlight bash %}
dpkg-reconfigure tzdata
{% endhighlight %}

Verify that the date is correct:

{% highlight bash %}
date
{% endhighlight %}


### Update the server

Check for updates and install:

{% highlight bash %}
apt update
apt upgrade
{% endhighlight %}


## Basic Security Setup

### Create a new user

The `root` user has a lot of power on your server. It has the power to read, write, and execute any file on the server. It's not advisable to use `root` for day-to-day server tasks. For those tasks, use a user account with normal permissions.

Add a new user:

{% highlight bash %}
adduser <your username>
{% endhighlight %}

Add the user to the `sudo` group:

{% highlight bash %}
usermod -a -G sudo <your username>
{% endhighlight %}

This allows you to perform actions that require `root` privilege by simply prepending the word `sudo` to the command. You may need to type your password to confirm your intentions.

Login with new user:

{% highlight bash %}
exit
ssh <your username>@<your server ip>
{% endhighlight %}


### Set up SSH keys

SSH keys allow you to login to your server without a password. For this reason, you'll want to set this up on your primary computer (definitely not a public or shared computer!). SSH keys are very convenient and don't make your server any less secure.

If you've already generated SSH keys before (maybe for your GitHub account?), then you can skip the next step.

#### Generate SSH keys

Generate SSH keys with the following command:

(NOTE: Be sure to run this on your local computer -- not your server!)

{% highlight bash %}
ssh-keygen -t rsa -b 4096 -C "<your email address>"
{% endhighlight %}

When prompted, just accept the default locations for the keyfiles. Also, you'll want to choose a nice, strong password for your key. If you're on Mac, you can save the password in your keychain so you won't have to type it in repeatedly.

Now you should have two keyfiles, one public and one private, in the `~/.ssh` folder.

If you want more information about SSH keys, GitHub has a [great guide](https://help.github.com/articles/connecting-to-github-with-ssh/).

#### Copy the public key to server

Now, copy your public key to the server. This tells the server that it should allow anyone with your private key to access the server. This is why we set a password on the private key earlier.

From your local machine, run:

{% highlight bash %}
scp ~/.ssh/id_rsa.pub <your username>@<your server ip>:
{% endhighlight %}

On your Linode, run:

{% highlight bash %}
mkdir .ssh
mv id_rsa.pub .ssh/authorized_keys
chown -R <your username>:<your username> .ssh
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
{% endhighlight %}


### Disable remote root login and change the SSH port

Since all Ubuntu servers have a `root` user and most servers run SSH on port 22 (the default), criminals often try to guess the `root` password using automated attacks that try many thousands of passwords in a very short time. This is a common attack that nearly all servers will face.

We can make things substantially more difficult for automated attackers by preventing the `root` user from logging in over SSH and changing our SSH port to something less obvious. This will prevent the vast majority of automatic attacks.

Disable remote root login and change SSH port:

{% highlight bash %}
sudo vim /etc/ssh/sshd_config
{% endhighlight %}

**Set "Port" to "44444" and "PermitRootLogin" to "no".** Save the file and restart the SSH service:

{% highlight bash %}
sudo systemctl restart ssh
{% endhighlight %}

In this example, we changed the port to 44444. So, now to connect to the server, we need to run:

{% highlight bash %}
ssh <your username>@future.<your domain>.net -p 44444
{% endhighlight %}

Update: Somone posted this useful thought about choosing an SSH port on Hacker News:

> Make sure your SSH port is below 1024 (but still not 22). Reason being if your Linode is ever compromised a bad user may be able to crash sshd and run their own rogue sshd as a non root user since your original port is configured >1024. (More info [here](http://unix.stackexchange.com/questions/16564/why-are-the-first-1024-ports-restricted-to-the-root-user-only))


## Advanced Security Setup


### Prevent repeated login attempts with Fail2Ban

[Fail2Ban](http://www.fail2ban.org/) is a security tool to prevent repeated failed login attempts from attackers. It works by monitoring important services (like SSH) and blocking IP addresses which appear to be malicious (i.e. they are failing too many login attempts because they are guessing passwords).

Install Fail2Ban:

{% highlight bash %}
sudo apt install fail2ban
{% endhighlight %}

Configure Fail2Ban:

Setup configuration in a new file (will overwrite defaults in `/etc/fail2ban/jail.conf`):

{% highlight bash %}
sudo vim /etc/fail2ban/jail.local
{% endhighlight %}

Paste the following into `/etc/fail2ban/jail.local`:

{% highlight bash %}
[DEFAULT]
destemail = <your email address>
sendername = Fail2Ban
{% endhighlight %}

{% highlight bash %}
[sshd]
enabled = true
port = 44444
{% endhighlight %}

{% highlight bash %}
[sshd-ddos]
enabled = true
port = 44444
{% endhighlight %}

(Change the port number to match whatever you used as your SSH port).

Save the file and restart Fail2Ban to put the new rules into effect:

{% highlight bash %}
sudo systemctl restart fail2ban
{% endhighlight %}


### Add a firewall

We'll add an [iptables](http://en.wikipedia.org/wiki/Iptables) firewall to the server that blocks all incoming and outgoing connections except for ones that we manually approve. This way, only the services we choose can communicate with the internet.

The firewall has no rules yet. Check it out:

{% highlight bash %}
sudo iptables -L
{% endhighlight %}

Next, we'll install a package which enables persistent firewall rules. This means that the firewall rules will get automatically applied at server startup:

{% highlight bash %}
sudo apt install iptables-persistent
{% endhighlight %}

When prompted, agree to have the current rules installed into `/etc/iptables/rules.v4` and `/etc/iptables/rules.v6`.

Setup the IPv4 firewall rules in `/etc/iptables/rules.v4`:

{% highlight bash %}
sudo vim /etc/iptables/rules.v4
{% endhighlight %}

The following firewall rules will allow HTTP (80), HTTPS (443), SSH (44444), ping, and some other ports for testing. All other ports will be blocked.

Paste the following into `/etc/iptables/rules.v4`:

```
*filter

#  Allow all loopback (lo0) traffic and drop all traffic to 127/8 that doesn't use lo0
-A INPUT -i lo -j ACCEPT
-A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT

#  Accept all established inbound connections
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#  Allow all outbound traffic - you can modify this to only allow certain traffic
-A OUTPUT -j ACCEPT

#  Allow HTTP and HTTPS connections from anywhere (the normal ports for websites and SSL).
-A INPUT -p tcp --dport 80 -j ACCEPT
-A INPUT -p tcp --dport 443 -j ACCEPT

#  Allow ports for testing
-A INPUT -p tcp --dport 8080:8090 -j ACCEPT

#  Allow SSH connections
#  The -dport number should be the same port number you set in sshd_config
-A INPUT -p tcp -m state --state NEW --dport 44444 -j ACCEPT

#  Allow ping
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

#  Log iptables denied calls
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

#  Reject all other inbound - default deny unless explicitly allowed policy
-A INPUT -j REJECT
-A FORWARD -j REJECT

COMMIT
```

Setup the IPv6 firewall rules in `/etc/iptables/rules.v6`:

{% highlight bash %}
sudo vim /etc/iptables/rules.v6
{% endhighlight %}

At this time, I don't run any IPv6 services, so I recommend just deleting the contents of `/etc/iptables/rules.v6` entirely.

Activate the firewall rules now:

{% highlight bash %}
sudo iptables-restore < /etc/iptables/rules.v4
{% endhighlight %}

Verify that the rules were installed correctly:

{% highlight bash %}
sudo iptables -L
{% endhighlight %}

Restart the server and confirm that the rules are still in place.

{% highlight bash %}
reboot
{% endhighlight %}

{% highlight bash %}
sudo iptables -L
{% endhighlight %}

### Get an email anytime a user uses `sudo`

I like to get an email anytime someone uses sudo. This way, I have a "paper trail" of sorts, in case anything bad happens to my server. I use a Gmail filter to file these away and only look at them occasionally.

Create a new file for the sudo settings:

{% highlight bash %}
sudo vim /etc/sudoers.d/my_sudoers
{% endhighlight %}

Add this to the file:

{% highlight bash %}
Defaults    mail_always
Defaults    mailto="<your email address>"
{% endhighlight %}

Set permissions on the file:

{% highlight bash %}
sudo chmod 0440 /etc/sudoers.d/my_sudoers
{% endhighlight %}

This is isn't mentioned anywhere on the web, as far as I know, but in order for the "mail on sudo use" feature to work, you need to install an MTA server. `sendmail` is a good choice:

{% highlight bash %}
sudo apt install sendmail
{% endhighlight %}

Now, you should get an email anytime someone uses `sudo`!


## Improve Server Stability

VPS servers can run out of memory during traffic spikes or other system events. In this situation, the server might go into "swap hell". It's important to configure your applications so memory swapping does not occur.

Modern servers like Nginx or Node.js use a single process to handle multiple simulateous connections, so this is less of a problem than in the past.

For example, in Apache 2.2.x (quite old), the default settings allowed 150 clients to connect simultaneously. This was way too large a number for a typical small VPS server. Let's do the math. Apache's processes were typically ~25MB each. If the website got a temporary traffic spike and 150 processes launched, we'd need 3750MB of memory on the server. If we don't have this much, then the OS will grind to a halt as it swaps memory to disk to make room for new processes, but then immediately swaps the stuff on disk back into memory. This is also known as "swap hell".

No useful work gets done once "swap hell" occurs. The server can be stuck in this state for hours, even after the traffic rush has subsided. During this time, very few web requests will get serviced.

If you're still using the ancient Apache 2.2.x for some reason, you could set `MaxClients` to something more reasonable like 20 or 30 clients. There are many other optimizations to make, too. Linode has a Library article with [optimizations](http://library.linode.com/hosting-website) for various server types.

Newer version of Apache (2.4 and up) use an "event based mpm" instead of Apache 2.2 ineffecient "prefork" approach. This is far less of a problem with the improved approach.

And of course, servers like Nginx and Node.js handle thousands of connections without making a new process for each connection.


### Reboot server on out-of-memory condition

In cases where something goes awry, it is good to automatically **reboot your server when it runs out of memory**. This will cause a minute or two of downtime, but it's better than languishing in the swapping state for potentially hours or days.

You can leverage a couple kernel settings and [Lassie](https://blog.linode.com/2007/10/26/lassie-the-shutdown-watchdog/) to make this happen on Linode.

Adding the following two lines to your `/etc/sysctl.conf` will cause it to reboot after running out of memory:

{% highlight bash %}
vm.panic_on_oom=1
kernel.panic=10
{% endhighlight %}

The vm.panic_on_oom=1 line enables panic on OOM; the kernel.panic=10 line tells the kernel to reboot ten seconds after panicking.

[Read more](http://www.linode.com/wiki/index.php/Rebooting_on_OOM) about rebooting when out of memory on Linode's wiki.


## Miscellaneous nice-to-haves

These next things are not required but are nice to do.

### Set up reverse DNS

The reverse <abbr title="domain name system">DNS</abbr> system allows one to determine the domain name that lives at a given IP address. This is useful for network troubleshooting &mdash; (ping, traceroute, etc.), as well as email anti-spam measures ([read more](http://en.wikipedia.org/wiki/Reverse_DNS_lookup#Uses) on Wikipedia).

It's pretty easy to set up. From the Linode Manager, select your Linode, click on "Remote Access", then click on "Reverse DNS" (under "Public IPs"). Type in your domain and that's it!


### Set up a private IP address

Private IPs are useful for communicating data on the Linode network, i.e. Linode to Linode. This is handy if you have multiple Linodes (say, one for your web server and one for your database). Private network traffic is more secure (only other Linode customers can see it, vs. the whole internet), faster (the traffic never has to leave the datacenter if both Linodes are in the same datacenter), and free (doesn't count towards your monthly bandwidth quota).

I currently put my database server on it's own Linode, so that I can scale it independently of my frontend servers and debug performance issues easier since the systems are isolated. This hasn't been super-handy yet, but if one of my sites gets a huge traffic rush, I bet it will be immensely useful.

It's easy to set up. On the Remote Access tab, click Add a Private IP.

Then, just restart the Linode and the new IP address will become available thanks to [Linode Network Helper](https://www.linode.com/docs/platform/network-helper/) which automatically deposits a static networking configuration in to your Linode at boot.

Configuring your applications and your database to route traffic over the local network is another issue, not covered here.


## Install Useful Server Software

At this point, you have a pretty nice server setup. Congrats! But, your server still doesn't do anything useful. Let's install some software.


### Install a compiler

A compiler is often required to install Python packages and other software, so let's just install one up-front.

{% highlight bash %}
sudo apt install build-essential
{% endhighlight %}


### Install Nginx

{% highlight bash %}
sudo apt install nginx
{% endhighlight %}


### Install Node.js

Follow the instructions to [install the NodeSource Node.js PPA](https://github.com/nodesource/distributions#installation-instructions).


### Install MySQL

Install MySQL:

{% highlight bash %}
sudo apt install mysql-server libmysqlclient-dev
{% endhighlight %}

Set root password when prompt asks you.

Verify that MySQL is running.

{% highlight bash %}
sudo netstat -tap | grep mysql
{% endhighlight %}

For connecting to MySQL, instead of the usual PHPMyAdmin, I now use [Sequel Pro](http://www.sequelpro.com/), a free app for Mac.

#### Improve MySQL security

Before using MySQL in production, you'll want to improve your MySQL installation security. Run:

{% highlight bash %}
mysql_secure_installation
{% endhighlight %}

This will help you set a password for the root account, remove anonymous-user accounts, and remove the test database.


#### Keep your MySQL tables in tip-top shape

Over time your MySQL tables will get fragmented and queries will take longer to complete. You can keep your tables in top shape by regularly running [OPTIMIZE TABLE](http://dev.mysql.com/doc/refman/5.1/en/optimize-table.html) on all your tables. But, since you'll never remember to do this regularly, we should set up a cron job to do this.

Open up your crontab file:

{% highlight bash %}
crontab -e
{% endhighlight %}

Then, add the following line:

{% highlight bash %}
@weekly mysqlcheck -o --user=root --password=<your password here> -A
{% endhighlight %}

Also, you can try manually running the above command to verify that it works correctly.


#### Backup your MySQL databases

The excellent `automysqlbackup` utility can automatically make daily, weekly, and monthly backups of your MySQL database.

Install it:

{% highlight bash %}
sudo apt install automysqlbackup
{% endhighlight %}

Now, let's configure it. Open the configuration file:

{% highlight bash %}
sudo vim /etc/default/automysqlbackup
{% endhighlight %}

By default, your database backups get stored in `/var/lib/automysqlbackup` which isn't very intuitive. I recommend changing it to a folder within your home directory. To do this, find the line that begins with `BACKUPDIR=` and change it to `BACKUPDIR="/home/<your username>/backups/mysql"`

You also want to get an email if an error occurs, so you'll know if automatic backups stop working for some reason. Find the line that begins with `MAILADDR=` and change it to `MAILADDR="<your email address>"`.

Close and save the file. That's it!


## Setup Automatic Backups

Backups are really important. [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767) offers a paid backup service that's really convenient if you accidentally destroy something and need to restore your Linode quickly. It's $5 per month for the smallest Linode. I enable it on all my Linodes.

If you want even more peace of mind (or don't want to pay for Linode's backup service) you can roll your own simple backup solution using `rsync`.

You will need access to another Linux server (maybe another Linode?) or a home server. I just installed Ubuntu on an old desktop computer to use as a backup server.

We're going to create a weekly cronjob that backs up our Linode's home directory to a backup server. I keep all the files that I would want to backup in my home folder, so this works for me.

Open your crontab:

{% highlight bash %}
crontab -e
{% endhighlight %}

Add this line to the file:

{% highlight bash %}
@weekly rsync -r -a -e "ssh -l <your username on backup server> -p <ssh port number of backup server>" --delete /home/<your username> <hostname or ip address of backup server>:/path/to/some/directory/on/backup/server
{% endhighlight %}

I recommend running the above command manually to make sure you have it right before adding it to your crontab file.

That's it!

## Linode rocks!

If, after reading this, you want to sign up for Linode, use [this link](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767) and I'll get a couple weeks of free hosting. If you prefer not to, here's the plain link: [Linode.com](http://www.linode.com)

Happy hacking!
