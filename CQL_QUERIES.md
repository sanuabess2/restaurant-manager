```markdown
# Примеры запросов CQL для требований

##  Базовые запросы

### Все проекты
```cql
SELECT * FROM projects;
SELECT * FROM requirements_by_project 
WHERE project_id = 11111111-1111-1111-1111-111111111111;
SELECT * FROM requirements_by_type 
WHERE type = 'FUNCTIONAL';
SELECT * FROM requirements_by_type 
WHERE type = 'FUNCTIONAL';
SELECT * FROM requirements_by_status 
WHERE status = 'APPROVED';
SELECT * FROM requirements_by_priority 
WHERE priority = 'CRITICAL';
SELECT * FROM requirements_by_author 
WHERE author = 'трофимов';
SELECT * FROM requirement_traceability 
WHERE source_req_id = 11111111-1111-1111-1111-111111111111;
SELECT * FROM requirement_history 
WHERE req_id = 11111111-1111-1111-1111-111111111111;
SELECT * FROM requirement_comments 
WHERE req_id = 11111111-1111-1111-1111-111111111111;
SELECT type, COUNT(*) 
FROM requirements_by_project 
GROUP BY type;
SELECT status, COUNT(*) 
FROM requirements_by_status 
GROUP BY status;
SELECT * FROM requirement_history 
LIMIT 100;
CONSISTENCY ONE;
CONSISTENCY QUORUM;
CONSISTENCY ALL;
