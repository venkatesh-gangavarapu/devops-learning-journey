# Day-6: Linux Fundamentals for DevOps (Production Perspective)

## Overview
Day-6 focused on strengthening Linux fundamentals specifically from a DevOps and production operations perspective.  
The goal was to understand how Linux behaves underneath containers, services, and cloud infrastructure.

## Topics Covered

### Linux Filesystem (DevOps View)
- `/etc` – configuration files
- `/var/log` – logs (primary source for troubleshooting)
- `/var/lib` – stateful application data
- `/opt` – optional software and agents

### Processes and Services
- Difference between processes and services
- How systemd manages long-running services
- Why services fail silently if logs are not checked

### Logs and Troubleshooting
- Importance of logs as the first source of truth
- Reading logs using `tail` and `journalctl`
- Understanding NGINX and system logs

### Permissions and Ownership
- Linux permission model (r, w, x)
- Why permission issues cause application and container failures
- Understanding read-only filesystems in containers

## Key Learnings
- Containers are just Linux processes with isolation
- Most production issues can be traced via logs
- Understanding Linux fundamentals is critical before Kubernetes and cloud platforms

## Next Steps
- Networking fundamentals for DevOps
- Docker internals
- Kubernetes orchestration

