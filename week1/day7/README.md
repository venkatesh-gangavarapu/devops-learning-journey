# Day-7: Networking Fundamentals for DevOps (Production Perspective)

## Overview
Day-7 focused on understanding networking fundamentals exactly as used by DevOps engineers in production environments.  
The goal was to understand how traffic flows, why connections fail, and how to debug networking issues calmly.

## Topics Covered

### Ports and Listening Services
- Understanding ports as service endpoints
- Verifying listening services using `ss`
- Why services must listen for traffic to be reachable

### localhost vs 0.0.0.0
- localhost (127.0.0.1) is accessible only within the same host
- 0.0.0.0 binds to all interfaces
- Why containers must bind to 0.0.0.0

### DNS Fundamentals
- DNS as name-to-IP resolution
- Linux DNS configuration via `/etc/resolv.conf`
- Understanding how names are resolved in containers

### Docker Networking
- Docker bridge networks
- Service name–based discovery
- Docker internal DNS (127.0.0.11)

### Connection Errors
- Connection refused → application issue
- Connection timeout → network/firewall issue

## Key Learnings
- Most DevOps networking issues are due to incorrect bindings or DNS assumptions
- Debugging should always be done hop-by-hop
- Understanding networking fundamentals makes Docker and Kubernetes much easier

## Interview Questions
- Q1: Difference between localhost and 0.0.0.0?
- Q2: Why can't containers talk via localhost?
- Q3: What does "connection refused" mean?
- Q4: What DNS does Docker use?
- Q5: How does Docker service discovery work?



## Next Steps
- Docker internals
- Container lifecycle
- Health checks and startup behavior

