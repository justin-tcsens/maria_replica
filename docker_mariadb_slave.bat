docker network create jpj_training_network

docker rm mariadb_slave

docker run --name mariadb_slave --network jpj_training_network --network-alias maria_slave -v /D/Training_Workspace/maria_replica/slave/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/slave/log:/var/log/mysql -e MYSQL_USER=app -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3351:3306 -d mariadb:10.6.5 --server-id=2 