@echo off
echo === RAGFlow 自动启动脚本 ===
echo 正在检查并设置 vm.max_map_count...

:: 检查并设置 vm.max_map_count
wsl sysctl vm.max_map_count | findstr "262144" > nul
if errorlevel 1 (
    echo 正在设置 vm.max_map_count 为 262144...
    wsl sudo sysctl -w vm.max_map_count=262144
) else (
    echo vm.max_map_count 已正确设置为 262144
)

:: 进入 RAGFlow docker 目录并启动服务
echo 正在启动 RAGFlow 服务...
cd /d D:\REPO\ragflow\docker
docker compose -f docker-compose.yml up -d

:: 等待服务启动
echo 等待 RAGFlow 服务完全启动...
timeout /t 30 /nobreak > nul

:: 检查服务状态
docker ps | findstr "ragflow-server" > nul
if errorlevel 1 (
    echo RAGFlow 服务启动失败，请查看日志了解详情
    echo 可以使用命令: docker logs ragflow-server
) else (
    echo RAGFlow 服务已成功启动！
    echo 访问地址: http://localhost
)

echo === 启动脚本执行完毕 ===