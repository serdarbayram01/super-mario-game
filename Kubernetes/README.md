# Super Mario Kubernetes Deployment

Bu dizin, Super Mario uygulamasının Kubernetes cluster'ına deploy edilmesi için gerekli manifest dosyalarını içerir.

## 📋 Dosyalar

- **deployment.yaml**: Super Mario uygulamasının Kubernetes Deployment tanımı
- **service.yaml**: LoadBalancer tipinde Service tanımı
- **ingress.yaml**: ALB Ingress Controller için Ingress tanımı

## 🚀 Kullanım

### Manuel Deploy

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```
