# Day-9: NGINX Fundamentals for DevOps (Production Perspective)

## Overview
Day-9 focused on understanding NGINX from a real-world DevOps and production operations perspective.
The goal was to understand how NGINX works internally, how it handles traffic, and why it fails silently when misconfigured.

## Topics Covered

### NGINX Process Model
- Master and worker processes
- Why NGINX will not start if configuration is invalid

### Configuration Structure
- Role of `/etc/nginx/nginx.conf`
- Best practice of using `/etc/nginx/conf.d/*.conf`
- Why overriding `nginx.conf` directly is risky

### Static Serving vs Reverse Proxy
- Why default "Welcome to nginx" appears
- Difference between `root` and `proxy_pass`
- Using NGINX as a reverse proxy in DevOps setups

### Health Checks
- Designing lightweight `/health` endpoints
- Why NGINX health checks should be independent of backend services

### DNS and Upstream Resolution
- Why NGINX resolves DNS at startup
- Problems with `upstream` blocks in containerized environments
- Using runtime DNS resolution with `resolver 127.0.0.11`

### Validation and Debugging
- Using `nginx -t` before reloads
- Reading access and error logs for troubleshooting

## Key Learnings
- NGINX acts as traffic control in DevOps systems
- Most NGINX failures are configuration-related and visible only in logs
- Correct configuration patterns prevent cascading failures in production

## Interview Questions
- Q1: Why does NGINX fail silently?
- Q2: Difference between `root` and `proxy_pass`?
- Q3: Why use `/conf.d/` instead of editing nginx.conf?
- Q4: Why avoid upstream block in containers?
- Q5: What is NGINX's role in DevOps?


## Next Steps
- Git fundamentals
- CI/CD pipelines
- Kubernetes orchestration

