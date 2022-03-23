docker rm mariadb_slave

@REM docker run --name mariadb_slave --network jpj_training_network --network-alias maria_slave -v /D/Training_Workspace/maria_replica/slave/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/slave/log:/var/log/mysql -e MYSQL_USER=replica_user -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3351:3306 -d mariadb:10.6.5 --log-bin=/var/lib/mysql/mysql-bin --log_bin_index=/var/lib/mysql/mysql-bin --binlog-format=MIXED --server-id=2 --relay_log=/var/lib/mysql/relay-bin --relay_log_index=/var/lib/mysql/relay-bin.index --relay_log_info_file=/var/lib/mysql/relay-bin.info



@REM docker run --name mariadb_slave --network jpj_training_network --network-alias maria_slave -v /D/Training_Workspace/maria_replica/slave/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/slave/log:/var/log/mysql -e MYSQL_USER=app -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3351:3306 -d mariadb:10.6.5 --log-bin=/var/lib/mysql/mysql-bin --log_bin_index=/var/lib/mysql/mysql-bin --binlog-format=MIXED --server-id=2 --relay_log=/var/lib/mysql/relay-bin --relay_log_index=/var/lib/mysql/relay-bin.index --relay_log_info_file=/var/lib/mysql/relay-bin.info

docker run --name mariadb_slave --network jpj_training_network --network-alias maria_slave -v /D/Training_Workspace/maria_replica/slave/data:/var/lib/mysql -v /D/Training_Workspace/maria_replica/slave/log:/var/log/mysql -e MYSQL_USER=app -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=password -p 3351:3306 -d mariadb:10.6.5 --server-id=2 