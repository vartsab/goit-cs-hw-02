# Використовуємо офіційний Python образ
FROM python:3.10-slim

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Встановлюємо залежності PostgreSQL, необхідні для psycopg2
RUN apt-get update && apt-get install -y libpq-dev gcc

# Копіюємо файли проекту в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт, на якому буде працювати FastAPI
EXPOSE 8000

# Команда для запуску FastAPI застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
