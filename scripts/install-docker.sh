apt-get update && apt-get install --yes curl && curl -fsSL get.docker.com | bash
systemctl enable docker
systemctl start docker
docker login
