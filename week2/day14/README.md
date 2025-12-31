# Day-14: CI + Docker Image Build (Production DevOps)

## Overview
Day-14 focused on building and pushing Docker images as CI artifacts using GitHub Actions.
This represents a real-world DevOps CI pipeline where container images are the primary deliverables.

## What Was Implemented
- Containerized a sample web application
- Dockerfile with production best practices:
  - Slim base image
  - Non-root user
  - Deterministic builds
- GitHub Actions CI pipeline:
  - Triggered on push and PR to main
  - Docker image build inside CI
  - Image tagging using commit SHA
  - Secure push to GitHub Container Registry (GHCR)

## Key Learnings
- CI pipelines must match Dockerfile build context
- Docker images must exist locally before pushing
- Registry naming and tagging are critical
- CI failures often come from small configuration mistakes
- GitHub Actions can replace traditional CI tools like Jenkins

## Outcome
- Successfully built and pushed Docker image to GHCR
- Verified image availability in GitHub Packages
- Gained real-world CI troubleshooting experience

## Interview Questions
- Q1: Why build Docker images in CI?
- Q2: Why not build locally?
- Q3: How do you tag images?
- Q4: Where do you store images?
- Q5: Is this CI or CD?

## Next Steps
- Add automated tests to CI
- Implement Continuous Deployment (CD)
- Deploy containers automatically

