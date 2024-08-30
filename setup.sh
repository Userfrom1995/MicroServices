#!/bin/bash

# Directory you want to check
DIR="k9s"

# Git repository to clone
REPO="https://github.com/derailed/k9s.git"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Directory $
  DIR does not exist. Cloning repository..."
  git clone "$REPO"
else
  echo "Directory $DIR already exists. Skipping clone."
fi

cd k9s
make build && ./execs/k9s
cd ..
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
