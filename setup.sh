#!/bin/bash

# === Konfigurasi dasar ===
N8N_USER=$(whoami)
N8N_EXEC=$(which n8n)

if [[ -z "$N8N_EXEC" ]]; then
  echo "❌ n8n tidak ditemukan. Pastikan sudah diinstall via npm: npm install -g n8n"
  exit 1
fi

echo "📡 Menyiapkan n8n agar bisa diakses dari IP lokal (LAN)"
echo "👤 User: $N8N_USER"
echo "📍 Lokasi n8n: $N8N_EXEC"

# === Buat systemd service ===
SERVICE_FILE="/etc/systemd/system/n8n.service"

sudo bash -c "cat > $SERVICE_FILE" <<EOF
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

# === Reload systemd dan aktifkan service ===
echo "🔄 Mengaktifkan systemd service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable n8n
sudo systemctl restart n8n

# === Buka firewall jika pakai ufw ===
if command -v ufw &> /dev/null && sudo ufw status | grep -q "Status: active"; then
  echo "🔓 Membuka port 5678 di ufw..."
  sudo ufw allow 5678/tcp
fi

echo "✅ n8n aktif! Akses via: http://
