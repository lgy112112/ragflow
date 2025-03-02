@echo off
echo === 停止 RAGFlow 服务 ===
cd /d D:\REPO\ragflow\docker
docker compose -f docker-compose.yml down
echo RAGFlow 服务已停止
pause