#!/bin/bash
# 未完成（部分代码参考自 lnmp.org 项目）


# add vhost
vhost_add()
{
    project="default"
    while :;do
        echo "Please enter Project Name (example: default): "
        read project
        if [ "${project}" != "" ]; then
            if [ -f "${NGINX_VHOST_DIR}/${project}.conf" ]; then
                echo "Project ${project} is exist, please check!"
                exit 1
            else
                echo "Your Project Name: ${project}"
            fi
            break
        else
            echo "Project Name cannot be empty"
        fi
    done

    domain=""
    while :;do
        echo "Enter domain name (example: qs5.org *.qs5.org): "
        read domain
        if [ "${domain}" != "" ]; then
            echo "Your Domain Names: ${domain}"
            break
        else
            echo "Domain Name cannot be empty"
        fi
    done

    echo "vhost add: $domain";
}


# route to fun
case "$2" in
    "add")   vhost_add ;;
    *)
    echo "Usage: des vhost {add}"
    ;;
esac
