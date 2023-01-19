#!/bin/sh
echo 'SET LOCAL_INFILE = 1'
echo -e 'SET GLOBAL local_infile=1;' | docker exec mysql mysql -uroot -p123p[]123
echo 'LOAD INITIAL DATA INTO DATABASE'
docker exec mysql ./tmp/db_init/db_init.sh | chmod +x /tmp/db_init/db_init.sh