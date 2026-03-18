```markdown
# Репликация и согласованность

##  Репликация

```cql
CREATE KEYSPACE software_requirements
WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': 3
};
