#!/bin/bash

# 默认执行的操作
action="run --rm"

# 需要 exec 操作的容器
exec_containers=(
    "mongo"
    "mysql"
    "nginx"
    "php74"
    "redis"
)

# 要进入的容器名
container_name=$2

# 判断执行方式
if [[ "${exec_containers[@]}" =~ "${container_name}" ]]; then
    action="exec"
fi

# 判断使用什么 shell
shell="sh"
if [[ "php74" = "${container_name}" ]]; then
    shell="zsh"
fi

# 执行进入容器
docker-compose ${action} --workdir="${workdir}/${relative_path}" ${container_name} ${shell}