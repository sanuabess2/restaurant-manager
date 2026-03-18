CREATE KEYSPACE IF NOT EXISTS software_requirements
WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': 3
};

USE software_requirements;

CREATE TABLE IF NOT EXISTS projects (
    project_id uuid PRIMARY KEY,
    name text,
    description text,
    owner text,
    status text,
    start_date timestamp,
    end_date timestamp,
    created_at timestamp
);

CREATE TABLE IF NOT EXISTS requirements_by_project (
    project_id uuid,
    req_id uuid,
    req_key text,
    title text,
    description text,
    type text,
    priority text,
    status text,
    author text,
    created_date timestamp,
    modified_date timestamp,
    version int,
    PRIMARY KEY (project_id, req_id)
);

CREATE TABLE IF NOT EXISTS requirements_by_type (
    type text,
    created_date timestamp,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    priority text,
    status text,
    author text,
    PRIMARY KEY (type, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);

CREATE TABLE IF NOT EXISTS requirements_by_status (
    status text,
    created_date timestamp,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    type text,
    priority text,
    author text,
    PRIMARY KEY (status, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);

CREATE TABLE IF NOT EXISTS requirements_by_priority (
    priority text,
    created_date timestamp,
    req_id uuid,
    project_id uuid,
    req_key text,
    title text,
    type text,
    status text,
    author text,
    PRIMARY KEY (priority, created_date, req_id)
) WITH CLUSTERING ORDER BY (created_date DESC);

CREATE TABLE IF NOT EXISTS requirements_by_author (
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

CREATE TABLE IF NOT EXISTS requirement_traceability (
    source_req_id uuid,
    target_req_id uuid,
    relation_type text,
    project_id uuid,
    description text,
    created_at timestamp,
    created_by text,
    PRIMARY KEY (source_req_id, target_req_id)
);

CREATE TABLE IF NOT EXISTS requirement_history (
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

CREATE TABLE IF NOT EXISTS requirement_attributes (
    req_id uuid PRIMARY KEY,
    attributes map<text, text>,
    estimated_hours int,
    actual_hours int,
    difficulty int,
    risk text,
    cost decimal
);

CREATE TABLE IF NOT EXISTS requirement_comments (
    req_id uuid,
    comment_id uuid,
    author text,
    comment text,
    created_at timestamp,
    PRIMARY KEY (req_id, created_at, comment_id)
) WITH CLUSTERING ORDER BY (created_at DESC);
