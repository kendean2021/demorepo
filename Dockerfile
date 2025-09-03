FROM python:3.12-slim
ENV PORT=8080 PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8080
USER 10001
CMD ["sh","-lc","uvicorn app.main:app --host 0.0.0.0 --port ${PORT}"]

