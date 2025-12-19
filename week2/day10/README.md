# Day-10: Git Fundamentals for DevOps (Production Perspective)

## Overview
Day-10 focused on understanding Git from a DevOps and production perspective.
Instead of treating Git as a developer-only tool, the goal was to understand Git as the
single source of truth for applications, infrastructure, and CI/CD pipelines.

## Topics Covered

### Git Core Concepts
- Repository as a versioned history of changes
- Commit as a snapshot of system state
- Branches as parallel timelines for safe changes
- Remote repositories as shared collaboration points

### DevOps Git Workflow
- Clone → change → add → commit → push
- Importance of clean, meaningful commit messages
- One logical change per commit

### Branching Strategy
- main branch as production
- feature branches for isolated changes
- Safe merging into main branch

### Rollbacks and Recovery
- Using `git revert` for safe rollbacks in shared repositories
- Understanding why `git reset --hard` is dangerous in production

### Git and CI/CD
- How Git events trigger CI/CD pipelines
- Why Git discipline is critical for reliable automation
- Intro to GitOps principles

## Key Learnings
- Git is not just version control, it is a state management system
- Most DevOps automation starts with a Git push
- Clean Git history simplifies CI/CD and troubleshooting

## Next Steps
- Git workflows and pull requests
- CI/CD pipelines
- Kubernetes and GitOps

