
docker rm mariadb_master

@REM docker run --name mariadb_master --network jpj_training_network --network-alias maria_master -v /D/Training_Workspace/maria_replica/master/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/master/log:/var/log/mysql -e MYSQL_USER=replica_user -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3350:3306 -d mariadb:10.6.5 --log-bin --binlog-format=MIXED --log-basename=master --server-id=1


docker run --name mariadb_master --network jpj_training_network --network-alias maria_master -v /D/Training_Workspace/maria_replica/master/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/master/log:/var/log/mysql -e MYSQL_USER=app -e MYSQL_DATABASE=jpj-training -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3306:3306 -d mariadb:10.6.5 --log-bin --binlog-format=MIXED --log-basename=master --server-id=1