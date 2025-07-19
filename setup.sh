#!/bin/bash

# === Konfigurasi dasar ===
N8N_USER=$(whoami)
N8N_EXEC=$(which n8n)
SERVICE_FILE="/etc/systemd/system/n8n.service"

if [[ -z "$N8N_EXEC" ]]; then
  echo "❌ n8n tidak ditemukan. Pastikan sudah diinstall via: npm install -g n8n"
  exit 1
fi

echo "📡 Menyiapkan n8n agar bisa diakses dari IP LAN"
echo "👤 User: $N8N_USER"
echo "📍 Lokasi n8n: $N8N_EXEC"

# === Buat file service sementara ===
TMP_FILE="/tmp/n8n.service"

cat > "$TMP_FILE" <<EOF
[Unit]
Description=n8n automation
After=network.target

[Service]
Type=simple
User=$N8N_USER
Environment=PATH=/usr/bin:/usr/local/bin
Environment=N8N_PORT=5678
Environment=N8N_HOST=0.0.0.0
Environment=N8N_SECURE_COOKIE=false
Environment=EXECUTIONS_PROCESS=main
WorkingDirectory=/home/$N8N_USER
ExecStart=$N8N_EXEC
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# === Salin file service ke systemd ===
sudo cp "$TMP_FILE" "$SERVICE_FILE"
sudo chmod 644 "$SERVICE_FILE"

# === Aktifkan service ===
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable n8n
sudo systemctl restart n8n

# === Buka port di ufw (jika aktif) ===
if command -v ufw &> /dev/null && sudo ufw status | grep -q "Status: active"; then
  echo "🔓 Membuka port 5678 di ufw..."
  sudo ufw allow 5678/tcp
fi

# === Tampilkan hasil ===
echo "✅ n8n aktif! Akses via: http://$(hostname -I | awk '{print $1}'):5678"
