# Using official python image
FROM python:3.10-slim

# Installing the working directory inside the container
WORKDIR /app

# Installing the PostgreSQL dependencies required for psycopg2
RUN apt-get update && apt-get install -y libpq-dev gcc

# Copying the project files to the container
COPY . /app

# Installing dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Open the port FastAPI to run
EXPOSE 8000

# Starting FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
