DIR_HOME=/tmp/git/Prepare
cd $DIR_HOME
docker build -t my-php-app .
cd $DIR_HOME/docker_compose
docker-compose up -d
