### Production-Grade Dockerized Application Stack (NGINX + App + Redis + PostgreSQL)

## Overview
'''

This project demonstrates a production-style, end-to-end containerized application architecture built and debugged using Docker Compose, following real DevOps engineering practices.

The focus is not on application development, but on:

- Infrastructure wiring
- Reverse proxy configuration
- Service health checks
- Networking and DNS behavior
- Startup dependency handling
- Real production troubleshooting scenarios

This setup closely mirrors how DevOps engineers validate systems locally before deploying to Kubernetes or AWS ECS.

'''

## Architecture
```bash
Client / Browser
        |
        v
     NGINX (Reverse Proxy)
        |
        v
   Backend Application
        |
   ┌────┴─────┐
   v          v
 Redis      PostgreSQL
(Cache)     (SQL DB)
```

## Key Architecture Rules

- Only NGINX is publicly exposed
- Backend, Redis, and PostgreSQL run on a private Docker network
- Configuration via environment variables
- Data persistence via Docker volumes
- Independent health checks per service

## Technology Stack

- Docker & Docker Compose
- NGINX (Reverse Proxy)
- Python Flask (Backend API)
- Redis (Caching)
- PostgreSQL (Relational Database)

## Project Structure
```bash
week1/day5-e2e/
├── docker-compose.yml
├── nginx/
│   └── default.conf
└── app/
    ├── app.py
    ├── requirements.txt
    └── Dockerfile
```
## Service Responsibilities

### NGINX

- Acts as a reverse proxy
- Serves as the single public entry point
- Exposes an independent /health endpoint
- Routes traffic to backend using runtime DNS resolution

### Backend Application

- Exposes / and /health endpoints
- Connects to Redis and PostgreSQL
- Handles dependency failures gracefully
- Does not crash if downstream services are temporarily unavailable

### Redis

- Used for caching and counters
- Runs as an internal service only
- Uses append-only persistence

### PostgreSQL

- Persistent relational database
- Uses Docker volume for data durability
- Accessed via non-root database user

## Networking & Security Model

- Custom Docker bridge network (prod-net)
- Internal DNS resolution via Docker (127.0.0.11)
- No internal service ports exposed to host
- Read-only mounts for NGINX configuration
- Minimal base images (alpine, slim) to reduce attack surface

## Health Checks (Production Design)

- Service    ---------------    Health Check Strategy
- NGINX      ---------------    Local /health endpoint (independent of backend)
- App        ---------------    HTTP /health on port 5000
- Redis      ---------------	redis-cli ping
- PostgreSQL ---------------	pg_isready


### Key Principle:

- Each service validates its own health independently to avoid cascading failures.

## Real Production Issues Encountered & Fixed

This project intentionally surfaced real-world DevOps problems:

❌ Issue 1: Containers Running but UNHEALTHY

- Root cause: Health checks pointed to wrong ports

- Fix: Corrected healthcheck targets to actual listening ports

❌ Issue 2: NGINX Returning 404 on /health

- Root cause: Default NGINX config loaded instead of custom config

- Fix: Mounted config into /etc/nginx/conf.d/ (best practice)

❌ Issue 3: NGINX Crashing on Startup

```bash
host not found in upstream "backend"
```

- Root cause: NGINX resolves DNS only at startup

- Backend container DNS not yet available

### ✅ Production Fix Applied:

- Removed static upstream block

- Implemented runtime DNS resolution using:
```bash
resolver 127.0.0.11 valid=10s;
proxy_pass http://app:5000;
```

This prevents NGINX from crashing if backend starts later.

### How to Run
```bash
docker compose up -d --build
```

### Verify:
```bash
docker compose ps
```

### Expected:
```bash
nginx     running (healthy)
app       running (healthy)
redis     running (healthy)
postgres  running (healthy)
```

## Verification
```bash
curl http://localhost:8080/health
```
```
OK
```
```bash
curl http://localhost:8080
```

Returns JSON response from backend, confirming:

- NGINX → App routing

- Redis connectivity

- PostgreSQL connectivity

## Troubleshooting Commands (Real DevOps Workflow)
```bash
docker compose logs nginx
docker compose logs app
docker inspect <container>
docker exec -it <container> sh
```

