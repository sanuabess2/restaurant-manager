# Разработка требований к программному обеспечению в Cassandra

**Трофимов**  
Тема: Моделирование NoSQL-базы для системы управления требованиями к ПО. Создание схемы хранения данных в Cassandra и выполнение запросов на CQL. Фиксирование особенностей распределённости и отказоустойчивости.

<div align="center">
  ![Cassandra](https://img.shields.io/badge/Apache%20Cassandra-1287B1?style=flat-square&logo=apache%20cassandra&logoColor=white)
  ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
</div>

## 📚 Документация

| Файл | Описание |
|------|----------|
| [ARCHITECTURE.md](ARCHITECTURE.md) | Архитектура системы |
| [DATA_MODELING.md](DATA_MODELING.md) | Моделирование данных |
| [REQUIREMENTS_TYPES.md](REQUIREMENTS_TYPES.md) | Типы требований |
| [CQL_QUERIES.md](CQL_QUERIES.md) | Примеры запросов CQL |
| [REPLICATION_CONSISTENCY.md](REPLICATION_CONSISTENCY.md) | Репликация и согласованность |
| [FAULT_TOLERANCE.md](FAULT_TOLERANCE.md) | Отказоустойчивость |
| [TRACEABILITY.md](TRACEABILITY.md) | Трассировка требований |
| [CHANGE_MANAGEMENT.md](CHANGE_MANAGEMENT.md) | Управление изменениями |
| [RUNBOOKS.md](RUNBOOKS.md) | Инструкции администратора |

## 🚀 Быстрый старт
```bash
docker-compose up -d
docker exec -it cassandra-seed cqlsh -f schema.cql
docker exec -it cassandra-seed cqlsh -f data.cql
