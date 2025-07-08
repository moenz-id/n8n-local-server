# 🌐 n8n Self-Hosted Installation (Tanpa Docker)

**n8n** adalah platform otomasi alur kerja (workflow automation) berbasis open-source yang memungkinkan integrasi berbagai layanan dan aplikasi tanpa banyak menulis kode.  
Dokumen ini berisi panduan instalasi **n8n secara lokal di Linux** tanpa Docker.

---

## ✅ Fitur

- 100% gratis (self-hosted)
- Bisa dijalankan di PC pribadi atau server lokal
- Ringan, fleksibel, dan bisa disesuaikan
- Terintegrasi dengan berbagai tool (API, Telegram, Google Sheets, ffmpeg, dll)

---

## 🧱 Prasyarat

- Linux (direkomendasikan Ubuntu, Xubuntu, Debian)
- Akses terminal dan koneksi internet
- Node.js v18 (rekomendasi untuk stabilitas)

---

## 🚀 Langkah Instalasi

### 1. Update sistem
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Node.js v18
```bash
sudo apt install curl -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y
```

### 3. Cek versi Node.js dan npm
```bash
node -v
npm -v
```

### 4. Install n8n secara global
```bash
sudo npm install -g n8n
```

### 5. Jalankan n8n
```bash
n8n
```

Buka browser ke:
```
http://localhost:5678
```

> ⚠️ Jika muncul error seperti:
> ```
> [license SDK] license activation failed...
> ```
> Abaikan saja. Ini tidak mempengaruhi fungsionalitas n8n untuk self-hosted gratis.

---

## 🔄 (Opsional) Jalankan n8n di Latar Belakang

Gunakan PM2 untuk menjaga n8n tetap hidup dan aktif saat reboot.

### Install PM2
```bash
sudo npm install -g pm2
```

### Jalankan n8n
```bash
pm2 start n8n
pm2 save
pm2 startup
```

---

## 🧹 Uninstall / Bersih-bersih

```bash
sudo npm uninstall -g n8n
rm -rf ~/.n8n
pm2 delete n8n
pm2 unstartup
sudo npm uninstall -g pm2
```

---

## 📂 Struktur Direktori

| Item         | Lokasi        |
|--------------|---------------|
| File data    | `~/.n8n`      |
| Port default | `5678`        |
| Binary       | `n8n` (global)|

---

## 📌 Catatan Tambahan

- Untuk keamanan, kamu bisa mengatur autentikasi dengan env vars (lihat dokumentasi n8n).
- Bisa dijalankan di VPS, STB Armbian, PC server, atau bahkan Raspberry Pi.
- Jika ingin menjalankan versi Docker, lihat [dokumentasi resmi](https://docs.n8n.io).

---

## 💡 Ide Proyek Otomatisasi

- Upload otomatis ke YouTube/TikTok dari folder lokal
- Kirim notifikasi ke Telegram jika ada file baru
- Workflow AI: lirik → gambar → suara → video → publish
- Monitoring sistem dan backup otomatis

---

## 📜 Lisensi

Proyek ini hanya mencakup panduan instalasi. n8n menggunakan lisensi [Fair-code](https://faircode.io).