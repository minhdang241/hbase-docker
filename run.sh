#Clean
docker stop hbase_regionserver2 hbase_regionserver_backup hbase_master

docker ps -a| grep hbase| awk '{system("docker rm " $1)}'



#Run
docker run \
      --name hbase_regionserver_backup \
      --hostname hbase_regionserver_backup \
      -d \
      --network="hadoop.net" \
      hbase:0.1 \
      /bin/bootstrap_region.sh

sleep 2

docker run \
      --name hbase_regionserver2 \
      --hostname hbase_regionserver2 \
      -d \
      --network="hadoop.net" \
      hbase:0.1 \
      /bin/bootstrap_region.sh

sleep 2

docker run \
      --name hbase_master \
      --hostname hbase_master \
      -d \
      -p 16010:16010 \
      -p 8081:8081 \
      -p 8082:8082 \
      --network="hadoop.net" \
      hbase:0.1 \
      /bin/bootstrap_master.sh
