#!/bin/bash

pnpm install

echo "Setting up .env file..."

if [ ! -f .env ]; then
  cp .env.example .env
  echo ".env file created from .env.example"
fi

AUTH_SECRET=$(openssl rand -base64 32)

if grep -q "^AUTH_SECRET=" .env; then
  # Replace the existing AUTH_SECRET
  sed -i "s|^AUTH_SECRET=.*|AUTH_SECRET=$AUTH_SECRET|" .env
  echo "AUTH_SECRET replaced"
else
  # Append AUTH_SECRET if it doesn't exist
  echo "AUTH_SECRET=$AUTH_SECRET" >> .env
  echo "AUTH_SECRET appended"
fi

echo "Running seed..."

env $(grep -v '^\s*#' .env | xargs) pnpm dlx tsx ./app/seed/run.ts