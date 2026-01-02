FROM python:3.11-slim

# Create non-root user (Production Practice)
RUN useradd -m appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Switch to non-root user
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
