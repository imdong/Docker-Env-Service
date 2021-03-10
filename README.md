# Docker-Env-Server

DES 基于 Docker 的一键环境包，可以作为开发环境使用。

## 项目规划说明

前期计划支持如下环境：

- Nginx
- MariaDB
- PHP (7.4 / Composer)
- Redis
- MongoDB
- Certbot
- OhMyZsh (for php)

> 针对 mac 下磁盘效率低下问题，使用 nfs 方式优化文件加载速度。

## 各目录/文件功能说明：

- `docker-compose.yml` Docker Compose 主配置文件
- `bin` 用于映射到系统无缝体验
- `build` 用于配置需要构建的 Docker 容器
- `conf` 各容器配置目录
- `data` 数据持久化统一储存
- `logs` 日志相关数据存储目录
- `projects` 项目代码目录
- `README.md` 本说明文档
- `sample.env` 配置文件模板，使用前请更名为 `.env`

## 快捷命令

如需使用 `bin` 目录下的指令，需要在 `.baserc` or `.zshrc` 等文件中添加如下指令：
`export PATH="/pathto/Docker-Env-Service/bin":$PATH`

如需使用 `composer/bin` 需要在 `.baserc` or `.zshrc` 等文件中添加如下指令:
`export PATH=/pathto/Docker-Env-Service/data/composer/vendor/bin:$PATH`

如果你的默认 php 文件名不为 php，如为 `php73` 则要正常使用 `composer/vendor/bin` 有两个选择：

- 将 `php73` 更名为 `php`
- 修改 `composer/vendor/bin` 中每个文件的行首，将 `php` 改为 `php73`

## 常用命令

### 证书操作

- 创建证书: `certonly --noninteractive --agree-tos --cert-name {project_name} -m {email} -d {domain} -d...`
- 删除证书: `certbot delete`
- 证书续期: `certbot renew`
