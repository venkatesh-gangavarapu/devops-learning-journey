# Day-12: CI/CD Fundamentals & Pipeline Mindset (DevOps Perspective)

## Overview
Day-12 focused on understanding CI/CD from a DevOps mindset rather than tool-specific usage.
The goal was to understand how pipelines are designed, triggered, and debugged in real-world environments.

## Topics Covered

### CI vs CD
- Continuous Integration (CI): validating changes early
- Continuous Delivery (CD): keeping software deployable
- Continuous Deployment: automatic deployments after successful pipelines

### CI/CD Pipeline Structure
- Trigger → Build → Test → Scan → Deploy
- Pipelines as safety gates protecting production
- Importance of failing fast

### Pipeline Triggers
- Git push
- Pull Request creation
- PR merge
- Tags and releases

### Pipeline Failures
- Code issues
- Configuration mistakes
- Missing secrets
- Environment and dependency issues

### DevOps Pipeline Mindset
- Pipelines as signals, not errors
- Reading pipelines stage by stage
- DevOps ownership of CI/CD workflows

## Key Learnings
- CI/CD is the backbone of DevOps automation
- Pipelines connect Git, infrastructure, and deployments
- Understanding pipeline logic matters more than tools

## Interview Questions
- Q1: Difference between CI and CD?
- Q2: Why is CI important?
- Q3: What triggers CI/CD pipeline?
- Q4: Why do pipelines fail?
- Q5: Who owns pipelines?


## Next Steps
- GitHub Actions
- Automated builds
- Real CI pipelines

