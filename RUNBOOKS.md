# Инструкции администратора

##  Запуск системы

```bash
# Запуск кластера
docker-compose up -d

# Проверка статуса
docker exec cassandra-seed nodetool status
# Создание схемы
docker exec -it cassandra-seed cqlsh -f schema.cql

# Загрузка тестовых данных
docker exec -it cassandra-seed cqlsh -f data.cql
# Статус кластера
docker exec cassandra-seed nodetool status

# Статистика таблиц
docker exec cassandra-seed nodetool tablestats software_requirements

# Информация о keyspace
docker exec cassandra-seed nodetool describering software_requirements
# Создание snapshot
docker exec cassandra-seed nodetool snapshot software_requirements

# Копирование snapshot
docker cp cassandra-seed:/var/lib/cassandra/data/software_requirements/ ./backup/$(date +%Y%m%d)
# Остановка узла
docker stop cassandra-seed

# Очистка данных
docker exec cassandra-seed rm -rf /var/lib/cassandra/data/software_requirements/*

# Восстановление из backup
docker cp ./backup/20240312/ cassandra-seed:/var/lib/cassandra/data/software_requirements/

# Запуск и репарация
docker start cassandra-seed
docker exec cassandra-seed nodetool repair software_requirements
# Проверка compaction
docker exec cassandra-seed nodetool compactionstats

# Запуск очистки
docker exec cassandra-seed nodetool cleanup

# Перезапуск узла
docker restart cassandra-node1

# Запуск репарации
docker exec cassandra-seed nodetool repair


---

### **Файл 11:** `docker-compose.yml`
```yaml
version: '3.8'

services:
  cassandra-seed:
    image: cassandra:4.1
    container_name: cassandra-seed
    ports:
      - "9042:9042"
    environment:
      - CASSANDRA_CLUSTER_NAME=RequirementsCluster
      - CASSANDRA_DC=DC1
      - CASSANDRA_RACK=RACK1
    volumes:
      - ./data/seed:/var/lib/cassandra
    networks:
      - cassandra-net

  cassandra-node1:
    image: cassandra:4.1
    container_name: cassandra-node1
    ports:
      - "9043:9042"
    environment:
      - CASSANDRA_CLUSTER_NAME=RequirementsCluster
      - CASSANDRA_DC=DC1
      - CASSANDRA_RACK=RACK2
      - CASSANDRA_SEEDS=cassandra-seed
    volumes:
      - ./data/node1:/var/lib/cassandra
    depends_on:
      - cassandra-seed
    networks:
      - cassandra-net

  cassandra-node2:
    image: cassandra:4.1
    container_name: cassandra-node2
    ports:
      - "9044:9042"
    environment:
      - CASSANDRA_CLUSTER_NAME=RequirementsCluster
      - CASSANDRA_DC=DC1
      - CASSANDRA_RACK=RACK3
      - CASSANDRA_SEEDS=cassandra-seed
    volumes:
      - ./data/node2:/var/lib/cassandra
    depends_on:
      - cassandra-seed
    networks:
      - cassandra-net

networks:
  cassandra-net:
    driver: bridge
