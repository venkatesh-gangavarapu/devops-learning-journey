# Day 4 - Docker Fundamentals & Application Containerization

## Overview
This project is part of my **DevOps learning journey**, focusing on **Docker fundamentals** and **real-world application containerization**.


On Day 4, I learned how containers work, how to write Dockerfiles from scratch, and how to package an application into a portable Docker image that can run consistently across environments.
---

## Objectives
- Understand Docker architecture (image, container, registry, layers)
- Run production-ready containers
- Write a Dockerfile manually
- Containerize a Python Flask application
- Build, run, inspect, and debug Docker containers
- Push a custom image to Docker Hub

---

## Technologies Used
- Docker
- Python 3
- Flask
- Nginx (official Docker image)
- Docker Hub

---

## Project Structure
week1/day4/ \
|-- python-app/ \
| |--- app.py \
| |--- requirements.txt \
| |--- Dockerfile \
|--- README.md 

## Hands on Tasks Performed

### 1. Verified Docker Installation
```bash
docker --version
docker run hello-world
```

### 2. Ran a Production Container (Nginx)
```bash
docker run -d -p 8080:80 nginx
```
- Accessed via browser: http://localhost:8080

### 3. Created a Python Flask Application
```bash
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Day-4 Dockerized App"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

### 4. Dockerfile Used
```bash
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```
### 5. Built Docker Image
```bash
docker build -t day4-python-app .
```

### 6. Ran Containerized Application
```bash
docker run -d -p 5000:5000 day4-python-app
```
- Accessed via browser: http://localhost:5000

### 7. Container Debugging & Inspection
```bash
docker logs <container_id>
docker inspect <container_id>
```

### 8. Pushed Image to Docker Hub
```bash
docker tag day4-python-app <dockerhub-username>/day4-python-app:1.0
docker push <dockerhub-username>/day4-python-app:1.0
```


## Interview Questions
- Q1: Image vs Container?
- Q2: Why containers are lightweight?
- Q3: Dockerfile vs Docker Compose?
- Q4: What is EXPOSE?
- Q5: CMD vs ENTRYPOINT?
- Q6: How do you debug a container?
- Q7: How do you reduce image size?
- Q8: What happens if container crashes?
- Q9: How does Docker networking work?
- Q10: How do containers persist data?


