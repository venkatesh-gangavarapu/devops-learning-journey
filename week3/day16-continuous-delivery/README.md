# Day-16: Continuous Delivery (Production DevOps)

## Overview
Day-16 focused on understanding Continuous Delivery (CD) from a real-world, production DevOps perspective.
The goal was to learn how organizations safely release software without causing outages.

## CI vs CD
- CI ensures code correctness and produces immutable artifacts
- CD controls when, where, and how artifacts are released
- CI builds confidence; CD manages risk

## Build Once, Deploy Many Times
- Docker images are immutable artifacts
- The same image is promoted across dev, staging, and production
- Only configuration changes between environments

## Environments
- dev: fast feedback, frequent deployments
- staging: production-like validation
- prod: protected, audited releases

## Deployment Strategies
- Rolling deployments for gradual rollouts
- Blue-Green deployments for safer releases and easy rollback
- Canary deployments for risk-controlled exposure

## Health-Gated Delivery
- Container start ≠ application healthy
- Health endpoints act as release gates
- Deployments must fail and rollback if health checks fail

## Key Learnings
- Continuous Delivery is about safety, not speed
- Separating CI and CD reduces production risk
- Rollback is a first-class requirement in CD systems

## Interview Questions
- Q1: What is Continuous Delivery?
- Q2: Why separate CI and CD?
- Q3: Why health checks are mandatory?
- Q4: What is rollback?
- Q5: Is CD always automatic?



## Next Steps
- Automated Continuous Delivery
- Rollback and failure recovery
- Kubernetes-based deployments

