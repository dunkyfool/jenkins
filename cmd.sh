#!/bin/bash

### GENERAL ###
if [ "$1" = "up" ];then
  docker-compose up -d
  docker-compose ps
elif [ "$1" = "down" ];then
  docker-compose stop && docker-compose rm -f
elif [ "$1" = "key" ];then
  docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
elif [ "$1" = "stats" ];then
  docker stats $(docker ps --format={{.Names}})

elif [ "$1" = "shortlist_p1" ];then
  echo "up down stats logs kill key"

### EXEC/LOGS ###
elif [ "$1" = "logs" ]; then
  docker-compose logs --tail 10 -f jenkins
elif [ "$1" = "exec" ]; then
  docker-compose exec jenkins bash
elif [ "$1" = "kill" ];then
  docker-compose kill  $2
  docker-compose rm -f $2
  docker-compose up -d $2

### INFO ###
elif [ "$1" = "" ];then
  echo "[Info] up|down|kill|logs|exec|stats|key"
else
  docker-compose $1
fi
