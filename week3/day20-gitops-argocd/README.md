# Day-20: GitOps with ArgoCD (Production DevOps)

## Overview
Day-20 focused on implementing GitOps using ArgoCD to manage Kubernetes deployments.
Instead of manual `kubectl apply`, Git became the single source of truth and ArgoCD
handled synchronization, drift detection, and reconciliation.

This session involved real-world troubleshooting of ArgoCD sync failures and invalid
Kubernetes specifications.

---

## GitOps Architecture

Git Repository → ArgoCD → Kubernetes Cluster

- Git defines desired state
- ArgoCD continuously reconciles cluster state
- No direct kubectl usage in production

---

## Repository Structure

```text
gitops/
└── dev/
    ├── deployment.yaml
    ├── service.yaml
    └── kustomization.yaml
```

## Commands Used (Hands-on)

### Install ArgoCD
```bash
kubectl create namespace argocd
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Acess ArgoCD UI
```bash
kubectl port-forward svc/argocd-server -n argocd 8081:443
```

### Get ArgoCD admin password
```bash
kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
```

### Validate GitOps manifests locally
```bash
kubectl kustomize gitops/dev
```

### Sync and verify kubernetes resources
```bash
kubectl get applications -n argocd
kubectl get deploy
kubectl get pods
kubectl get svc
```

## Troubleshooting Performed
```text
Issue 1: ArgoCD showed Healthy but no resources existed
Root Cause: Kustomize rendered no manifests
Fix: Corrected ```kubermization.yaml``` and verified with ```kubectl kustomize```

Issue 2: ArgoCD SyncFailed during patching
Root Cause:
- Missing spec.ports in Service
- Mismatch between Deployment selector and pod labels
Fix: Corrected Kubernetes specs and re-synced via ArgoCD
```


