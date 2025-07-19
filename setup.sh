#!/bin/bash

# === Konfigurasi manual ===
N8N_USER=$(whoami)   # Gunakan user aktif saat ini
N8N_EXEC=$(which n8n)  # Cari lokasi binary n8n

if [[ -z "$N8N_EXEC" ]]; then
  echo "❌ n8n tidak ditemukan di PATH. Pastikan sudah diinstall via npm."
  exit 1
fi

# === Tampilkan info untuk verifikasi ===
echo "🧾 Membuat systemd service untuk user: $N8N_USER"
echo "📍 Lokasi n8n: $N8N_EXEC"

# === Buat systemd unit ===
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
Environment=N8N_SECURE_COOKIE=false
Environment=EXECUTIONS_PROCESS=main
WorkingDirectory=/home/$N8N_USER
ExecStart=$N8N_EXEC
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# === Reload & aktifkan service ===
echo "🔄 Reloading systemd dan mengaktifkan service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable n8n
sudo systemctl restart n8n

# === Cek status ===
echo "✅ Service n8n aktif!"
systemctl status n8n --no-pager
