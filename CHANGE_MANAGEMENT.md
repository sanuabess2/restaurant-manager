```markdown
# Управление изменениями требований

##  История изменений

```cql
CREATE TABLE requirement_history (
    req_id uuid,
    changed_at timestamp,
    changed_by text,
    field text,
    old_value text,
    new_value text,
    reason text,
    version int,
    PRIMARY KEY (req_id, changed_at)
) WITH CLUSTERING ORDER BY (changed_at DESC);
ALTER TABLE requirements_by_project ADD version int;
-- Полная история требования
SELECT * FROM requirement_history 
WHERE req_id = 11111111-1111-1111-1111-111111111111;

-- Изменения за период
SELECT * FROM requirement_history 
WHERE req_id = 11111111-1111-1111-1111-111111111111 
  AND changed_at >= '2024-01-01' 
  AND changed_at <= '2024-12-31';

-- Кто менял требование
SELECT DISTINCT changed_by 
FROM requirement_history 
WHERE req_id = 11111111-1111-1111-1111-111111111111;
CREATE TABLE requirement_comments (
    req_id uuid,
    comment_id uuid,
    author text,
    comment text,
    created_at timestamp,
    PRIMARY KEY (req_id, created_at, comment_id)
) WITH CLUSTERING ORDER BY (created_at DESC);
-- Статистика изменений по автору
SELECT changed_by, COUNT(*) 
FROM requirement_history 
GROUP BY changed_by;

-- Последние 100 изменений
SELECT * FROM requirement_history 
LIMIT 100;
