# Day-19: Kubernetes Fundamentals & Deployment (Production DevOps)

## Overview
Day-19 focused on deploying a production-style containerized application into Kubernetes
and understanding how Kubernetes handles deployment, networking, health checks, and
private container registry authentication.

This hands-on session included real-world troubleshooting of image pull failures and
service exposure without relying on Minikube-specific commands.

---

## Architecture
- Docker image stored in GitHub Container Registry (GHCR)
- Kubernetes Deployment managing Pods
- Kubernetes Service exposing application
- Readiness probe for health-based traffic routing
- ImagePullSecret for private registry authentication

---

## Kubernetes Manifests
- `deployment.yaml` – Defines desired state and replicas
- `service.yaml` – Exposes the application inside the cluster

---

## Commands Used (Hands-on Execution)

### 1. Apply Kubernetes manifests
```bash
kubectl apply -f k8s/
```

### 2. Veify Pods and Services
```bash
kubectl get pods
kubectl get svc 
```

### 3. Debug ImagePullBackOff/ErrImagePull
```bash
kubectl describe pod <pod-name>
```

### 4. Create image pull secret for GHCR
```bash
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=venkatesh-gangavarapu \
  --docker-password=<GITHUB_PAT>
  --docker-email=<gangavarapuvenkatesh3@gmail.com>
```

### 5. Update Deployment to use imagePullSecrets
```bash
spec:
  imagePullSecrets:
    - name: ghcr-secret

```

### 6. Re-apply manifests after fixing authentication
```bash
kubectl apply -f k8s/
```

### 7. Verify Pods are running
```bash
kubectl get pods
```

### 8. Expose application using port-forward (cluster-agnostic)
```bash
kubectl port-forward service/devops-app-service 8080:80
```

### 9. Validate application access
```bash
curl http://localhost:8080
curl http://localhost:8080/health
```

## Interview Questions
- Q1: What causes ImagePullBackOff in Kubernetes?
- Q2: How do you authenticate Kubernetes to a private registry?
- Q3: How do you expose a Kubernetes service for local testing?
- Q4: What is the role of a readiness probe?
- Q5: How does Kubernetes improve reliability over VM-based deployments?


