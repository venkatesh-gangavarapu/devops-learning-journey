# Day-17: Automated Continuous Delivery (Production DevOps)

## Overview
Day-17 focused on implementing production-style automated Continuous Delivery (CD).
The goal was to deploy Docker images safely to a production-like VM using health checks,
rollback logic, and secure automation.

## CD Architecture
- CI builds and pushes Docker images
- CD triggers deployment on the target server
- Deployment logic lives on the server
- CI/CD pipelines only trigger deployment, not define it

## Deployment Flow
1. CI pipeline builds and pushes Docker image
2. CD pipeline connects to server via SSH
3. Server pulls the specified image tag
4. Old container is replaced with the new version
5. Health endpoint is verified
6. Deployment succeeds or rolls back automatically

## Why This Is Production-Grade
- Build once, deploy many times
- Immutable artifacts
- Health-gated releases
- Automatic rollback on failure
- Secure secret management

## Key Learnings
- Deployment scripts should not be copied from GitHub every run
- Production behavior must be predictable and controlled
- CI and CD serve different responsibilities
- Health checks are critical for safe deployments

## Interview Questions
- Q1: How do you automate deployments?
- Q2: How do you rollback automatically?
- Q3: Do you deploy on every commit?
- Q4: Where are secrets stored?
- Q5: IS this CD or CI?



## Next Steps
- Failure handling and recovery
- Advanced rollback strategies
- Kubernetes deployments

