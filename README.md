# Docker-Env-Server

DES 基于 Docker 的一键环境包，可以作为开发环境使用。

## 项目规划说明

前期计划支持如下环境：

- Nginx
- MariaDB
- PHP (7.3 / Composer)
- Redis
- MongoDB
- Node.js (npm)
- Certbot
- Golang

各目录/文件功能说明：

- `docker-compose.yml` Docker Compose 主配置文件
- `bin` 用于映射到系统无缝体验
- `build` 用于配置需要构建的 Docker 容器
- `conf` 各容器配置目录
- `data` 数据持久化统一储存
- `logs` 日志相关数据存储目录
- `projects` 项目代码目录
- `README.md` 本说明文档
- `sample.env` 配置文件模板，使用前请更名为 `.env`

## 常用命令

### 证书操作

- 创建证书: `certonly --noninteractive --agree-tos --cert-name {project_name} -m {email} -d {domain} -d...`
- 删除证书: `certbot delete`
- 证书续期: `certbot renew`
