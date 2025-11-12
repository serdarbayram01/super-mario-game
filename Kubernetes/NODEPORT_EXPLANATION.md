# ALB ve NodePort - Neden Çalışmıyordu?

## 🔍 Sorunun Kök Nedeni

**Service Type Uyumsuzluğu:**
- Service: `ClusterIP` (NodePort yok)
- ALB Target Group: `instance` mode + Port `31961` (NodePort bekliyor)

## ❌ Neden Çalışmadı?

1. **Service ClusterIP**: NodePort oluşturmaz, sadece cluster içi erişim sağlar
2. **ALB Target Group**: Instance mode kullanıyor ve NodePort (31961) bekliyor
3. **Sonuç**: ALB node'lara NodePort üzerinden erişmeye çalışıyor ama port yok!

## ✅ Çözüm

### Service Type: NodePort

Service'i `NodePort` yaparak ALB'nin node IP'leri ve NodePort üzerinden erişmesini sağladık:

```yaml
type: NodePort
```

### Ingress Annotation: target-type: instance

```yaml
alb.ingress.kubernetes.io/target-type: "instance"
```

## 📊 AWS Load Balancer Controller Davranışı

| Service Type | Target Type | Açıklama |
|-------------|-------------|----------|
| **ClusterIP** | `ip` (pod IP) | Pod IP'lerine direkt erişim |
| **NodePort** | `instance` (node IP + NodePort) | Node IP'leri ve NodePort üzerinden erişim |

## 🔧 Yapılan Değişiklikler

1. **service.yaml**: `type: ClusterIP` → `type: NodePort`
2. **ingress.yaml**: `target-type: "ip"` → `target-type: "instance"`

## 🚀 Nasıl Çalışır?

1. **NodePort Service**: Kubernetes otomatik olarak bir NodePort atar (örn: 31961)
2. **ALB Target Group**: Node IP'lerini ve NodePort'u target olarak ekler
3. **Traffic Flow**: 
   ```
   Internet → ALB → Node IP:NodePort → Service → Pod
   ```

## 📝 Notlar

- NodePort aralığı: 30000-32767 (Kubernetes varsayılan)
- Her node'da aynı NodePort açık olur
- Security group'larda NodePort'a izin verilmiş olmalı
- ALB otomatik olarak tüm node'ları target olarak ekler

## ✅ Doğrulama

```bash
# Service NodePort'unu kontrol et
kubectl get svc supermario-service

# NodePort değerini al
NODEPORT=$(kubectl get svc supermario-service -o jsonpath='{.spec.ports[0].nodePort}')

# Node IP'lerini al
kubectl get nodes -o wide

# NodePort üzerinden test
curl http://<NODE_IP>:$NODEPORT
```

