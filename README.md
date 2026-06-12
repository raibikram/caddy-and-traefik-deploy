# traefik-caddy-deployment

This repo contains a small Express API and example gateway configuration.
It also includes notes and examples for CI/CD and deployment to a VPS or EC2.

Start the API (use Docker Compose):

```bash
docker compose -f docker-compose.server.yml up -d --build
```

Start the gateway (Traefik):

```bash
docker compose -f docker-compose.api-getway.yml up -d --build
```

Start both together:

```bash
docker compose -f docker-compose.api-getway.yml -f docker-compose.server.yml up -d --build
```

Stop all services started by compose:

```bash
docker compose -f docker-compose.api-getway.yml -f docker-compose.server.yml down
```

Show logs for the API service:

```bash
docker compose -f docker-compose.server.yml logs -f
```