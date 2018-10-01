#!/bin/bash

for i in `seq 1 30`;
do
  HTTP_CODE=`curl --write-out '%{http_code}' -o /dev/null -m 5 -q -s http://localhost:80/WebApp/`
  if [ "$HTTP_CODE" == "200" ]; then
    echo "Successfully pulled root page."
    exit 0;
  fi
  echo "Attempt to curl endpoint returned HTTP Code $HTTP_CODE. Backing off and retrying."
  sleep 5
done
echo "Server did not come up after expected time. Failing."
exit 1
