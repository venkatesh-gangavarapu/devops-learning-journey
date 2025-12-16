Ì∫Ä Production-Grade Dockerized Application Stack (NGINX + App + Redis + PostgreSQL)
Ì≥å Overview

This project demonstrates a production-style, end-to-end containerized application architecture built and debugged using Docker Compose, following real DevOps engineering practices.

The focus is not on application development, but on:

Infrastructure wiring

Reverse proxy configuration

Service health checks

Networking and DNS behavior

Startup dependency handling

Real production troubleshooting scenarios

This setup closely mirrors how DevOps engineers validate systems locally before deploying to Kubernetes or AWS ECS.

ÌøóÔ∏è Architecture
Client / Browser
        |
        v
     NGINX (Reverse Proxy)
        |
        v
   Backend Application
        |
   ‚îå‚îÄ‚îÄ‚îÄ‚îÄ‚î¥‚îÄ‚îÄ‚îÄ‚îÄ‚îÄ‚îê
   v          v
 Redis      PostgreSQL
(Cache)     (SQL DB)

Key Architecture Rules

Only NGINX is publicly exposed

Backend, Redis, and PostgreSQL run on a private Docker network

Configuration via environment variables

Data persistence via Docker volumes

Independent health checks per service

Ìª†Ô∏è Technology Stack

Docker & Docker Compose

NGINX (Reverse Proxy)

Python Flask (Backend API)

Redis (Caching)

PostgreSQL (Relational Database)

Ì≥Ç Project Structure
week1/day5-e2e/
‚îú‚îÄ‚îÄ docker-compose.yml
‚îú‚îÄ‚îÄ nginx/
‚îÇ   ‚îî‚îÄ‚îÄ default.conf
‚îî‚îÄ‚îÄ app/
    ‚îú‚îÄ‚îÄ app.py
    ‚îú‚îÄ‚îÄ requirements.txt
    ‚îî‚îÄ‚îÄ Dockerfile

‚öôÔ∏è Service Responsibilities
Ì¥π NGINX

Acts as a reverse proxy

Serves as the single public entry point

Exposes an independent /health endpoint

Routes traffic to backend using runtime DNS resolution

Ì¥π Backend Application

Exposes / and /health endpoints

Connects to Redis and PostgreSQL

Handles dependency failures gracefully

Does not crash if downstream services are temporarily unavailable

Ì¥π Redis

Used for caching and counters

Runs as an internal service only

Uses append-only persistence

Ì¥π PostgreSQL

Persistent relational database

Uses Docker volume for data durability

Accessed via non-root database user

Ì¥ê Networking & Security Model

Custom Docker bridge network (prod-net)

Internal DNS resolution via Docker (127.0.0.11)

No internal service ports exposed to host

Read-only mounts for NGINX configuration

Minimal base images (alpine, slim) to reduce attack surface

‚ù§Ô∏è Health Checks (Production Design)
Service	Health Check Strategy
NGINX	Local /health endpoint (independent of backend)
App	HTTP /health on port 5000
Redis	redis-cli ping
PostgreSQL	pg_isready

Key Principle:

Each service validates its own health independently to avoid cascading failures.

Ì∑† Real Production Issues Encountered & Fixed

This project intentionally surfaced real-world DevOps problems:

‚ùå Issue 1: Containers Running but UNHEALTHY

Root cause: Health checks pointed to wrong ports

Fix: Corrected healthcheck targets to actual listening ports

‚ùå Issue 2: NGINX Returning 404 on /health

Root cause: Default NGINX config loaded instead of custom config

Fix: Mounted config into /etc/nginx/conf.d/ (best practice)

‚ùå Issue 3: NGINX Crashing on Startup
host not found in upstream "backend"


Root cause: NGINX resolves DNS only at startup

Backend container DNS not yet available

‚úÖ Production Fix Applied:

Removed static upstream block

Implemented runtime DNS resolution using:

resolver 127.0.0.11 valid=10s;
proxy_pass http://app:5000;


This prevents NGINX from crashing if backend starts later.

‚ñ∂Ô∏è How to Run
docker compose up -d --build


Verify:

docker compose ps


Expected:

nginx     running (healthy)
app       running (healthy)
redis     running (healthy)
postgres  running (healthy)

Ìºê Verification
curl http://localhost:8080/health

OK

curl http://localhost:8080


Returns JSON response from backend, confirming:

NGINX ‚Üí App routing

Redis connectivity

PostgreSQL connectivity

Ì∑™ Troubleshooting Commands (Real DevOps Workflow)
docker compose logs nginx
docker compose logs app
docker inspect <container>
docker exec -it <container> sh


Logs were always used as the first source of truth, not restarts.
