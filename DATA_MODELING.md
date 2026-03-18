# Моделирование данных для требований к ПО

## 📊 Принципы моделирования

1. **Требования читаются по проекту** → таблица `requirements_by_project`
2. **Требования фильтруются по типу** → таблица `requirements_by_type`
3. **Требования по статусу** → таблица `requirements_by_status`
4. **Требования по приоритету** → таблица `requirements_by_priority`
5. **Требования по автору** → таблица `requirements_by_author`

## 📋 Таблицы

### projects
```cql
CREATE TABLE projects (
    project_id uuid PRIMARY KEY,
    name text,
    description text,
    owner text,
    status text,
    start_date timestamp,
    end_date timestamp,
    created_at timestamp
);
CREATE TABLE requirements_by_project (
    project_id uuid,
    req_id uuid,
    req_key text,
    title text,
    description text,
    type text,           -- FUNCTIONAL, NON_FUNCTIONAL, BUSINESS, USER, SYSTEM
    priority text,       -- CRITICAL, HIGH, MEDIUM, LOW
    status text,         -- DRAFT, REVIEW, APPROVED, REJECTED, IMPLEMENTED, TESTED
    author text,
    created_date timestamp,
    modified_date timestamp,
    version int,
    PRIMARY KEY (project_id, req_id)
);
CREATE TABLE requirements_by_status (
    status text,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    type text,
    priority text,
    author text,
    created_date timestamp,
    PRIMARY KEY (status, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);
CREATE TABLE requirements_by_priority (
    priority text,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    type text,
    status text,
    author text,
    created_date timestamp,
    PRIMARY KEY (priority, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);
CREATE TABLE requirements_by_author (
    author text,
    created_date timestamp,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    type text,
    status text,
    priority text,
    PRIMARY KEY (author, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);
CREATE TABLE requirement_traceability (
    source_req_id uuid,
    target_req_id uuid,
    relation_type text,   -- PARENT, CHILD, DEPENDS, BLOCKS, DERIVES, SATISFIES
    project_id uuid,
    description text,
    PRIMARY KEY (source_req_id, target_req_id)
);
CREATE TABLE requirement_history (
    req_id uuid,
    changed_at timestamp,
    changed_by text,
    field text,
    old_value text,
    new_value text,
    reason text,
    PRIMARY KEY (req_id, changed_at)
) WITH CLUSTERING ORDER BY (changed_at DESC);
CREATE TABLE requirement_attributes (
    req_id uuid PRIMARY KEY,
    attributes map<text, text>,  -- Гибкие атрибуты
    estimated_hours int,
    actual_hours int,
    difficulty int,
    risk text,
    cost decimal
);
CREATE TABLE requirement_comments (
    req_id uuid,
    comment_id uuid,
    author text,
    comment text,
    created_at timestamp,
    PRIMARY KEY (req_id, created_at, comment_id)
) WITH CLUSTERING ORDER BY (created_at DESC);
