FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8080
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# FastAPI example: uvicorn app.main:app
# Flask example: gunicorn -b 0.0.0.0:8080 "app:create_app()"
EXPOSE 8080
USER 10001
CMD ["sh", "-lc", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT}"]

