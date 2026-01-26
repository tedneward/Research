title=ocrbase
tags=backend, container, ocr, document, pdf
summary=PDF ->.MD/.JSON Document OCR and structured data extraction API server backend.
~~~~~~

[Source](https://github.com/majcheradam/ocrbase)

# Self-Hosting OCRBase

Complete guide for deploying OCRBase on your own infrastructure.

## Prerequisites

- [Bun](https://bun.sh/) installed globally
- Docker Desktop running

## PaddleOCR-VL Setup

OCRBase requires a running PaddleOCR-VL service. You can either use a hosted service or self-host it.

### Option 1: Self-Host with Docker Compose (Recommended)

**Requirements:** NVIDIA GPU with CUDA 12.6+, Docker 19.03+

1. Download the deployment files from [PaddleOCR GitHub](https://github.com/PaddlePaddle/PaddleOCR/tree/main/deploy/paddleocr_vl_docker/accelerators/gpu/):
   - `compose.yaml`
   - `.env`

2. Start the service:

   ```bash
   docker compose up
   ```

3. Wait for "Application startup complete" - the service will be available at `http://localhost:8080`

For detailed configuration options, see the [official PaddleOCR-VL documentation](https://www.paddleocr.ai/latest/en/version3.x/pipeline_usage/PaddleOCR-VL.html#41-method-1-deploy-using-docker-compose-recommended).

### Option 2: Use a Hosted Service

Set the `PADDLE_OCR_URL` environment variable to point to your hosted PaddleOCR instance.

## Quick Start

```bash
# Clone and install
git clone https://github.com/majcheradam/ocrbase
cd ocrbase
bun install

# Start infrastructure
docker compose up -d postgres redis minio paddleocr

# Setup database
bun run db:push

# Start API server + worker
bun run dev
```

The API will be available at `http://localhost:3000`.

## Environment Variables

Create a `.env` file in the root directory:

```bash
# Required
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/ocrbase
BETTER_AUTH_SECRET=your-secret-key-at-least-32-characters-long
BETTER_AUTH_URL=http://localhost:3000
CORS_ORIGIN=http://localhost:3001

# Redis
REDIS_URL=redis://localhost:6379

# S3/MinIO Storage
S3_ENDPOINT=http://localhost:9000
S3_REGION=us-east-1
S3_BUCKET=ocrbase
S3_ACCESS_KEY=minioadmin
S3_SECRET_KEY=minioadmin

# OCR Service
PADDLE_OCR_URL=http://localhost:8080

# Optional - LLM for data extraction
OPENROUTER_API_KEY=your-openrouter-api-key

# Optional - GitHub OAuth
GITHUB_CLIENT_ID=your-github-client-id
GITHUB_CLIENT_SECRET=your-github-client-secret
```

## Docker Deployment

For production, use Docker Compose:

```bash
docker compose up --build
```

## API Reference

### REST Endpoints

| Method   | Endpoint                 | Description        |
| -------- | ------------------------ | ------------------ |
| `GET`    | `/health/live`           | Liveness check     |
| `GET`    | `/health/ready`          | Readiness check    |
| `POST`   | `/api/jobs`              | Create OCR job     |
| `GET`    | `/api/jobs`              | List jobs          |
| `GET`    | `/api/jobs/:id`          | Get job            |
| `DELETE` | `/api/jobs/:id`          | Delete job         |
| `GET`    | `/api/jobs/:id/download` | Download result    |
| `POST`   | `/api/schemas`           | Create schema      |
| `GET`    | `/api/schemas`           | List schemas       |
| `GET`    | `/api/schemas/:id`       | Get schema         |
| `PATCH`  | `/api/schemas/:id`       | Update schema      |
| `DELETE` | `/api/schemas/:id`       | Delete schema      |
| `POST`   | `/api/schemas/generate`  | AI-generate schema |

### WebSocket

```
WS /ws/jobs/:jobId
```

Real-time job status updates. See SDK for type-safe usage.

### OpenAPI

Interactive documentation at: `http://localhost:3000/openapi`

## Project Structure

```
ocrbase/
├── apps/
│   ├── web/                 # Frontend (TanStack Start)
│   └── server/              # Backend API (Elysia)
│       ├── src/
│       │   ├── modules/     # Feature modules (jobs, schemas, health)
│       │   ├── plugins/     # Elysia plugins
│       │   ├── services/    # Core services (OCR, LLM, storage)
│       │   └── workers/     # Background job processors
├── packages/
│   ├── sdk/                 # TypeScript SDK (@ocrbase/sdk)
│   ├── auth/                # Authentication (Better-Auth)
│   ├── db/                  # Database schema (Drizzle)
│   ├── env/                 # Environment validation
│   └── paddleocr-vl-ts/     # PaddleOCR client
└── docker-compose.yml
```

## Scripts

| Command               | Description         |
| --------------------- | ------------------- |
| `bun run dev`         | Start all services  |
| `bun run dev:server`  | Start API only      |
| `bun run dev:web`     | Start frontend only |
| `bun run build`       | Build all packages  |
| `bun run check-types` | TypeScript checking |
| `bun run db:push`     | Push schema to DB   |
| `bun run db:studio`   | Open Drizzle Studio |
| `bun run db:migrate`  | Run migrations      |

## Tech Stack

| Layer         | Technology                                                    |
| ------------- | ------------------------------------------------------------- |
| Runtime       | [Bun](https://bun.sh/)                                        |
| API Framework | [Elysia](https://elysiajs.com/)                               |
| SDK           | [Eden Treaty](https://elysiajs.com/eden/treaty/overview.html) |
| Database      | PostgreSQL + [Drizzle ORM](https://orm.drizzle.team/)         |
| Queue         | Redis + [BullMQ](https://bullmq.io/)                          |
| Storage       | S3/MinIO                                                      |
| OCR           | [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR)        |
| Auth          | [Better-Auth](https://better-auth.com/)                       |
| Build         | [Turborepo](https://turbo.build/)                             |
