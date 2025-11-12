# LoadBalancer vs Ingress (ALB) - Best Practice

## 🔍 Mevcut Durum

Şu anda iki farklı load balancer kullanılıyor:

1. **Service (LoadBalancer)**: Classic ELB oluşturuyor
   - Endpoint: `aee18668320f548e99af96e8c17d51ef-298826806.eu-west-1.elb.amazonaws.com`
   - Tip: Classic Load Balancer (ELB)

2. **Ingress (ALB)**: Application Load Balancer oluşturuyor
   - Endpoint: `k8s-default-supermar-4f96e61499-749617886.eu-west-1.elb.amazonaws.com`
   - Tip: Application Load Balancer (ALB)
   - Domain: `supermario.sbaylab.com`

## ❌ Sorun

**İkisi birlikte kullanılmamalı!**

- **Gereksiz maliyet**: 2 load balancer ücreti
- **Gereksiz karmaşıklık**: İki farklı endpoint
- **Best practice ihlali**: Ingress kullanılıyorsa Service ClusterIP olmalı

## ✅ Çözüm

**Ingress (ALB) kullanıldığında:**
- Service type: **ClusterIP** (internal cluster communication için)
- Ingress: Dış trafiği yönetir (ALB üzerinden)

**LoadBalancer Service sadece şu durumlarda kullanılır:**
- Ingress kullanılmıyorsa
- Basit, tek endpoint gerekiyorsa
- SSL/TLS yönetimi gerekmiyorsa

## 🔧 Yapılan Değişiklik

`service.yaml` dosyasında:
```yaml
# ÖNCE (Yanlış)
type: LoadBalancer

# SONRA (Doğru)
type: ClusterIP
```

## 📊 Karşılaştırma

| Özellik | LoadBalancer Service | Ingress (ALB) |
|---------|---------------------|---------------|
| **Tip** | Classic ELB | Application Load Balancer |
| **SSL/TLS** | Manuel yönetim | ACM ile otomatik |
| **Domain** | IP veya ELB DNS | Custom domain |
| **Path Routing** | Yok | Var |
| **Maliyet** | Daha düşük | Daha yüksek (ama daha fazla özellik) |
| **Kullanım** | Basit uygulamalar | Production, domain-based routing |

## 🚀 Uygulama

Değişiklik yapıldıktan sonra:

```bash
# Service'i güncelle
kubectl apply -f service.yaml

# Eski LoadBalancer'ı kontrol et (silinmeli)
kubectl get svc supermario-service

# Ingress'i kontrol et (aktif kalmalı)
kubectl get ingress supermario-app-ingress

# Pod'ları kontrol et
kubectl get pods -l app=supermario
```

## ✅ Sonuç

- **Tek Load Balancer**: Sadece ALB (Ingress üzerinden)
- **Daha düşük maliyet**: Gereksiz ELB kaldırıldı
- **Best practice**: Ingress + ClusterIP Service
- **Domain erişimi**: `supermario.sbaylab.com` üzerinden

## 📝 Notlar

- Eski LoadBalancer birkaç dakika içinde otomatik silinir
- Ingress (ALB) aktif kalır ve uygulama erişilebilir olmaya devam eder
- Service ClusterIP olarak internal cluster'da çalışmaya devam eder

