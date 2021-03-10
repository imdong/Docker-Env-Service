ARG COMPOSE_PROJECT_NAME
FROM ${COMPOSE_PROJECT_NAME}_php74

# add oh-my-zsh
ARG PROXY
RUN apk --no-cache add git zsh zsh-vcs \
    && if [ "${PROXY}" != "" ]; then \
        echo "Set Proxy: ${PROXY}"; export http_proxy=${PROXY} && export https_proxy=${PROXY}; \
    fi \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 初始化脚本
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]