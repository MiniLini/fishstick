#!/bin/bash

A_L="/var/log/apache2"
T_L="/var/log/tomcat7"

cat /dev/null > ${A_L}/access.log*
cat /dev/null > ${A_L}/error.log*
cat /dev/null > ${T_L}/local_access.log.2022*

rm ${A_L}/g.tar
rm ${T_L}/catalina.out

# rm -r ${A_L}/a*.gz ${A_L}/e*.gz ${T_L}/c*.gz

# rm -r b*; rm -r En*; rm -r k*; rm -r r* && rm -r 2*
