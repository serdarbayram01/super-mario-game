# FullScreenMario - Docker Containerized HTML5 Game

Bu proje, klasik Super Mario Brothers oyununun HTML5 ile geliştirilmiş tam ekran versiyonunu Docker konteynerinde çalıştırmak için hazırlanmıştır.

## 📋 İçindekiler

- [Proje Hakkında](#proje-hakkında)
- [Özellikler](#özellikler)
- [Gereksinimler](#gereksinimler)
- [Hızlı Başlangıç](#hızlı-başlangıç)
- [Kurulum](#kurulum)
- [Kullanım](#kullanım)
- [Proje Yapısı](#proje-yapısı)
- [Docker Images](#docker-images)
- [Yapılandırma](#yapılandırma)
- [Sorun Giderme](#sorun-giderme)
- [Katkıda Bulunma](#katkıda-bulunma)
- [Lisans](#lisans)

## 🎮 Proje Hakkında

FullScreenMario, orijinal Super Mario Brothers oyununun modern tarayıcılar için geliştirilmiş HTML5 remake versiyonudur. Bu proje, oyunu Docker konteynerinde çalıştırarak kolay dağıtım ve yönetim sağlar.

**Orijinal Proje**: [FullScreenMario](http://www.fullscreenmario.com)

## ✨ Özellikler

- 🎯 Tam ekran HTML5 Super Mario Brothers oyunu
- 🐳 Docker ve Docker Compose desteği
- 🚀 Nginx ile optimize edilmiş web server yapılandırması
- 📦 Minimal Alpine Linux tabanlı imaj (84MB)
- 🔒 Güvenlik başlıkları ve gzip sıkıştırma
- ✅ Health check mekanizması
- 🔄 Otomatik restart desteği
- 📱 Responsive tasarım

## 📦 Gereksinimler

### Minimum Gereksinimler

- **Docker**: 20.10 veya üzeri
- **Docker Compose**: 1.29 veya üzeri (opsiyonel)
- **Disk Alanı**: En az 200MB boş alan
- **RAM**: En az 256MB (container için)
- **Port**: 8080 (veya istediğiniz port) açık olmalı

### Sistem Kontrolü

```bash
# Docker versiyonunu kontrol edin
docker --version

# Docker Compose versiyonunu kontrol edin (opsiyonel)
docker-compose --version
```

## 🚀 Hızlı Başlangıç

### Docker Compose ile (Önerilen)

```bash
# Repository'yi klonlayın veya dizine gidin
cd super-mario-game

# Container'ı başlatın
docker-compose up -d

# Tarayıcıda açın: http://localhost:8080
```

### Docker ile

```bash
# Image'ı build edin
docker build -t fullscreenmario:latest -f Dockerfile .

# Container'ı çalıştırın
docker run -d -p 8080:80 --name fullscreenmario fullscreenmario:latest

# Tarayıcıda açın: http://localhost:8080
```

## 📥 Kurulum

### 1. Projeyi İndirin

```bash
# Git ile klonlayın (eğer repository'deyse)
git clone <repository-url>
cd super-mario-game

# Veya dizine doğrudan gidin
cd /path/to/super-mario-game
```

### 2. Docker Image Oluşturun

```bash
# Alpine versiyonu (önerilen - küçük boyut)
docker build -t fullscreenmario:latest -f Dockerfile .

# Veya CentOS versiyonu (alternatif)
docker build -t fullscreenmario:centos -f Dockerfile.centos .
```

### 3. Container'ı Başlatın

#### Docker Compose ile:

```bash
docker-compose up -d
```

#### Docker ile:

```bash
# Basit çalıştırma
docker run -d -p 8080:80 --name fullscreenmario fullscreenmario:latest

# Otomatik restart ile
docker run -d -p 8080:80 --name fullscreenmario \
  --restart unless-stopped \
  fullscreenmario:latest

# Farklı port ile
docker run -d -p 3000:80 --name fullscreenmario fullscreenmario:latest
```

## 🎯 Kullanım

### Kullanım Yöntemleri

Bu projeyi çalıştırmak için 3 farklı yöntem bulunmaktadır:

#### Yöntem 1: Docker ile (Önerilen - Production)

```bash
# Container'ı başlat
docker-compose up -d

# Tarayıcıda aç
http://localhost:8080
```

**Avantajlar:**
- ✅ Nginx ile optimize edilmiş
- ✅ Gzip sıkıştırma
- ✅ Cache yönetimi
- ✅ Health check
- ✅ Production'a hazır

#### Yöntem 2: Docker Olmadan (Geliştirme)

```bash
# Basit bir HTTP server başlatın
cd FullScreenMario

# Python 3 ile
python3 -m http.server 8080

# veya Node.js ile
npx http-server -p 8080

# veya PHP ile
php -S localhost:8080
```

Sonra tarayıcıda: `http://localhost:8080`

**Avantajlar:**
- ✅ Hızlı geliştirme
- ✅ Dosya değişikliklerini anında görme
- ✅ Debug kolaylığı

#### Yöntem 3: Doğrudan Dosya Açma (En Basit)

```bash
# Sadece HTML dosyasını doğrudan açın
open FullScreenMario/index.html
# veya
open FullScreenMario/mario.html
```

**Not:** Bu yöntemde bazı özellikler çalışmayabilir (CORS kısıtlamaları nedeniyle).

### Oyunu Çalıştırma

#### Docker ile:

1. Container başlatıldıktan sonra, tarayıcınızda şu adresi açın:
   ```
   http://localhost:8080
   ```

2. Oyun seçimi ekranı için:
   ```
   http://localhost:8080/index.html
   ```

3. Ana oyun ekranı için:
   ```
   http://localhost:8080/mario.html
   ```

4. Seviye editörü için:
   ```
   http://localhost:8080/editor.js
   ```
   (Browser console'dan kullanılır)

5. Harita parser aracı için:
   ```
   http://localhost:8080/parser/parser.html
   ```

#### Geliştirme Modunda:

Yerel HTTP server kullanıyorsanız, aynı URL'ler geçerlidir:
```
http://localhost:8080/index.html
http://localhost:8080/mario.html
http://localhost:8080/parser/parser.html
```

### Container Yönetimi

```bash
# Container durumunu kontrol etme
docker ps | grep fullscreenmario

# Container loglarını görüntüleme
docker logs fullscreenmario

# Container loglarını takip etme (real-time)
docker logs -f fullscreenmario

# Container'ı durdurma
docker stop fullscreenmario

# Container'ı başlatma
docker start fullscreenmario

# Container'ı yeniden başlatma
docker restart fullscreenmario

# Container'ı kaldırma
docker rm -f fullscreenmario

# Image'ı kaldırma
docker rmi fullscreenmario:latest
```

### Docker Compose ile Yönetim

```bash
# Başlatma
docker-compose up -d

# Durdurma
docker-compose stop

# Yeniden başlatma
docker-compose restart

# Durdurma ve kaldırma
docker-compose down

# Logları görüntüleme
docker-compose logs -f

# Yeniden build ve başlatma
docker-compose up -d --build
```

### Health Check Kontrolü

```bash
# Health check durumunu kontrol etme
docker inspect fullscreenmario --format='{{.State.Health.Status}}'

# Detaylı health check bilgisi
docker inspect fullscreenmario --format='{{json .State.Health}}' | python3 -m json.tool
```

## 📁 Proje Yapısı

```
super-mario-game/
├── FullScreenMario/                    # Oyun kaynak dosyaları (tüm kodlar burada)
│   ├── index.html                     # Ana giriş sayfası / oyun seçimi
│   ├── mario.html                     # Ana oyun sayfası
│   ├── mario.js                       # Oyun ana mantığı ve motoru
│   ├── mario.css                      # Oyun stil dosyası
│   ├── data.js                        # Oyun veri tanımlamaları
│   ├── editor.js                      # Seviye editörü
│   ├── generator.js                   # Harita üretici
│   ├── library.js                     # Yardımcı kütüphane fonksiyonları
│   ├── load.js                        # Dosya yükleme işlemleri
│   ├── maps.js                        # Harita yönetim sistemi
│   ├── sounds.js                      # Ses yönetim sistemi
│   ├── sprites.js                     # Sprite ve görsel yönetimi
│   ├── things.js                      # Oyun nesneleri tanımlamaları
│   ├── triggers.js                    # Tetikleyici sistemleri
│   ├── ui.js                          # Kullanıcı arayüzü
│   ├── upkeep.js                      # Oyun döngü yönetimi
│   ├── utility.js                     # Yardımcı fonksiyonlar
│   ├── EventHandlr.js                 # Olay yönetim sistemi
│   ├── gamepad.js                     # Gamepad desteği
│   ├── quadrants.js                   # Ekran bölümleme sistemi
│   ├── toned.js                       # Ses tonları ve müzik
│   ├── default.css                    # Varsayılan stil dosyası
│   ├── README.md.txt                  # Oyun dokümantasyonu
│   │
│   ├── Maps/                          # Oyun haritaları (32 seviye)
│   │   ├── World12.js                 # World 1-2
│   │   ├── World13.js                 # World 1-3
│   │   ├── World14.js                 # World 1-4
│   │   ├── World21.js                 # World 2-1
│   │   ├── ...                        # World 2-2, 2-3, 2-4, 3-1, ..., 8-4
│   │   └── World84.js                 # World 8-4 (Son seviye)
│   │
│   ├── Sounds/                        # Ses dosyaları
│   │   ├── mp3/                       # MP3 format ses efektleri
│   │   │   ├── Coin.mp3               # Para alma sesi
│   │   │   ├── Jump Small.mp3         # Küçük zıplama
│   │   │   ├── Jump Super.mp3         # Süper zıplama
│   │   │   ├── Powerup.mp3            # Güçlendirme
│   │   │   ├── Mario Dies.mp3         # Ölüm sesi
│   │   │   └── ...                    # Diğer efektler
│   │   ├── ogg/                       # OGG format ses efektleri
│   │   │   └── ...                    # Aynı efektler OGG formatında
│   │   └── Themes/                    # Arka plan müzikleri
│   │       ├── mp3/                   # MP3 format müzikler
│   │       │   ├── Overworld.mp3       # Dünya müziği
│   │       │   ├── Underworld.mp3     # Yeraltı müziği
│   │       │   ├── Castle.mp3         # Kale müziği
│   │       │   └── ...                # Diğer temalar
│   │       └── ogg/                   # OGG format müzikler
│   │
│   ├── Fonts/                         # Web fontları
│   │   ├── pressstart2p-webfont.*     # Press Start 2P fontu
│   │   ├── super_plumber_brothers-*    # Super Plumber Brothers fontu
│   │   └── specimen_files/            # Font örnek dosyaları
│   │
│   ├── Theme/                         # UI görselleri
│   │   ├── Header.gif                 # Başlık görseli
│   │   ├── Mario.gif                  # Mario karakter görseli
│   │   ├── Beta.png                   # Beta etiketi
│   │   └── *.gif                      # Diğer UI butonları
│   │
│   ├── parser/                        # Harita parser aracı
│   │   ├── parser.html                # Parser arayüzü
│   │   ├── parser.js                  # Parser mantığı
│   │   └── parser.css                 # Parser stilleri
│   │
│   └── src/                           # Kaynak modüller
│       └── TimeHandlr/                # Zaman yönetim modülü
│           ├── TimeHandlr.js          # Zaman yönetim mantığı
│           └── README.md               # Modül dokümantasyonu
│
├── Dockerfile                         # Alpine tabanlı Dockerfile (önerilen)
├── docker-compose.yml                 # Docker Compose yapılandırması
└── README.md                          # Bu dosya
```

### 📝 Dosya Açıklamaları

#### Ana Dosyalar

| Dosya | Açıklama | Kullanım |
|-------|----------|----------|
| `index.html` | Oyun seçim ve başlatma ekranı | Ana giriş sayfası, seviye seçimi |
| `mario.html` | Ana oyun sayfası | Oyun burada çalışır |
| `mario.js` | Oyun motoru ve ana mantık | Fizik, çarpışma, oyun döngüsü |
| `mario.css` | Oyun görsel stilleri | UI ve görsel tasarım |
| `data.js` | Oyun veri tanımlamaları | Karakter, nesne özellikleri |

#### Oyun Motoru Dosyaları

| Dosya | Açıklama | İşlev |
|-------|----------|-------|
| `library.js` | Yardımcı kütüphane | Genel kullanım fonksiyonları |
| `load.js` | Dosya yükleme sistemi | Harita, ses, görsel yükleme |
| `maps.js` | Harita yönetim sistemi | Harita yükleme ve işleme |
| `sounds.js` | Ses yönetim sistemi | Ses efektleri ve müzik kontrolü |
| `sprites.js` | Sprite yönetimi | Karakter ve nesne görselleri |
| `things.js` | Oyun nesneleri | Tüm oyun nesnelerinin tanımları |
| `triggers.js` | Tetikleyici sistemi | Olay ve tetikleyici yönetimi |
| `ui.js` | Kullanıcı arayüzü | Menü, skor, can gösterimi |
| `upkeep.js` | Oyun döngü yönetimi | Game loop ve frame yönetimi |
| `utility.js` | Yardımcı fonksiyonlar | Matematik, string işlemleri |
| `EventHandlr.js` | Olay yönetim sistemi | Event listener ve handler |
| `gamepad.js` | Gamepad desteği | Joystick/gamepad kontrolü |
| `quadrants.js` | Ekran bölümleme | Viewport ve kamera yönetimi |
| `toned.js` | Ses tonları | Müzik ve ses efekt tonları |

#### Araçlar ve Editörler

| Dosya/Klasör | Açıklama | Kullanım |
|--------------|----------|----------|
| `editor.js` | Seviye editörü | Yeni haritalar oluşturmak için |
| `generator.js` | Harita üretici | Otomatik harita oluşturma |
| `parser/` | Harita parser | Harita formatı dönüştürme aracı |

#### Klasör Yapıları

**Maps/** - 32 Oyun Haritası
- Her dosya bir seviyeyi temsil eder
- Format: `WorldXY.js` (X=Dünya, Y=Seviye)
- Örnek: `World12.js` = World 1, Level 2
- Toplam: 8 dünya × 4 seviye = 32 harita

**Sounds/** - Ses Dosyaları
- `mp3/` ve `ogg/`: Çoklu format desteği
- `Themes/`: Arka plan müzikleri (Overworld, Underworld, Castle, vb.)
- Efektler: Jump, Coin, Powerup, Game Over, vb.

**Fonts/** - Web Fontları
- `pressstart2p`: Retro oyun fontu
- `super_plumber_brothers`: Özel Mario fontu
- Web font formatları: `.woff`, `.ttf`, `.eot`, `.svg`

**Theme/** - UI Görselleri
- GIF formatında butonlar ve ikonlar
- Header, Mario karakteri, UI elemanları

### 🔧 Geliştirme ve Kod Düzenleme

#### Dosyaları Düzenlemek İçin

1. **Oyun Mantığını Değiştirme:**
   - `mario.js`: Fizik, hareket, çarpışma sistemi
   - `things.js`: Yeni nesneler eklemek için
   - `triggers.js`: Yeni tetikleyiciler için

2. **Görsel Değişiklikler:**
   - `mario.css`: Stil değişiklikleri
   - `Theme/`: UI görsellerini değiştir
   - `sprites.js`: Sprite tanımlarını değiştir

3. **Ses Değişiklikleri:**
   - `Sounds/` klasörüne yeni ses dosyaları ekle
   - `sounds.js`: Ses yükleme ve çalma mantığı
   - `toned.js`: Müzik tonları ve efektler

4. **Yeni Harita Oluşturma:**
   ```bash
   # Harita editörünü kullan
   http://localhost:8080/parser/parser.html
   
   # Veya yeni bir WorldXY.js dosyası oluştur
   cp FullScreenMario/Maps/World12.js FullScreenMario/Maps/World91.js
   # Sonra düzenle
   ```

5. **Değişiklikleri Test Etme:**
   ```bash
   # Docker ile çalışıyorsanız
   docker-compose restart
   
   # Veya geliştirme modunda (HTTP server)
   # Dosyayı kaydedin, tarayıcıyı yenileyin
   ```

#### Önemli Dosyalar ve Değiştirme İpuçları

| Dosya | Ne Zaman Değiştirilir | Dikkat Edilmesi Gerekenler |
|-------|----------------------|---------------------------|
| `mario.js` | Fizik/hareket değişikliği | Oyun döngüsünü bozmamaya dikkat |
| `things.js` | Yeni nesne ekleme | Mevcut nesne formatını koruyun |
| `maps.js` | Harita sistemi değişikliği | Mevcut harita formatını koruyun |
| `sounds.js` | Ses sistemi | Dosya yollarını kontrol edin |
| `ui.js` | Arayüz değişikliği | CSS ile uyumlu olmalı |
| `data.js` | Oyun verileri | Veri yapısını koruyun |

#### Docker Olmadan Geliştirme (Önerilen)

```bash
# 1. FullScreenMario klasörüne gidin
cd FullScreenMario

# 2. HTTP server başlatın
python3 -m http.server 8080

# 3. Tarayıcıda açın
open http://localhost:8080

# 4. Dosyaları düzenleyin (VS Code, Atom, vb.)
# 5. Tarayıcıyı yenileyin (Ctrl+R veya Cmd+R)
# 6. Değişiklikleri görün
```

**Avantajlar:**
- ✅ Hızlı değişiklik-test döngüsü
- ✅ Hot reload benzeri deneyim
- ✅ Debug kolaylığı (Browser DevTools)

## 🐳 Docker Images

### Alpine Versiyonu (Önerilen)

- **Base Image**: `nginx:alpine`
- **Boyut**: ~84MB
- **Avantajlar**:
  - Çok küçük boyut
  - Hızlı build süresi
  - Düşük güvenlik açığı riski
  - Az kaynak kullanımı

**Kullanım:**
```bash
docker build -t fullscreenmario:latest -f Dockerfile .
```

### CentOS Versiyonu (Alternatif)

- **Base Image**: `centos:7`
- **Boyut**: ~250MB+
- **Avantajlar**:
  - Geleneksel Linux ortamı
  - Daha fazla paket desteği

**Kullanım:**
```bash
docker build -t fullscreenmario:centos -f Dockerfile.centos .
```

## ⚙️ Yapılandırma

### Port Değiştirme

`docker-compose.yml` dosyasında port ayarını değiştirebilirsiniz:

```yaml
ports:
  - "3000:80"  # Host port 3000, container port 80
```

Veya Docker run ile:

```bash
docker run -d -p 3000:80 --name fullscreenmario fullscreenmario:latest
```

### Nginx Yapılandırması

Nginx yapılandırması `Dockerfile` içinde hazır olarak gelir. Özelleştirme için:

1. Yeni bir `nginx.conf` dosyası oluşturun
2. `Dockerfile`'ı güncelleyin:

```dockerfile
COPY nginx.conf /etc/nginx/conf.d/default.conf
```

### Environment Variables

Şu anda environment variable desteği yoktur, ancak eklenebilir:

```dockerfile
ENV NGINX_HOST=localhost
ENV NGINX_PORT=80
```

## 🔧 Sorun Giderme

### Container Başlamıyor

```bash
# Logları kontrol edin
docker logs fullscreenmario

# Container durumunu kontrol edin
docker ps -a | grep fullscreenmario

# Port çakışması kontrolü
netstat -tuln | grep 8080
# veya
lsof -i :8080
```

### Port Zaten Kullanılıyor

```bash
# Farklı bir port kullanın
docker run -d -p 3000:80 --name fullscreenmario fullscreenmario:latest

# Veya çakışan container'ı durdurun
docker stop <container-name>
docker rm <container-name>
```

### Health Check Başarısız

```bash
# Container içine girerek test edin
docker exec -it fullscreenmario wget -O- http://localhost/

# Nginx loglarını kontrol edin
docker exec fullscreenmario cat /var/log/nginx/error.log
```

### Oyun Yüklenmiyor

1. Tarayıcı konsolunu kontrol edin (F12)
2. Network sekmesinde 404 hatası olup olmadığına bakın
3. Container loglarını kontrol edin:
   ```bash
   docker logs fullscreenmario
   ```

### Build Hataları

```bash
# Build cache'ini temizleyerek yeniden deneyin
docker build --no-cache -t fullscreenmario:latest -f Dockerfile .

# Disk alanını kontrol edin
docker system df

# Gereksiz dosyaları temizleyin
docker system prune -a
```

### Permission Hataları

Linux'ta Docker permission hatası alıyorsanız:

```bash
# Kullanıcıyı docker grubuna ekleyin
sudo usermod -aG docker $USER

# Yeni bir terminal açın veya logout/login yapın
```

## 🧪 Test

### Manuel Test

```bash
# Container'ı başlatın
docker-compose up -d

# HTTP yanıtını test edin
curl -I http://localhost:8080

# Sayfa içeriğini kontrol edin
curl http://localhost:8080/index.html | head -20

# Health check'i test edin
docker inspect fullscreenmario --format='{{.State.Health.Status}}'
```

### Otomatik Test Script'i

```bash
#!/bin/bash
# test.sh

echo "Testing FullScreenMario container..."

# Container kontrolü
if docker ps | grep -q fullscreenmario; then
    echo "✓ Container is running"
else
    echo "✗ Container is not running"
    exit 1
fi

# HTTP yanıt kontrolü
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)
if [ "$HTTP_CODE" == "200" ]; then
    echo "✓ HTTP 200 OK"
else
    echo "✗ HTTP $HTTP_CODE"
    exit 1
fi

# Health check kontrolü
HEALTH=$(docker inspect fullscreenmario --format='{{.State.Health.Status}}')
if [ "$HEALTH" == "healthy" ]; then
    echo "✓ Health check: healthy"
else
    echo "⚠ Health check: $HEALTH"
fi

echo "All tests passed!"
```

## 📊 Performans

### Kaynak Kullanımı

- **Memory**: ~50-100MB (container runtime)
- **CPU**: Minimal (statik dosya servisi)
- **Disk**: ~84MB (Alpine image)
- **Network**: Minimal (statik içerik)

### Optimizasyonlar

- ✅ Gzip compression aktif
- ✅ Static asset caching (1 yıl)
- ✅ Minimal base image (Alpine)
- ✅ Multi-stage build potansiyeli (gelecekte eklenebilir)

## 🔐 Güvenlik

### Güvenlik Özellikleri

- ✅ Security headers (X-Frame-Options, X-Content-Type-Options, X-XSS-Protection)
- ✅ Minimal attack surface (Alpine Linux)
- ✅ Non-root user potansiyeli (gelecekte eklenebilir)

### Güvenlik Önerileri

1. Production'da HTTPS kullanın (reverse proxy ile)
2. Firewall kuralları ekleyin
3. Container'ı güncel tutun
4. Sadece gerekli portları açın

## 🚢 Production Deployment

### Docker Compose ile Production

```yaml
version: '3.8'
services:
  fullscreenmario:
    build:
      context: .
      dockerfile: Dockerfile
    image: fullscreenmario:latest
    container_name: fullscreenmario
    ports:
      - "80:80"
    restart: always
    healthcheck:
      test: ["CMD", "wget", "--no-verbose", "--tries=1", "--spider", "http://127.0.0.1/"]
      interval: 30s
      timeout: 3s
      retries: 3
      start_period: 10s
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```

### Kubernetes Deployment (Örnek)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fullscreenmario
spec:
  replicas: 2
  selector:
    matchLabels:
      app: fullscreenmario
  template:
    metadata:
      labels:
        app: fullscreenmario
    spec:
      containers:
      - name: fullscreenmario
        image: fullscreenmario:latest
        ports:
        - containerPort: 80
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 10
          periodSeconds: 30
---
apiVersion: v1
kind: Service
metadata:
  name: fullscreenmario-service
spec:
  selector:
    app: fullscreenmario
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer
```

## 📝 Oyun Hakkında

### Oyun Kontrolleri

- **Ok Tuşları**: Hareket ve zıplama
- **Space**: Zıplama (alternatif)
- **P**: Oyunu duraklat/devam ettir
- **M**: Ses açma/kapama

### Cheat Kodları

Oyun konsolunu açarak (F12) şu komutları kullanabilirsiniz:

```javascript
// Mushroom/Power-up al
marioShroom(mario)

// Yıldız (Invincible) al
marioStar(mario)

// Ekranı kaydır
scrollMario(X)

// Hızlandır
fastforward(T)
```

Detaylı cheat kodları için: `FullScreenMario/README.md.txt`

## 🤝 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📄 Lisans

Bu proje, orijinal FullScreenMario projesinin Docker containerization'ıdır. Orijinal proje lisansı için `FullScreenMario/README.md.txt` dosyasına bakın.

**Not**: Bu proje eğitim ve kişisel kullanım amaçlıdır. Nintendo'nun ticari markaları ve telif hakları korunmaktadır.

## 👤 Yazar

**Serdar Bayram**
- Email: serdarbayram01@gmail.com

## 🙏 Teşekkürler

- Orijinal FullScreenMario geliştiricilerine
- Nginx topluluğuna
- Docker topluluğuna

## 📞 Destek

Sorularınız veya sorunlarınız için:

1. GitHub Issues açın
2. Docker loglarını kontrol edin
3. Bu README'nin Sorun Giderme bölümüne bakın

---

**İyi Oyunlar! 🎮**

