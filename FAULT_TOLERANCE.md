```markdown
# Отказоустойчивость

##  Характеристики

- **Фактор репликации**: 3
- **Количество узлов**: 3
- **Толерантность**: до 2 узлов
- **Доступность**: 99.99% при отказе 1 узла

##  Тестирование

```bash
# Статус кластера
docker exec cassandra-seed nodetool status

# Остановка узла
docker stop cassandra-node1

# Проверка доступности требований
docker exec cassandra-seed cqlsh -e "
CONSISTENCY ONE;
SELECT * FROM software_requirements.requirements_by_project LIMIT 10;
"

# Восстановление
docker start cassandra-node1
