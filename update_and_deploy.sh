git checkout main
git fetch --all
git reset --hard origin/main

docker-compose down -v --remove-orphans
docker-compose pull
docker-compose up -d --no-build --remove-orphans
# if success
if [ $? -eq 0 ]; then
    echo "Success"
    docker image prune -a --force
    docker container prune --force
else
    echo "Failed"
fi


#docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)