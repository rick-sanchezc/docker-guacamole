for i in `docker ps -a -q`;do docker stop $i;done
for i in `docker ps -a -q`;do docker rm $i -f;done
for i in `docker image list | grep -v REP| awk {'print $3'}`; do docker image rm $i -f;done
