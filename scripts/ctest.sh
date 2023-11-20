if nc -z localhost $SSH_LOCAL_PORT; then
    now=`mysql --host=127.0.0.1 --port=3306 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" pub<<EOFMYSQL
    select now();
    EOFMYSQL
    `
    echo "Current time at server: ${now}"
else
    echo "No tunnel. Or is it?"
    ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
fi