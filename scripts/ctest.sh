now=`mysql --port=3306 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" –protocol tcp pub<<EOFMYSQL
select now();
EOFMYSQL
`
echo "Current time at server: ${now}"