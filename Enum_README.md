## Enumerate_v1.sh courtesy of N1NJ4

Enumerate_v1.sh is a tool for Pentesters to use for target Enumeration.



## Execution - must be ran as root. (can comment out the section for root check otherwise)

(as root)     ./Enumeration_v1.sh



## Usage - This script will return a multitude of listable items



Operating System Info:

  What's the distribution type? What version?

  What's the kernel version? Is it 64-bit?

  What can be learned from the environmental variables?

  Is there a printer?



Applications & Services:

  What services are running? Which service has which user privilege?

  What service(s) are been running by root?

  What applications are installed? What version are they? Are they currently running?

  Any of the services settings misconfigured? Are any vulnerable plugins attached?

  What jobs are scheduled?

  Any plain text usernames and/or passwords?



Communications & Networking:

  What NIC(s) does the system have? Is it connected to another network?

  What are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?

  What other users & hosts are communicating with the system?

  Whats cached? IP and/or MAC addresses?

  Is port forwarding possible? Redirect and interact with traffic from another view.

  Is tunnelling possible? Send commands locally, remotely?

  Is packet sniffing possible? What can be seen? Listen to live traffic.



Confidential Information & Users:

  Who are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?

  What sensitive files can be found?

  Anything interesting in the home directories? If it's possible to access

  Are there any passwords in; scripts, databases, configuration files or log files? Default paths and locations for passwords

  What has the user being doing? Is there any password in plain text? What have they been edting?

  What user information can be found?

  Can private-key information be found?



File Systems:

  How are file-systems mounted?

  Are there any unmounted file-systems?

  Which configuration files can be written in /etc/? Able to reconfigure a service?

  What can be found in /var/ ?

  Any settings/files (hidden) on website? Any settings file with database information?

  Are there anything in the log files?

  What Advanced Linux File Permissions are used, Sticky bits, SUID & GUID?

  Where can written to and executed from? A few common places like /tmp, /var/tmp, /dev/shm

  Any problem files? Word-writeable or nobody files



Preparation & Finding Exploit Code:

  What development tools/languages are installed/supported?

  How can files be uploaded?




## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.




## License

MiniLini/Enumerate_v1.sh is licensed under the
GNU General Public License v3.0
