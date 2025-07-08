# 🌐 n8n Self-Hosted Installation (Without Docker)

**n8n** is an open-source workflow automation platform that enables integration between various services and apps with minimal coding.  
This guide walks you through installing **n8n locally on Linux** without Docker.

## ✅ Features

- Fully free (self-hosted)
- Lightweight and flexible
- Integrates with many tools
- Great for AI workflow experiments

## 🚀 Installation Steps

1. **Update your system**
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

4. **Run n8n**
```bash
n8n
```

Access via browser: `http://localhost:5678`

> ⚠️ Ignore license activation errors; they do not affect functionality.

## 🔄 Run in Background (Optional)
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