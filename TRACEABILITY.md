```markdown
# Трассировка требований

##  Типы связей

| Тип связи | Описание | Пример |
|-----------|----------|--------|
| PARENT/CHILD | Иерархия | Бизнес-требование → Функциональное |
| DEPENDS_ON | Зависимость | Требование зависит от другого |
| BLOCKS | Блокировка | Требование блокирует выполнение |
| DERIVES | Происхождение | Требование вытекает из другого |
| SATISFIES | Удовлетворение | Реализация удовлетворяет требованию |
| VERIFIES | Проверка | Тест проверяет требование |

##  Модель данных

```cql
CREATE TABLE requirement_traceability (
    source_req_id uuid,
    target_req_id uuid,
    relation_type text,
    project_id uuid,
    description text,
    created_at timestamp,
    created_by text,
    PRIMARY KEY (source_req_id, target_req_id)
);
-- От бизнес-требования к функциональным
SELECT * FROM requirement_traceability 
WHERE source_req_id = 11111111-1111-1111-1111-111111111111;
-- От функционального к бизнес-требованию
SELECT * FROM requirement_traceability 
WHERE target_req_id = 22222222-2222-2222-2222-222222222222 
ALLOW FILTERING;
-- Все связи требования
SELECT 
    source_req_id, 
    target_req_id, 
    relation_type 
FROM requirement_traceability 
WHERE source_req_id = 11111111-1111-1111-1111-111111111111
   OR target_req_id = 11111111-1111-1111-1111-111111111111
ALLOW FILTERING;
