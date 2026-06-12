# 2212293-devops-project

**Name:** Misbah Maqbool  
**Registration Number:** 2212293  
**Semester:** 8  
**Section:** B  

## Live URL
http://16.171.6.31:8000

## Architecture
- Web Service: FastAPI + Uvicorn (port 8000)
- Database: PostgreSQL 15 (named volume)
- CI Pipeline: GitHub Actions — flake8 + pytest
- CD Pipeline: GitHub Actions — SSH deploy to EC2
- Cloud Server: AWS EC2 t2.micro (Ubuntu)

## API Endpoints
- GET /health
- POST /students
- GET /students
- GET /students/{reg_no}

## Local Setup
1. Clone the repo
2. cp .env.example .env
3. docker compose up --build

## GitHub Secrets Required
- EC2_HOST
- EC2_SSH_KEY
