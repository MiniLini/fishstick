#!/bin/bash

A_L="/var/log/apache2"
T_L="/var/log/tomcat7"

> ${A_L}/access.log
> ${A_L}/access.log1

> ${A_L}/error.log
> ${A_L}/error.log1

> ${T_L}/local_access.log.2022*

rm ${A_L}/g.tar
rm ${T_L}/catalina.out

# rm -r ${A_L}/a*.gz ${A_L}/e*.gz ${T_L}/c*.gz

# rm -r b*; rm -r En*; rm -r k*; rm -r r* && rm -r 2*
