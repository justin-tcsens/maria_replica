# Data Replication
Data replication with MariaDB Docker.

## Tasks
**Primary Database**
- Bring up primary MariaDB database.
    - docker_mariadb_master.bat

- Access to primary database docker environment with bash mode.
    - docker exec -it mariadb_master /bin/bash

- Login into primary database.
    ```
    mysql -u root -p
    ```
- Flush tables with read lock.
    - FLUSH TABLES WITH READ LOCK;

- Show primary database logging co-ordinator.
    - SHOW MASTER STATUS;

- Quit from primary database session, perform DB dump.
    ```
    mysqldump -h 127.0.0.1 -P 3306 -u root -p --all-databases --single-transaction --quick > /var/lib/mysql/backup.sql;
    ```
- Release read lock.
    ```
    UNLOCK TABLES;
    ```

**Slave Database**
- Bring up primary MariaDB database.
    ```
    docker_mariadb_slave.bat
    ```
- Copy DB Dumb data file from primary database to slave database.

- Access to slave database docker environment with bash mode.
    ```
    docker exec -it mariadb_slave /bin/bash
    ```
- Restore database dumb from primary database.
    ```
    mysql -h 127.0.0.1 -P 3306 -u root -p < /var/lib/mysql/backup.sql
    ```
- Login into slave database.
    ```
    mysql -u root -p
    ```
- Grant privileges to specific users. Flush privileges for immediate effect.
    ```
    grant all privileges on `jpj-training`.* to `app`@`%`;

    FLUSH PRIVILEGES;
    ```
- Stop and reset slave database.
    ```
    STOP SLAVE;
	
    RESET SLAVE;
    ```
- Change/ Update replication target to primary database server. To replace logging co-ordinator which obtained from primary database.
    ```
    CHANGE MASTER TO MASTER_HOST='maria_master', MASTER_PORT=3306, MASTER_USER='root', MASTER_PASSWORD='root', MASTER_CONNECT_RETRY=3600, MASTER_LOG_FILE='master-bin.000003', MASTER_LOG_POS=3865;
    ```

- Start slave database replication
    ```
    START SLAVE;
    ```

- Check and verify replication status.
    ```
    SHOW SLAVE STATUS\G;
    ```