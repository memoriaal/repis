now=`mysql --host=127.0.0.1 --port=3306 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" pub<<EOFMYSQL
select now();
EOFMYSQL
`
echo "Current time at server: ${now}"
