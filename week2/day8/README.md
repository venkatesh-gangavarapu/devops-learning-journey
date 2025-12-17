# Day-8: Docker Internals for DevOps (Production Perspective)

## Overview
Day-8 focused on understanding how Docker works internally from a DevOps and production operations perspective.
The goal was to remove the “black box” feeling and make container behavior predictable and debuggable.

## Topics Covered

### Containers vs Virtual Machines
- Containers are Linux processes with isolation
- Containers share the host kernel
- If the main process exits, the container exits

### Images vs Containers
- Images are immutable blueprints
- Containers are runtime instances
- Containers are ephemeral by design

### Dockerfile Internals
- CMD vs ENTRYPOINT
- Why incorrect CMD causes container exit
- How application crashes affect container lifecycle

### Logs and Debugging
- Importance of `docker logs` as the first step
- Using `docker exec` for live debugging
- Logs-first mindset for production issues

### Volumes and Persistence
- Why containers are stateless by default
- How volumes persist data outside container lifecycle
- Why databases must always use volumes

### Health Checks
- Health checks execute commands inside the container
- Exit codes determine container health
- Health checks do not restart containers automatically

### Image Layers and Build Cache
- Layered image build process
- How Docker cache works
- Why `--build` is sometimes required

## Key Learnings
- Docker behavior becomes predictable when you understand process lifecycle
- Most container issues are caused by CMD, ports, or missing dependencies
- Docker internals knowledge is essential before Kubernetes

## Interview Questions
- Q1: Why does a container exit immediately?
- Q2: Difference between CMD and ENTRYPOINT?
- Q3: Are containers VMs?
- Q4: How do you debug a failing container?
- Q5: Why are volumes important?


## Next Steps
- NGINX fundamentals
- Kubernetes orchestration
- CI/CD pipelines

