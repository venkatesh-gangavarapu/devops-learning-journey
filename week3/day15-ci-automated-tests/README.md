# Day-15: CI + Automated Tests (Production DevOps)

## Overview
Day-15 focused on implementing automated testing as a quality gate in a CI pipeline.
The objective was to ensure that broken applications never progress to artifact creation
or deployment stages.

## What Was Implemented
- Added automated tests for critical application endpoints
- Integrated pytest into the CI pipeline
- Enforced test execution before Docker image build
- Configured CI to fail immediately on test failures

## Why This Matters in Production
In real-world MNC environments:
- CI pipelines act as the first line of defense
- Broken code must never reach production artifacts
- Automated tests provide fast feedback and confidence

## Key Learnings
- CI without tests provides false confidence
- Tests should run before building or deploying artifacts
- Pipeline failures are intentional safety mechanisms
- DevOps engineers enforce testing, not write business logic tests

## Outcome
- CI pipeline fails when application health is broken
- Docker image build is blocked if tests fail
- Established a true CI quality gate

## Interview Questions
- Q1: Why run tests in CI?
- Q2: Where should tests run in pipeline?
- Q3: What happens if tests fail?
- Q4: Is testing DevOps responsibility?
- Q5: What kind of tests does DevOps care about?


## Next Steps
- Continuous Delivery (CD)
- Automated deployments
- Rollback and recovery strategies

