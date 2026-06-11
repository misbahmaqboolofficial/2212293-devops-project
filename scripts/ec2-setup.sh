#!/bin/bash
# One-time EC2 setup script — run on a fresh Ubuntu 22.04 instance
set -euo pipefail

REPO_URL="${1:-https://github.com/misbahmaqboolofficial/2212293-devops-project.git}"
PROJECT_DIR="$HOME/2212293-devops-project"

echo "==> Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose-plugin git
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER"

echo "==> Cloning repository..."
if [ -d "$PROJECT_DIR" ]; then
  cd "$PROJECT_DIR"
  git pull origin main
else
  git clone "$REPO_URL" "$PROJECT_DIR"
  cd "$PROJECT_DIR"
fi

if [ ! -f .env.production ]; then
  cp .env.production.example .env.production
  echo "Edit ~/2212293-devops-project/.env.production with production DB credentials."
fi

cp .env.production .env
docker compose -f docker-compose.prod.yml up -d --build

echo "==> Deployment complete. Test with:"
echo "    curl http://$(curl -s http://checkip.amazonaws.com):8000/health"
#!/bin/bash
# One-time EC2 setup script — run on a fresh Ubuntu 22.04 instance
set -euo pipefail

REPO_URL="${1:-https://github.com/misbahmaqboolofficial/2212293-devops-project.git}"
PROJECT_DIR="$HOME/2212293-devops-project"

echo "==> Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose-plugin git
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER"

echo "==> Cloning repository..."
if [ -d "$PROJECT_DIR" ]; then
  cd "$PROJECT_DIR"
  git pull origin main
else
  git clone "$REPO_URL" "$PROJECT_DIR"
  cd "$PROJECT_DIR"
fi

if [ ! -f .env.production ]; then
  cp .env.production.example .env.production
  echo "Edit ~/2212293-devops-project/.env.production with production DB credentials."
fi

cp .env.production .env
docker compose -f docker-compose.prod.yml up -d --build

echo "==> Deployment complete. Test with:"
echo "    curl http://$(curl -s http://checkip.amazonaws.com):8000/health"
