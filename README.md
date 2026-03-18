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

git clone https://github.com/your-username/restaurant-manager.git
cd restaurant-manager
python -m venv venv
source venv/bin/activate  # для Linux/Mac
venv\Scripts\activate     # для Windows
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver

## 🚀 Быстрый старт
```bash
docker-compose up -d
docker exec -it cassandra-seed cqlsh -f schema.cql
docker exec -it cassandra-seed cqlsh -f data.cql
restaurant-manager/
├── backend/
│   ├── apps/            # Бизнес-логика
│   │   ├── orders/
│   │   ├── menu/
│   │   └── inventory/
│   ├── config/          # Настройки проекта
│   ├── templates/       # HTML-шаблоны
│   └── static/          # Статические файлы
├── frontend/            # Клиентская часть
│   ├── components/      # Компоненты интерфейса
│   └── styles/          # CSS-стили
├── docs/                # Документация
├── requirements.txt     # Зависимости
└── README.md            # Документация

Python 3.9+
PostgreSQL 13+
Redis 6+
Nginx 1.18+
Node.js (для фронтенда)

Аппаратные требования:
Процессор: от 2 ядер
Оперативная память: от 4 ГБ
Место на диске: от 5 ГБ

Команда разработчиков
Основные участники:
Кузнецов Артём — Технический директор
Разработка архитектуры
Руководство проектом
Кузнецов Артём — Ведущий разработчик бэкенда
Разработка API
Оптимизация производительности
Кузнецов Артём — Frontend-разработчик
Разработка пользовательского интерфейса
Оптимизация UX/UI

## Контактная информация

**Email:** ggwplanaya_gg27@mail.ru
**Телефон:** +79281943714
**Telegram:** @ggwplanaya
**GitHub:** [Чебупели]
