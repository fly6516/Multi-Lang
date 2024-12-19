# 第一阶段：构建阶段
FROM dockerp.com/node:20-alpine AS builder

# 设置环境变量，避免交互式安装
ENV DEBIAN_FRONTEND=noninteractive

# 使用南京大学的 apk 源并安装构建工具
RUN sed -i 's|dl-cdn.alpinelinux.org|mirrors.nju.edu.cn|g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
    curl \
    git \
    build-base \
    openjdk11 \
    python3 \
    py3-pip \
    go \
    rust \
    ruby \
    php \
    ghc \
    perl \
    lua5.3 \
    && rm -rf /var/cache/apk/*

# 设置 npm 镜像源
RUN npm config set registry https://repo.nju.edu.cn/repository/npm/

# 安装 Node.js 依赖
WORKDIR /workspace
COPY . .
RUN npm install

# 第二阶段：运行阶段（极限小）
FROM dockerp.com/node:20-alpine

# 设置 npm 镜像源
RUN npm config set registry https://repo.nju.edu.cn/repository/npm/

# 使用南京大学的 apk 源并安装运行时依赖
RUN sed -i 's|dl-cdn.alpinelinux.org|mirrors.nju.edu.cn|g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
    curl \
    openjdk11 \
    python3 \
    go \
    rust \
    ruby \
    php \
    ghc \
    perl \
    lua5.3 \
    && rm -rf /var/cache/apk/*

# 从构建阶段复制必要文件
COPY --from=builder /workspace /workspace

# 设置工作目录
WORKDIR /workspace

# 默认启动 Bash
CMD ["bash"]
