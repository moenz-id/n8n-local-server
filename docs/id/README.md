# 🌐 Instalasi n8n Self-Hosted (Tanpa Docker)

**n8n** adalah platform otomasi alur kerja (workflow automation) open-source yang memungkinkan integrasi berbagai layanan dan aplikasi tanpa banyak kode.  
Panduan ini menjelaskan cara menginstal **n8n secara lokal di Linux** tanpa Docker.

## ✅ Fitur

- Gratis sepenuhnya (self-hosted)
- Ringan dan fleksibel
- Terintegrasi dengan berbagai tools
- Cocok untuk eksperimen dan otomatisasi AI

## 🚀 Langkah Instalasi

1. **Update sistem**
```bash
sudo apt update && sudo apt upgrade -y
```

2. **Install Node.js v18**
```bash
sudo apt install curl -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y
```

3. **Install n8n**
```bash
sudo npm install -g n8n
```

4. **Jalankan n8n**
```bash
n8n
```

Buka di browser: `http://localhost:5678`

> ⚠️ Abaikan error lisensi jika muncul, tidak mempengaruhi penggunaan.

## 🔄 Menjalankan di Latar Belakang (Opsional)
```bash
sudo npm install -g pm2
pm2 start n8n
pm2 save
pm2 startup
```

## 🧹 Uninstall
```bash
sudo npm uninstall -g n8n
rm -rf ~/.n8n
pm2 delete n8n
pm2 unstartup
sudo npm uninstall -g pm2
```