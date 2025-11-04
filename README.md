# Super Mario Game - Docker Container

Klasik Super Mario Brothers oyununun HTML5 ile geliştirilmiş tam ekran versiyonunu Docker konteynerinde çalıştırmak için hazırlanmış projedir.

## 📋 Proje Hakkında

FullScreenMario, orijinal Super Mario Brothers oyununun modern tarayıcılar için geliştirilmiş HTML5 remake versiyonudur. Bu proje, oyunu Docker konteynerinde çalıştırarak kolay dağıtım ve yönetim sağlar.

**Özellikler:**
- 🎯 Tam ekran HTML5 Super Mario Brothers oyunu
- 🐳 Docker ve Docker Compose desteği
- 🚀 Nginx ile optimize edilmiş web server yapılandırması
- 📦 Minimal Alpine Linux tabanlı imaj (~61MB)
- 🔒 Güvenlik başlıkları ve gzip sıkıştırması
- 💚 Health check desteği

**Orijinal Proje:** [FullScreenMario](http://www.fullscreenmario.com)

## 🎬 Demo Animasyonları

<p align="left">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-1-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-1-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-1-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-1-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-2-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-2-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-2-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-2-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-3-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-3-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-3-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-3-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-4-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-4-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-4-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-4-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-5-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-5-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-5-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-5-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-6-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-6-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-6-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-6-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-7-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-7-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-7-3.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-7-4.gif" width="200"><br/>
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-8-1.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-8-2.gif" width="200">
  <img src="https://raw.githubusercontent.com/vietnh1009/Super-mario-bros-PPO-pytorch/master/demo/video-8-3.gif" width="200"><br/>
 
</p>

## 📋 Gereksinimler

### Sistem Gereksinimleri

- **Docker**: 20.10 veya üzeri
- **Docker Compose**: 2.0 veya üzeri (opsiyonel)
- **İşletim Sistemi**: Linux, macOS, Windows (Docker Desktop ile)
- **RAM**: Minimum 512MB (önerilen 1GB)
- **Disk Alanı**: ~100MB (image + container)

### Yazılım Gereksinimleri

- Docker Engine veya Docker Desktop kurulu olmalı
- Git (repository'yi clone etmek için, opsiyonel)
- Web tarayıcısı (oyunu oynamak için)

## 🚀 Hızlı Başlangıç

### Docker Compose ile

```bash
cd super-mario-game
docker-compose up -d
```

Oyun şu adresten erişilebilir: `http://localhost:8090`

### Docker ile

```bash
cd super-mario-game
docker build -t serdarbayram/supermario:latest .
docker run -d -p 8090:80 --name supermario --restart unless-stopped serdarbayram/supermario:latest
```

## 🎮 Oyun Kontrolleri

- **Ok Tuşları**: Hareket ve zıplama
- **Space**: Zıplama (alternatif)
- **P**: Oyunu duraklat/devam ettir
- **M**: Ses açma/kapama

## 🔧 Yapılandırma

### Port Değiştirme

`docker-compose.yml` dosyasında port ayarını değiştirebilirsiniz:

```yaml
ports:
  - "3000:80"  # Host port 3000, container port 80
```

### Image Build

```bash
cd super-mario-game
docker build -t serdarbayram/supermario:latest .
```

## 📦 Proje Yapısı

```
super-mario-game/
├── Dockerfile              # Docker image tanımı
├── docker-compose.yml      # Docker Compose yapılandırması
└── FullScreenMario/
    ├── nginx.conf          # Nginx yapılandırması
    └── [Oyun dosyaları]     # HTML, CSS, JS dosyaları
```

## 🐳 Docker Image

- **Base Image**: `nginx:alpine` (84MB)
- **Image Name**: `serdarbayram/supermario:latest`
- **Container Name**: `supermario`
- **Port**: 8090 (host) → 80 (container)

## 🔍 Sorun Giderme

### Container Başlamıyor

```bash
# Logları kontrol edin
docker logs supermario

# Container durumunu kontrol edin
docker ps -a | grep supermario
```

### Port Zaten Kullanılıyor

```bash
# Farklı bir port kullanın
docker run -d -p 3000:80 --name supermario serdarbayram/supermario:latest
```

### Health Check Başarısız

```bash
# Container içine girerek test edin
docker exec -it supermario wget -O- http://localhost/
```

## 📝 Notlar

- Tüm uygulama dosyaları `FullScreenMario` dizini içindedir
- Dockerfile ve docker-compose.yml dosyaları `super-mario-game` dizininde bulunur
- Docker build context olarak `super-mario-game` dizini kullanılır
- Image adı: `supermario`
- Image tag: `serdarbayram/supermario:latest`

## 👤 Yazar

**Serdar Bayram**
- Email: serdarbayram01@gmail.com

## 📄 Lisans

Bu proje eğitim ve kişisel kullanım amaçlıdır. Orijinal FullScreenMario projesinin Docker containerization'ıdır.

---

**İyi Oyunlar! 🎮**
