# Super Mario Kubernetes Deployment

Bu dizin, Super Mario uygulamasının Kubernetes cluster'ına deploy edilmesi için gerekli manifest dosyalarını içerir.

## 📋 Dosyalar

- **deployment.yaml**: Super Mario uygulamasının Kubernetes Deployment tanımı
- **service.yaml**: ClusterIP tipinde Service tanımı (internal cluster communication)
- **ingress.yaml**: ALB Ingress Controller için Ingress tanımı

## 🚀 Kullanım

### Manuel Deploy

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

## 🌐 ALB (Application Load Balancer) Yapılandırması

### Erişim URL'i

Uygulama aşağıdaki domain üzerinden erişilebilir:

- **Production URL**: https://supermario.sbaylab.com
- **HTTP**: http://supermario.sbaylab.com (HTTPS'e yönlendirilir)

### ALB Özellikleri

- **Tip**: Application Load Balancer (ALB)
- **Scheme**: Internet-facing (public erişim)
- **SSL/TLS**: AWS Certificate Manager (ACM) ile otomatik yönetim
- **Certificate ARN**: `arn:aws:acm:eu-west-1:600920219683:certificate/616f8af1-e304-424d-a2f5-1eb8dc248310`
- **Ports**: 
  - HTTP: 80
  - HTTPS: 443

### Service Yapılandırması

- **Service Type**: `ClusterIP` (internal cluster communication)
- **Port**: 80
- **Target Port**: 80

> **Not**: Ingress (ALB) kullanıldığı için Service tipi `ClusterIP` olarak ayarlanmıştır. Bu, gereksiz LoadBalancer maliyetini önler ve best practice'e uygundur.

### Ingress Kontrolü

```bash
# Ingress durumunu kontrol et
kubectl get ingress supermario-app-ingress

# Ingress detaylarını görüntüle
kubectl describe ingress supermario-app-ingress
```

### DNS Yapılandırması

Domain `supermario.sbaylab.com` için DNS kaydı, ALB hostname'ine CNAME olarak yapılandırılmalıdır:

```
Type: CNAME
Name: supermario.sbaylab.com
Value: <ALB_HOSTNAME> (kubectl get ingress ile alınabilir)
```

## 🔧 Yapılandırma Detayları

### Ingress Annotations

```yaml
annotations:
  kubernetes.io/ingress.class: "alb"
  alb.ingress.kubernetes.io/scheme: "internet-facing"
  alb.ingress.kubernetes.io/certificate-arn: "arn:aws:acm:eu-west-1:600920219683:certificate/616f8af1-e304-424d-a2f5-1eb8dc248310"
  alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS": 443}]'
```

### Gereksinimler

- AWS EKS cluster
- AWS Load Balancer Controller kurulu
- ACM certificate (SSL/TLS için)
- Domain DNS yapılandırması

## 📝 Notlar

- Image: `serdarbayram/supermario:latest`
- Container Port: `80`
- Replicas: `2`
- Ingress Class: `alb`
