USE software_requirements;

-- Все проекты
SELECT * FROM projects;

-- Требования проекта CRM
SELECT * FROM requirements_by_project WHERE project_id = 11111111-1111-1111-1111-111111111111;

-- Требования по типу
SELECT * FROM requirements_by_type WHERE type = 'FUNCTIONAL';

-- Требования по статусу
SELECT * FROM requirements_by_status WHERE status = 'APPROVED';

-- Требования по приоритету
SELECT * FROM requirements_by_priority WHERE priority = 'CRITICAL';

-- Требования по автору
SELECT * FROM requirements_by_author WHERE author = 'Иванов';

-- Трассировка
SELECT * FROM requirement_traceability WHERE source_req_id = 11111111-1111-1111-1111-111111111111;

-- История требования
SELECT * FROM requirement_history WHERE req_id = 11111111-1111-1111-1111-111111111111;

-- Комментарии
SELECT * FROM requirement_comments WHERE req_id = 11111111-1111-1111-1111-111111111111;

-- Статистика по типам
SELECT type, COUNT(*) FROM requirements_by_project GROUP BY type;

-- Уровни согласованности
CONSISTENCY ONE;
SELECT COUNT(*) FROM requirements_by_project;

CONSISTENCY QUORUM;
SELECT COUNT(*) FROM requirements_by_project;
