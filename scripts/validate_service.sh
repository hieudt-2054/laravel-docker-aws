curl -o /dev/null -s -w "%{http_code}\n" http://localhost | grep 200 || exit 1
