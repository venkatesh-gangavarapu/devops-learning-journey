# Day-13: GitHub Actions – CI Pipelines (DevOps Perspective)

## Overview
Day-13 focused on building a real Continuous Integration (CI) pipeline using GitHub Actions.
The goal was to understand how pipelines are triggered, executed, debugged, and fixed
from a DevOps engineer’s point of view.

## What Was Implemented
- GitHub Actions workflow triggered on:
  - Push to `main`
  - Pull Requests targeting `main`
- Basic CI pipeline structure using jobs and steps
- Repository checkout using `actions/checkout`
- Validation steps executed on a GitHub-hosted runner

## Key Learnings
- GitHub Actions workflows must be placed in `.github/workflows/`
- YAML indentation and syntax are critical
- Every step must explicitly define `run` or `uses`
- Pipelines fail for a reason — logs always tell the story
- Debugging CI pipelines is a core DevOps responsibility

## Outcome
- Successfully ran CI pipeline
- Intentionally broke and fixed the workflow
- Gained confidence in reading and debugging GitHub Actions pipelines

## Interview Questions
- Q1: What triggers GitHub Actions?
- Q2: Where are workflows stored?
- Q3: What is runner?
- Q4: How do you debug a failing pipeline?
- Q5: Why run CI on PRs?



## Next Steps
- Extend CI pipeline to build Docker images
- Push images to container registry
- Implement production-grade CI workflows

